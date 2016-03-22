# Brunch example

### brunch-config.js

Set it up to watch source files in `app/brunch`, then put built files into `vendor/assets`.

```js
// See http://brunch.io for documentation.
module.exports = {
  paths: {
    watched: ['app/brunch'],
    public: 'vendor/assets'
  },

  files: {
    javascripts: {joinTo: 'javascripts/app.js'},
    stylesheets: {joinTo: 'stylesheets/app.css'}
  }
}
```

### package.json

```js
{
  "name": "brunch-app",
  "description": "Description",
  "author": "Your Name",
  "version": "0.1.0",
  "scripts": {
    "start": "brunch watch",
    "build": "brunch build --production"
  },
  "dependencies": {},
  "devDependencies": {
    "brunch": "*",
    "javascript-brunch": "^2.0.0",
    "css-brunch": "^2.0.0",
    "uglify-js-brunch": "^2.0.0",
    "clean-css-brunch": "^2.0.0",
    "auto-reload-brunch": "^2.0.0"
  }
}
```

### .gitignore

Set it up to ignore Brunch's built files.

```
/vendor/assets/stylesheets/app.css
/vendor/assets/stylesheets/app.css.map
/vendor/assets/javascripts/app.js
/vendor/assets/javascripts/app.js.map
```

### app/assets/stylesheets/application.css

Set it up to include Brunch's built files. This will load from `vendor/assets/stylesheets`.

```css
/*
 *= require app
 */
```

### `app/assets/javascripts/application.js`

Set it up to include Brunch's built files. This will load from `vendor/assets/javascripts`.

```css
//= require app
```

### app/brunch

Put your source files into `app/brunch`. For instance:

* `app/brunch/hello.css`

  ```css
  * { color: blue }
  ```

* `app/brunch/hello.js`

  ```js
  alert('it works!')
  ```
