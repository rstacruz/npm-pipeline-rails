# Brunch integration

Run `./bin/rails generate npm_pipeline:brunch`.

## Manual setup

If you don't want to use the generator, here's what it does.

### brunch-config.js

Set it up to watch source files in `app/brunch`, then put built files into `vendor/assets`.
[See example.](../lib/generators/npm_pipeline/brunch/brunch-config.js)

### package.json

Set it up with `brunch` and some basic plugins.
[See example.](../lib/generators/npm_pipeline/brunch/package.json)

### .gitignore

Set it up to ignore Brunch's built files.

```
/node_modules
/vendor/assets/stylesheets/brunch
/vendor/assets/javascripts/brunch
```

### app/assets/stylesheets/application.css

Set it up to include Brunch's built files. This will load from `vendor/assets/stylesheets`, as built by Brunch.

```css
/*
 *= require brunch/app
 */
```

### app/assets/javascripts/application.js

Set it up to include Brunch's built files. This will load from `vendor/assets/javascripts`, as built by Brunch.

```css
//= require brunch/app
```

### app/brunch/

Put your source files into `app/brunch`. For instance:

* `app/brunch/example.css`

  ```css
  * { color: blue }
  ```

* `app/brunch/example.js`

  ```js
  alert('it works!')
  ```
