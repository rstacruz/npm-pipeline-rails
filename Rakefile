task :test_system do
  system 'cd examples/brunch && bundle exec rake assets:clean assets:precompile'
  exit $? unless $? == 0
  `grep "Brunch assets added successfully" examples/brunch/public/assets/application-*.css`
  exit $? unless $? == 0

  system 'cd examples/gulp && bundle exec rake assets:clean assets:precompile'
  exit $? unless $? == 0
  `grep "Gulp assets added successfully" examples/gulp/public/assets/application-*.css`
  exit $? unless $? == 0
end

task :default => :test_system
