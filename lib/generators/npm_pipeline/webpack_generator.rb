require 'rails/generators/base'

module NpmPipeline
  module Generators
    class WebpackGenerator < Rails::Generators::Base
      desc 'Adds Webpack configuration via npm-pipeline-rails'
      source_root File.expand_path('../webpack', __FILE__)

      def create_package_json
        template 'package.json', 'package.json'
      end

      def create_webpack_config
        template 'webpack.config.js','webpack.config.js'
      end

      def update_assets
        append_to_file 'app/assets/stylesheets/application.css',
          "/*\n *= require webpack/app\n */\n"
        append_to_file 'app/assets/javascripts/application.js',
          "//= require webpack/app\n"
      end

      def create_sample_css
        [
          'app/webpack/css/app.js',
          'app/webpack/css/components/example.scss'
        ].each { |f| template f, f }
      end

      def create_sample_js
        [
          'app/webpack/js/app.js',
          'app/webpack/js/behaviors/example.js'
        ].each { |f| template f, f }
      end

      def update_gitignore
        append_to_file '.gitignore',
          "\n/node_modules" +
          "\n/vendor/assets/stylesheets/webpack" +
          "\n/vendor/assets/javascripts/webpack\n"
      end
    end
  end
end
