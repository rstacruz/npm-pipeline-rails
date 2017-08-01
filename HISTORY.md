## [v1.8.1]
> Aug  1, 2017

- Webpack generator: prevent loading `webpack-livereload-plugin` in the default Webpack config to prevent deployment errors.

[v1.8.1]: https://github.com/rstacruz/npm-pipeline-rails/compare/v1.8.0...v1.8.1

## [v1.8.0]
> May 24, 2017

- [#18] - Add Webpack support via `./bin/rails g npm_pipeline:webpack`.

[v1.8.0]: https://github.com/rstacruz/npm-pipeline-rails/compare/v1.7.0...v1.8.0

## [v1.7.0]
> Dec 20, 2016

- [#12] - Implement `config.npm.install_on_rails_server` to suppress `npm install` on Rails server startup. ([@mikker])

[v1.7.0]: https://github.com/rstacruz/npm-pipeline-rails/compare/v1.6.2...v1.7.0

## [v1.6.2]
> Oct 14, 2016

- [#11] - Fix `rails generate npm_pipeline:gulp` not giving a working setup. ([@aka-cronos])

[v1.6.2]: https://github.com/rstacruz/npm-pipeline-rails/compare/v1.6.1...v1.6.2

## [v1.6.1]
> May 27, 2016

- [#5] - Fix 'no such process' errors when pressing `^C`. ([#10], [@mikker])

[v1.6.1]: https://github.com/rstacruz/npm-pipeline-rails/compare/v1.6.0...v1.6.1

## [v1.6.0]
> May 27, 2016

- [#9] - Add a `config.npm.install_on_asset_precompile` option to optimize deploy times.

[v1.6.0]: https://github.com/rstacruz/npm-pipeline-rails/compare/v1.5.0...v1.6.0

## [v1.5.0]
> May 24, 2016

- [#7] - Add a `config.npm.enable_watch` flag. ([@jasontorres])

[v1.5.0]: https://github.com/rstacruz/npm-pipeline-rails/compare/v1.4.0...v1.5.0

## [v1.4.0]
> Apr 20, 2016

- [#3] - Prevent orphaned processes from accumulating. ([#4])

[v1.4.0]: https://github.com/rstacruz/npm-pipeline-rails/compare/v1.3.0...v1.4.0

## [v1.3.0]
> Apr 11, 2016

- [#1] - Update support for Rails 5. ([@victorsolis])
- [#1] - Fix issues with gitignore files that don't have a new line at the end. ([@victorsolis])

[v1.3.0]: https://github.com/rstacruz/npm-pipeline-rails/compare/v1.2.0...v1.3.0

## [v1.2.0]
> Mar 23, 2016

- Add experimental support for Rails 5.

[v1.2.0]: https://github.com/rstacruz/npm-pipeline-rails/compare/v1.1.3...v1.2.0

## [v1.1.3]
> Mar 22, 2016

- Fix "TypeError: no implicit conversion of Process::Status into Integer" error.

[v1.1.3]: https://github.com/rstacruz/npm-pipeline-rails/compare/v1.1.2...v1.1.3

## [v1.1.2]
> Mar 22, 2016

- Make the gem package smaller; no functional changes.

[v1.1.2]: https://github.com/rstacruz/npm-pipeline-rails/compare/v1.1.1...v1.1.2

## [v1.1.1]
> Mar 22, 2016

- Update documentation and gem description; no functional changes.

[v1.1.1]: https://github.com/rstacruz/npm-pipeline-rails/compare/v1.1.0...v1.1.1

## [v1.1.0]
> Mar 22, 2016

- Add Gulp generator (`rails g npm_pipeline:gulp`).

[v1.1.0]: https://github.com/rstacruz/npm-pipeline-rails/compare/v1.0.0...v1.1.0

## [v1.0.0]
> Mar 22, 2016

- Initial release.

[v1.0.0]: https://github.com/rstacruz/npm-pipeline-rails/tree/v1.0.0
[#1]: https://github.com/rstacruz/npm-pipeline-rails/issues/1
[#3]: https://github.com/rstacruz/npm-pipeline-rails/issues/3
[#4]: https://github.com/rstacruz/npm-pipeline-rails/issues/4
[#5]: https://github.com/rstacruz/npm-pipeline-rails/issues/5
[#7]: https://github.com/rstacruz/npm-pipeline-rails/issues/7
[#9]: https://github.com/rstacruz/npm-pipeline-rails/issues/9
[#10]: https://github.com/rstacruz/npm-pipeline-rails/issues/10
[@jasontorres]: https://github.com/jasontorres
[@victorsolis]: https://github.com/victorsolis
[@mikker]: https://github.com/mikker
[#11]: https://github.com/rstacruz/npm-pipeline-rails/issues/11
[#12]: https://github.com/rstacruz/npm-pipeline-rails/issues/12
[#18]: https://github.com/rstacruz/npm-pipeline-rails/issues/18
[@aka-cronos]: https://github.com/aka-cronos
