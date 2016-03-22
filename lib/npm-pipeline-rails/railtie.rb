require 'rails'
require 'rails/railtie'

module NpmPipelineRails
  class Railtie < ::Rails::Railtie
    config.npm = ActiveSupport::OrderedOptions.new

    config.npm.build = 'npm run build'
    config.npm.watch = 'npm run start'
    config.npm.install = 'npm install'

    rake_tasks do |app|
      describe 'Build assets prerequisites using npm'
      task :npm_build do
        system app.config.npm.install
        fork app.config.npm.build
      end

      task(:precompile).enhance ['npm_build']
    end

    initializer 'npm_pipeline.watch' do |app|
      puts '[npr] railtie initialized'
      if ::Rails.env.development? && ::Rails.const_defined?(:Server)
        system app.config.npm.install
        fork { system app.config.npm.watch }
      end
    end
  end
end

puts '[npr] railtie loaded'
