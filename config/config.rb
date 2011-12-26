class TripTracker
   #Default Value, idiom is to explicity name it.  
   set :root, File.join(File.dirname(__FILE__), "..")

   #Enable the public folder to be able to show private data
   set :static, false  

   #Enable logging of requests to stderr
   set :logging, true if development?
   
   #Enable display of exceptions in dev
   set :show_exceptions, true if development?
   

    #Reloader setup
    configure :development do
      require "sinatra/reloader"
      register Sinatra::Reloader
      also_reload "app/**/*.rb"
    end
   
    configure do
      DB = Sequel.connect(ENV['DATABASE_URL']||'sqlite://trip.sqlite')
    end
   
end