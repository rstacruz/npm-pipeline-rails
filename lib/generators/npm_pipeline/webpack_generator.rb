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
        template 'webpack.config.js', 'webpack.config.js'
      end

      def update_assets
        append_to_file 'app/assets/stylesheets/application.css',
          "/*\n *= require webpack/app\n */\n"
        append_to_file 'app/assets/javascripts/application.js',
          "//= require webpack/app\n"
      end

      def create_sample_css
        create_file 'app/webpack/css/app.js', [
          '// http://stackoverflow.com/a/30652110/873870',
          'function requireAll (r) { r.keys().forEach(r) }',
          '',
          "requireAll(require.context('./components/', true, /\.scss$/))"
        ].join("\n")

        create_file 'app/webpack/css/components/example.scss',
          %(html:before { content: 'Webpack assets added successfully! Edit app/gulp/example.css or remove it.'; display: block; padding: 20px; background: #ffc; color: #111; position: fixed; top: 16px; right: 16px; max-width: 600px; z-index: 10000; font-family: sans-serif; font-size: 14px; line-height: 1.6; }\n)
      end

      def create_sample_js
        create_file 'app/webpack/js/app.js', [
          '// http://stackoverflow.com/a/30652110/873870',
          'function requireAll (r) { r.keys().forEach(r) }',
          '',
          "requireAll(require.context('./behaviors/', true, /\.js$/))"
        ].join("\n")

        create_file 'app/webpack/js/behaviors/example.js',
          "alert('Webpack works!')"
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
