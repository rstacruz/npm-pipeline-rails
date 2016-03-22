require 'rails'
require 'rails/railtie'

module NpmPipelineRails
  class Railtie < ::Rails::Railtie
    config.npm = ActiveSupport::OrderedOptions.new

    config.npm.build = 'npm run build'
    config.npm.watch = 'npm run start'
    config.npm.install = 'npm install'

    rake_tasks do |app|
      namespace :assets do
        desc 'Build assets prerequisites using npm'
        task :npm_build do
          system app.config.npm.install
          exit $? unless $? == 0
          system app.config.npm.build
          exit $? unless $? == 0
        end

        task(:precompile).enhance ['npm_build']
      end
    end

    initializer 'npm_pipeline.watch' do |app|
      if ::Rails.env.development? && ::Rails.const_defined?(:Server)
        system app.config.npm.install
        exit $? unless $? == 0
        fork { system app.config.npm.watch }
      end
    end
  end
end
