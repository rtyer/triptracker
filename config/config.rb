class TripTracker
   #Default Value, idiom is to explicity name it.  
   set :root, File.join(File.dirname(__FILE__), "..")

   #Enable the public folder to be able to show private data
   set :static, true  

   #Enable logging of requests to stderr
   set :logging, true if development?
   
   #Enable display of exceptions in dev
   set :show_exceptions, true if development?
   
   register Sinatra::AssetPack
   
   assets {
       serve '/js',     from: 'assets/js'        # Optional
       serve '/css',    from: 'assets/css'       # Optional
       serve '/images', from: 'assets/images'    # Optional

       # The second parameter defines where the compressed version will be served.
       # (Note: that parameter is optional, AssetPack will figure it out.)
       js :app, '/js/app.js', [
         '/js/lib/*.js',
         '/js/app/test.js',
         '/js/app/app.js'
       ]

       css :application, '/css/application.css', [
         '/css/screen.css'
       ]

       js_compression  :jsmin         # Optional
       css_compression :simple        
       # # Optional
     }
   
    #Reloader setup
    configure :development do
      require "sinatra/reloader"
      register Sinatra::Reloader
      also_reload "app/**/*.rb"
      also_reload "/js/**/*.js"
      also_reload "/css/**/*.css"
    end
   
    configure do
      DB = Sequel.connect(ENV['DATABASE_URL']||'sqlite://trip.sqlite')
    end
   
end