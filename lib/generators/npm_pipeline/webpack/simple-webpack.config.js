/*
 * Simple Webpack config.
 * This has no Babel or PostCSS support.
 */

var webpack = require('webpack')
var join = require('path').join
var ExtractTextPlugin = require('extract-text-webpack-plugin')

module.exports = {
  context: __dirname,
  entry: {
    // JavaScript
    'javascripts/webpack/app': ['./app/webpack/js/app.js'],

    // Stylesheets
    'stylesheets/webpack/app': ['./app/webpack/css/app/app.js']
  },

  output: {
    path: join(__dirname, 'vendor/assets'),
    filename: '[name].js',
  },

  module: {
    loaders: [
      {
        test: /\.css$/,
        loader: ExtractTextPlugin.extract('style-loader', 'css-loader?-url&sourceMap')
      }
    ],
  },

  resolve: {
    extensions: ['', '.js']
  },

  plugins: [
    new ExtractTextPlugin('[name].css')
  ]
}
