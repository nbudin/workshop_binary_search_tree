$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))

task :test do
  require 'minitest/spec'
  require 'minitest/autorun'

  Dir['test/**/*_test.rb'].each do |test_file|
    require_relative test_file
  end
end