require 'rake'

$LOAD_PATH << ['test', 'lib']

task :default => :test


task :test do
  Dir["test/*_test.rb"].each do |test_file|
    ruby test_file
  end
end
