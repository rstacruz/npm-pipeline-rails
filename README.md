# npm-pipeline-rails

> Use npm as part of your Rails asset pipeline

npm-pipeline-rails allows you to use any toolchain to bulid your asset files. This allows you to:

- Use [webpack][] with Rails
- Use [brunch][] with Rails ([instructions](docs/brunch.md))
- Use [browserify][] with Rails
- Use any other asset tool with Rails

[webpack]: https://webpack.github.io/
[brunch]: http://brunch.io/
[browserify]: http://browserify.org/

> ![](docs/screenshots/full.png)

## Usage

* Add to your `Gemfile`.

  ```rb
  gem 'npm-pipeline-rails'
  ```

* Create a `package.json` with `start` and `build` commands.

* Add compiled assets to `.gitignore`.

## Configuration

npm-pipeline-rails provides these configuration options:

```rb
# These are defaults; in most cases, you don't need to configure anything.

Rails.application.configure do
  # Command to install dependencies
  config.npm.install = 'npm install'

  # Command to build production
  config.npm.build = 'npm run build'

  # Command to start a file watcher
  config.npm.watch = 'npm run start'
end
```

## How it works

npm-pipeline-rails allows you to hook certain commands, usually npm scripts, during the Rails app lifecycle. It assumes that your tool will build plain JS and CSS files into `vendor/assets`, allowing it to be picked up by Rails's asset pipeline.

#### In development

When starting a Rails development server (`bundle exec rails s`), it runs the `install` command. After that, it starts a background process that runs your `watch` command.

#### In production

When running `rake assets:precompile`, it will first run the `install` command then the `build` command.

## Integration examples

* [Brunch](docs/brunch.md)
* more to come soon

## Thanks

**npm-pipeline-rails** © 2016+, Rico Sta. Cruz. Released under the [MIT] License.<br>
Authored and maintained by Rico Sta. Cruz with help from contributors ([list][contributors]).

> [ricostacruz.com](http://ricostacruz.com) &nbsp;&middot;&nbsp;
> GitHub [@rstacruz](https://github.com/rstacruz) &nbsp;&middot;&nbsp;
> Twitter [@rstacruz](https://twitter.com/rstacruz)

[MIT]: http://mit-license.org/
[contributors]: http://github.com/rstacruz/npm-pipeline-rails/contributors
