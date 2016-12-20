require 'rails/generators/base'

module NpmPipeline
  module Generators
    class GulpGenerator < Rails::Generators::Base
      desc 'Adds Gulp configuration via npm-pipeline-rails'
      source_root File.expand_path('../gulp', __FILE__)

      def create_package_json
        template 'package.json', 'package.json'
      end

      def create_gulpfile
        template 'gulpfile.js', 'gulpfile.js'
      end

      def update_assets
        append_to_file 'app/assets/stylesheets/application.css',
          "/*\n *= require gulp/app\n */\n"
        append_to_file 'app/assets/javascripts/application.js',
          "//= require gulp/app\n"
      end

      def create_sample_css
        create_file 'app/gulp/css/example.css',
          %(html:before { content: 'Gulp assets added successfully! Edit app/gulp/example.css or remove it.'; display: block; padding: 20px; background: #ffc; color: #111; position: fixed; top: 16px; right: 16px; max-width: 600px; z-index: 10000; font-family: sans-serif; font-size: 14px; line-height: 1.6; }\n)
      end

      def create_sample_js
        create_file 'app/gulp/js/example.js',
          "alert('Gulp works!')"
      end

      def update_gitignore
        append_to_file '.gitignore',
          "\n/node_modules" +
          "\n/vendor/assets/stylesheets/gulp" +
          "\n/vendor/assets/javascripts/gulp\n"
      end
    end
  end
end
