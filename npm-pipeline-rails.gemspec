# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'npm-pipeline-rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'npm-pipeline-rails'
  spec.version       = NpmPipelineRails::VERSION
  spec.authors       = ['Rico Sta. Cruz']
  spec.email         = ['rstacruz@users.noreply.github.com']

  spec.summary       = 'Use npm as part of your Rails asset pipeline'
  spec.description   = 'Use any toolchain to bulid your asset files in Rails 4.2. Integrate Brunch, Gulp, Grunt, Webpack, Browserify and others seamlessly into Rails apps.'
  spec.homepage      = 'https://github.com/rstacruz/npm-pipeline-rails'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(docs|examples|test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'railties', '>= 4.0.0', '< 6.0.0'
  spec.add_runtime_dependency 'sprockets', '~> 3.5'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rails', '>= 4.2', '< 5.1'
end
