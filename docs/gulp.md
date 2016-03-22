# Gulp integration

Run this to set your project up with a simple Gulp config.

```sh
./bin/rails generate npm_pipeline:gulp
```

## Manual setup

If you don't want to use the generator, here's what it does.

#### package.json

> Set up `gulp`, `gulp-cli`, and some basic Gulp plugins.

```sh
npm init --yes
npm install --save-dev gulp gulp-cli gulp-concat
```

_See:_ [sample package.json](../lib/generators/npm_pipeline/gulp/package.json)

#### gulpfile.js

> Set it up to watch source files in `app/gulp`, then put built files into `vendor/assets`.

_See:_ [sample gulpfile.js](../lib/generators/npm_pipeline/gulp/gulpfile.js)

#### .gitignore

> Set it up to ignore Gulp's built files.

```
/node_modules
/vendor/assets/stylesheets/gulp
/vendor/assets/javascripts/gulp
```

#### app/assets/stylesheets/application.css

> Set it up to include Gulp's built files. This will load from `vendor/assets/stylesheets/gulp/app.css`, as built by Gulp.

```css
/*
 *= require gulp/app
 */
```

#### app/assets/javascripts/application.js

> Set it up to include Gulp's built files. This will load from `vendor/assets/javascripts/gulp/app.js`, as built by Gulp.

```css
//= require gulp/app
```

#### app/gulp/

> Put your source files into `app/gulp`. For instance:

* `app/gulp/example.css`

 ```css
  * { color: blue }
  ```

* `app/gulp/example.js`

  ```js
  alert('it works!')
  ```
