/*
 * Webpack config with Babel, Sass and PostCSS support.
 */

var PROD = process.env.NODE_ENV === 'production'
var DEBUG = !PROD

var webpack = require('webpack')
var join = require('path').join
var ExtractTextPlugin = require('extract-text-webpack-plugin')
var LiveReloadPlugin = DEBUG ? require('webpack-livereload-plugin') : null

module.exports = {
  cache: true,

  context: __dirname,

  entry: {
    // JavaScript
    'javascripts/webpack/app': './app/webpack/js/app.js',

    // Stylesheets
    'stylesheets/webpack/app': './app/webpack/css/app.js',
  },

  output: {
    path: join(__dirname, 'vendor/assets'),
    filename: '[name].js',
    pathinfo: DEBUG ? true : false,
    devtoolModuleFilenameTemplate: 'webpack:///[absolute-resource-path]'
  },

  module: {
    loaders: [
      {
        test: /\.scss$/,
        loader: DEBUG
          ? ExtractTextPlugin.extract('style-loader', 'css-loader?-url&sourceMap&importLoaders=1!postcss-loader?sourceMap=inline!sass-loader?sourceMap')
          : ExtractTextPlugin.extract('style-loader', 'css-loader?-url!postcss-loader!sass-loader')
      },
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        loaders: [ 'babel-loader' ],
        query: {
          cacheDirectory: true
        }
      },
    ],
  },

  resolve: {
    extensions: ['', '.js', '.jsx']
  },

  postcss: [
    require('autoprefixer')(),
    require('postcss-asset-url-rails')()
  ],

  sassLoader: {
    includePaths: join(__dirname, 'node_modules'),
    outputStyle: DEBUG ? 'nested' : 'compressed'
  },

  plugins: [
    // allChunks will preserve source maps
    new ExtractTextPlugin('[name].css.erb', { allChunks: true }),

    // Ignore locales because it's around 400kb
    new webpack.IgnorePlugin(/^\.\/locale$/, /moment$/)
  ].concat(DEBUG ? [
    new LiveReloadPlugin({ appendScriptTag: true })
  ] : []),

  // Best trade-off with compatibility and speed
  devtool: DEBUG ? 'cheap-module-eval-source-map' : undefined,

  debug: DEBUG ? true : false
}
