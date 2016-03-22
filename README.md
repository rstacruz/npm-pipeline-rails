## Usage

Add to your `Gemfile`.

```rb
gem 'npm-pipeline-rails'
```

Create a `package.json` with `start` and `build` commands.

Add compiled assets to `.gitignore`.

## Brunch example

### brunch-config.js

Set it up to watch `app/brunch`.

```js
// See http://brunch.io for documentation.
module.exports = {
  paths: {
    watched: ['app/brunch'],
    public: 'app/assets'
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
/app/assets/stylesheets/app.css
/app/assets/stylesheets/app.css.map
/app/assets/javascripts/app.js
/app/assets/javascripts/app.js.map
/public/assets
```

### app/assets/stylesheets/application.css

Set it up to include Brunch's built files.

```css
/*
 *= require app
 */
```

### app/assets/javascripts/application.js

Set it up to include Brunch's built files.

```css
//= require app
```
