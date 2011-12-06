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