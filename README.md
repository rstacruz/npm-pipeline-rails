# npm-pipeline-rails

> Use npm as part of your Rails asset pipeline

npm-pipeline-rails allows you to use any toolchain to bulid your asset files in [Rails] 4.2+. This allows you to:

- Use [Brunch][] with Rails ([instructions](docs/brunch.md))
- Use [Gulp][] with Rails ([instructions](docs/gulp.md))
- Use [Grunt][] with Rails
- Use [Webpack][] with Rails
- Use [Browserify][] with Rails
- Use any other asset tool with Rails

[Rails]: http://rubyonrails.org/
[Webpack]: https://webpack.github.io/
[Brunch]: http://brunch.io/
[Browserify]: http://browserify.org/
[Gulp]: http://gulpjs.com/
[Grunt]: http://gruntjs.com/

<br>

![](docs/screenshots/full.png)

> _See [§ How it Works](#how-it-works) for an explanation of the diagram above._

<br>

## Usage

Add this line below to your `Gemfile`. After that, proceed with an automated or manual setup.

```rb
gem 'npm-pipeline-rails'
```

#### Automated setup

Use the generators for your preferred build tool:

- __[Brunch](docs/brunch.md)__ - `./bin/rails generate npm_pipeline:brunch`
- __[Gulp](docs/gulp.md)__ - `./bin/rails generate npm_pipeline:gulp`

#### Manual setup

* Create a `package.json` with `start` and `build` scripts. ([See example](lib/generators/npm_pipeline/brunch/package.json))
* Add your expected compiled assets to `.gitignore`.

<br>

## Configuration

npm-pipeline-rails provides these configuration options:

```rb
# These are defaults; in most cases, you don't need to configure anything.

Rails.application.configure do
  # Command to install dependencies
  config.npm.install = ['npm install']

  # Command to build production assets
  config.npm.build = ['npm run build']

  # Command to start a file watcher
  config.npm.watch = ['npm run start']

  # The commands are arrays; you may add more commands as needed:
  config.npm.watch = [
    'npm run webpack:start',
    'npm run brunch:start'
  ]
end
```

<br>

## How it works

npm-pipeline-rails allows you to hook certain commands, usually npm scripts, during the Rails app lifecycle. It assumes that your tool will build plain JS and CSS files into `vendor/assets`, allowing it to be picked up by Rails's asset pipeline.

It does __not__ replace the Rails asset pipeline, but rather it works with it. The files you build with your npm pipeline will be available as regular files in the Rails asset pipeline.

#### In development

When starting a Rails development server (`bundle exec rails s`), it runs the `install` command. After that, it starts a background process that runs your `watch` command.

#### In production

When running `rake assets:precompile`, it will first run the `install` command then the `build` command.

#### More info

Consult [railtie.rb](https://github.com/rstacruz/npm-pipeline-rails/blob/master/lib/npm-pipeline-rails/railtie.rb) for the actual code that makes all these happen.

<br>

## Motivation

Rails's asset pipeline was a great step forward for Rails 3. For today's requirements however, it doesn't always come with all the tools you need. npm-pipeline-rails lets you outsource asset building complexities to Node.js-based tools.

> __[Read more →](docs/motivation.md)__

<br>

## Thanks

**npm-pipeline-rails** © 2016+, Rico Sta. Cruz. Released under the [MIT] License.<br>
Authored and maintained by Rico Sta. Cruz with help from contributors ([list][contributors]).

> [ricostacruz.com](http://ricostacruz.com) &nbsp;&middot;&nbsp;
> GitHub [@rstacruz](https://github.com/rstacruz) &nbsp;&middot;&nbsp;
> Twitter [@rstacruz](https://twitter.com/rstacruz)

[MIT]: http://mit-license.org/
[contributors]: http://github.com/rstacruz/npm-pipeline-rails/contributors
