require 'rake/testtask'
require 'mongoid'
require 'mongoid_spacial'
require 'yaml'

require_relative 'app/models/point'
require_relative 'app/models/trip'

desc "Run unit tests"
task :test, :file do |task, args|
  puts args.file
  test_task = Rake::TestTask.new("unittests") do |t|
    if args.file
      t.pattern = args.file
    else
      t.pattern = "test/unit/*_test.rb"
    end
  end
  task("unittests").execute
end

namespace :test do
  desc "Run all tests"
  task :all do
    test_task = Rake::TestTask.new("all") do |t|
      t.pattern = "test/*/*_test.rb"
    end
    task("all").execute
  end

  desc "Run acceptance tests"
  task :acceptance do
    test_task = Rake::TestTask.new("acceptance") do |t|
      t.pattern = "test/acceptance/*_test.rb"
    end
    task("acceptance").execute
  end
end

namespace :db do
  desc "create indexes for mongo"
  task :create_indexes do

    ENV['RACK_ENV'] = ENV['RACK_ENV']?ENV['RACK_ENV']:'development'
    puts "ENV: #{ENV['RACK_ENV']}"

    Mongoid.load!("config/mongoid.yml")
    Trip.create_indexes()
  end

end