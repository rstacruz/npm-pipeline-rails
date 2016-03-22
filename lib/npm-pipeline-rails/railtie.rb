require 'rails'
require 'rails/railtie'

module NpmPipelineRails
  module Utils
    def do_system(commands)
      [*commands].each do |cmd|
        system cmd
        exit $? unless $? == 0
      end
    end
  end

  class Railtie < ::Rails::Railtie
    include ::NpmPipelineRails::Utils

    config.npm = ActiveSupport::OrderedOptions.new
    config.npm.build = ['npm run build']
    config.npm.watch = ['npm run start']
    config.npm.install = ['npm install']

    rake_tasks do |app|
      namespace :assets do
        desc 'Build asset prerequisites using npm'
        task :npm_build do
          do_system app.config.npm.install
          do_system app.config.npm.build
        end

        task(:precompile).enhance ['npm_build']
      end
    end

    initializer 'npm_pipeline.watch' do |app|
      if ::Rails.env.development? && ::Rails.const_defined?(:Server)
        do_system app.config.npm.install
        [*app.config.npm.watch].each do |cmd|
          fork { do_system [cmd] }
        end
      end
    end
  end
end
