require 'rails/generators/base'

module NpmPipeline
  module Generators
    class BrunchGenerator < Rails::Generators::Base
      desc 'Adds Brunch configuration via npm-pipeline-rails'
      source_root File.expand_path('../brunch', __FILE__)

      def create_package_json
        template 'package.json', 'package.json'
      end

      def create_brunch_config
        template 'brunch-config.js', 'brunch-config.js'
      end

      def update_assets
        append_to_file 'app/assets/stylesheets/application.css',
          "/*\n *= require brunch/app\n */\n"
        append_to_file 'app/assets/javascripts/application.js',
          "//= require brunch/app\n"
      end

      def create_sample_brunch_css
        create_file 'app/brunch/example.css',
          %(html:before { content: 'Brunch assets added successfully! Edit app/brunch/example.css or remove it.'; display: block; padding: 20px; background: #ffc; color: #111; position: fixed; top: 16px; right: 16px; max-width: 600px; z-index: 10000; font-family: sans-serif; font-size: 14px; line-height: 1.6; }\n)
      end

      def create_sample_brunch_js
        create_file 'app/brunch/example.js',
          "alert('Brunch works!')"
      end

      def update_gitignore
        append_to_file '.gitignore',
          "\n/node_modules" +
          "\n/vendor/assets/stylesheets/brunch" +
          "\n/vendor/assets/javascripts/brunch\n"
      end
    end
  end
end
