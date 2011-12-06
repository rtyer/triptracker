require 'rake/testtask'

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
  require 'sequel'
  
  namespace :migrate do
    Sequel.extension :migration
    DB = Sequel.connect(ENV['DATABASE_URL']||'sqlite://trip.sqlite')
    
    desc "Perform migration reset (clean)"
    task :reset do
      Sequel::Migrator.run(DB, "migrations", :target => 0)
      puts "sequel migration rest executed"      
    end
    
    desc "Perform migration up/down to VERSION"
    task :to do
      version = ENV['VERSION'].to_i
      raise "No VERSION was provided" if version.nil?
      Sequel::Migrator.run(DB, "migrations", :target => version)
      puts "migrate to version #{version} executed"
    end
    
    desc "Perform migration up to latest migration available"
    task :up do
      Sequel::Migrator.run(DB, "migrations")
      puts "migrate to latest executed"
    end
    
    desc "perform migration down (erase all data)"
    task :down do 
      Sequel::Migrator.run(DB, "migrations", :target => 0)
      puts "migrate down executed"
    end
  end
end