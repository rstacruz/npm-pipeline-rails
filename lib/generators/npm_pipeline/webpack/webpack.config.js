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
        test: /\.scss$/,
        loader: ExtractTextPlugin.extract('style-loader', 'css-loader?-url&sourceMap!postcss-loader!sass-loader?sourceMap')
      },
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        loaders: [ 'babel-loader' ]
      },
    ],
  },

  resolve: {
    extensions: ['', '.js', '.jsx', '.css', '.scss']
  },

  postcss: [
    require('autoprefixer')(),
    require('postcss-asset-url-rails')()
  ],

  sassLoader: {
    includePaths: join(__dirname, 'node_modules'),
    outputStyle: 'compressed'
  },

  plugins: [
    new ExtractTextPlugin('[name].css.erb')
  ]
}
