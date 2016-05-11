require 'rails'
require 'rails/railtie'

module NpmPipelineRails
  module Utils
    module_function

    def log(str)
      puts "[npm-pipeline-rails] #{str}"
    end

    def do_system(commands)
      [*commands].each do |cmd|
        Utils.log "starting '#{cmd}'"
        system cmd
        Utils.log "'#{cmd}' exited with #{$?.exitstatus} status"
        exit $?.exitstatus unless $?.exitstatus == 0
      end
    end

    # Runs a block in the background. When the parent exits, the child
    # will be asked to exit as well.
    def background(name, &blk)
      pid = fork(&blk)

      at_exit do
        Utils.log "Terminating '#{name}' [#{pid}]"
        Process.kill 'TERM', pid
        Process.wait pid
      end
    end
  end

  class Railtie < ::Rails::Railtie
    config.npm = ActiveSupport::OrderedOptions.new
    config.npm.build = ['npm run build']
    config.npm.watch = ['npm run start']
    config.npm.install = ['npm install']

    rake_tasks do |app|
      namespace :assets do
        desc 'Build asset prerequisites using npm'
        task :npm_build do
          Utils.do_system app.config.npm.install
          Utils.do_system app.config.npm.build
        end

        task(:precompile).enhance ['npm_build']
      end
    end

    initializer 'npm_pipeline.watch' do |app|
      if ::Rails.env.development? && ::Rails.const_defined?(:Server)
        Utils.do_system app.config.npm.install
        [*app.config.npm.watch].each do |cmd|
          Utils.background(cmd) { Utils.do_system [cmd] }
        end
      end
    end
  end
end
