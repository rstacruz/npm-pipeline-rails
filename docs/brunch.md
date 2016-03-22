# Brunch example

Run `./bin/rails generate npm_pipeline:brunch`.

## Manual setup

If you don't want to use the generator, here's what it does.

### `brunch-config.js`

Set it up to watch source files in `app/brunch`, then put built files into `vendor/assets`.

```js
// See http://brunch.io for documentation.
module.exports = {
  paths: {
    watched: ['app/brunch'],
    public: 'vendor/assets'
  },

  files: {
    javascripts: {joinTo: 'javascripts/brunch/app.js'},
    stylesheets: {joinTo: 'stylesheets/brunch/app.css'}
  }
}
```

### `package.json`

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
    "brunch": "^2.5.1",
    "javascript-brunch": "^2.0.0",
    "css-brunch": "^2.0.0",
    "auto-reload-brunch": "^2.0.0"
  }
}
```

### `.gitignore`

Set it up to ignore Brunch's built files.

```
/vendor/assets/stylesheets/brunch/
/vendor/assets/javascripts/brunch/
```

### `app/assets/stylesheets/application.css`

Set it up to include Brunch's built files. This will load from `vendor/assets/stylesheets`, as built by Brunch.

```css
/*
 *= require brunch/app
 */
```

### `app/assets/javascripts/application.js`

Set it up to include Brunch's built files. This will load from `vendor/assets/javascripts`, as built by Brunch.

```css
//= require brunch/app
```

### `app/brunch`

Put your source files into `app/brunch`. For instance:

* `app/brunch/example.css`

  ```css
  * { color: blue }
  ```

* `app/brunch/example.js`

  ```js
  alert('it works!')
  ```
