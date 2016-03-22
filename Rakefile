task :test_system do
  system 'cd examples/brunch && bundle exec rake assets:clean assets:precompile'
  exit $?.exitstatus unless $?.exitstatus == 0
  `grep "Brunch assets added successfully" examples/brunch/public/assets/application-*.css`
  exit $?.exitstatus unless $?.exitstatus == 0

  system 'cd examples/gulp && bundle exec rake assets:clean assets:precompile'
  exit $?.exitstatus unless $?.exitstatus == 0
  `grep "Gulp assets added successfully" examples/gulp/public/assets/application-*.css`
  exit $?.exitstatus unless $?.exitstatus == 0
end

task :default => :test_system
