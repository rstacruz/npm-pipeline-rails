# Motivation

Rails's asset pipeline was a great step forward for Rails 3. For today's requirements however, it doesn't always come with all the tools you need. Here's a portrait of Rails's shortcomings with respect to CSS/JS development in 2016:

* __npm assets:__ Frontend packages are now usually hosted in [npm], but there's no easy solution to integrate npm with Rails. Putting files into `vendor/assets` should be a thing of the past.

* __Auto-reload:__ Automatic CSS reloading can be done with [guard-livereload], but is unwieldy at best. They require too much configuration and mental overhead to maintain.

* __Modern CSS tools:__ Integrating modern CSS tools like [libsass] and [postcss] can be done, but is hackish and slow. It has to invoke a separate Node.js process for each CSS file rather than keeping those tools running in the background. Some newer CSS pre/post processors like [Myth](http://www.myth.io/) don't have production-grade integrations with Rails.

* __Modern JS tools:__ Working with complex frontends typically need [Webpack] or [Browserify]. While integrations for these exist, they can be slow and unreliable.

## Using Node.js

npm-pipeline-rails lets you outsource asset building complexities to Node.js-based tools, which is the gold stardard for asset tooling nowadays.

It doesn't lock you into one specific solution; you can use npm-pipeline-rails for any task manager. I recommend [Brunch] for its ease-of-use and familiarity with Rails's asset pipeline's features. [Gulp] and [Grunt] are also popular choices.

## Brunch

You can use [Brunch] with Rails with ease using npm-pipeline-rails. With Brunch, you get [automatic code reloading][auto-reload-brunch], easier integration with [postcss][postcss-brunch], `require()` support, and more. You may even hook [Browserify][browserify-brunch] if you need it.

[guard-livereload]: http://rubygems.org/gems/guard-livereload
[npm]: http://npmjs.com/
[libsass]: http://sass-lang.com/libsass
[postcss]: https://github.com/postcss/postcss
[auto-reload-brunch]: https://www.npmjs.com/package/auto-reload-brunch
[postcss-brunch]: https://www.npmjs.com/package/postcss-brunch
[browserify-brunch]: https://www.npmjs.com/package/browserify-brunch
[Grunt]: http://gruntjs.com/
[Brunch]: http://brunch.io/
