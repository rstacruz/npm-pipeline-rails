# Webpack integration

Run this to set your project up with a simple Webpack config.

```sh
./bin/rails generate npm_pipeline:webpack
```

## The default config

> _See:_ [sample webpack.config.js](../lib/generators/npm_pipeline/webpack/webpack.config.js)

This adds a Webpack configuration with sensible features for typical Rails apps.

__JavaScript:__ It will transpile ES2015 to compatible code using Babel. You'll also be able to use npm modules and `require()`, thanks to Webpack.

- [babel-loader](https://www.npmjs.com/package/babel-loader) for evergreen `.js` support

__CSS:__ It ships with Sass support along with some basic PostCSS plugins. You'll also be able to use `image-url()` and other Rails magic so you can take advantage of Rails's asset fingerprinting.

- [sass-loader](https://www.npmjs.com/package/sass-loader) for Sass support
- [postcss-loader](https://www.npmjs.com/package/postcss-loader) with:
  - [autoprefixer](https://www.npmjs.com/package/autoprefixer)
  - [postcss-asset-url-rails](https://www.npmjs.com/package/postcss-asset-url-rails) for `image-url()` support
- [extract-text-webpack-plugin](https://www.npmjs.com/package/extract-text-webpack-plugin) for `.css` file support

## Manual setup

If you don't want to use the generator, here's what it does.

#### package.json

> Set up `webpack` (et al) and some basic Webpack plugins.

```sh
npm init --yes
npm install --save-dev --save-exact webpack style-loader css-loader extract-text-webpack-plugin
```

You also need to set the `start` and `build` scripts.

```js
/* package.json */
"scripts": {
  "start": "webpack --progress --colors --watch",
  "build": "webpack --progress --colors"
}
```

_See:_ [sample package.json](../lib/generators/npm_pipeline/webpack/package.json)

#### webpack.config.js

> Set it up to watch source files in `app/webpack`, then put built files into `vendor/assets`.

_See:_ [sample webpack.config.js](../lib/generators/npm_pipeline/webpack/webpack.config.js),
[simplified webpack.config.js](../lib/generators/npm_pipeline/webpack/simple-webpack.config.js)

#### .gitignore

> Set it up to ignore Webpack's built files.

```
/node_modules
/vendor/assets/stylesheets/webpack
/vendor/assets/javascripts/webpack
```

#### app/assets/stylesheets/application.css

> Set it up to include Webpack's built files. This will load from `vendor/assets/stylesheets/webpack/app.css`, as built by webpack.

```css
/*
 *= require webpack/app
 */
```

#### app/assets/javascripts/application.js

> Set it up to include Webpack's built files. This will load from `vendor/assets/javascripts/webpack/app.js`, as built by webpack.

```css
//= require webpack/app
```

#### app/webpack/

> Put your source files into `app/webpack`. For instance:

* `app/webpack/app.js`

  ```js
  alert('it works!')
  ```

Be sure to point the proper `entry` points in the Webpack config.
