class TripTracker
  #Default Value, idiom is to explicity name it.  
  set :root, File.join(File.dirname(__FILE__), "..")

  #Enable the public folder to be able to show private data
  set :static, false  

  #Enable logging of requests to stderr
  set :logging, true if development?

  #Enable display of exceptions in dev
  set :show_exceptions, true if development?

  #Necessary change to support mongoid yml syntax of using :<< to pull defaults
  #See http://redmine.ruby-lang.org/issues/show/4300
  YAML::ENGINE.yamler= 'syck'

  #Reloader setup
  configure :development do
    require "sinatra/reloader"
    register Sinatra::Reloader
    also_reload "app/**/*.rb"
  end

  #Mongoid setup
  configure do
    Mongoid.load!("config/mongoid.yml")       
  end

  configure [:development, :test] do     
    Mongoid.logger = Logger.new($stdout)     
  end

  configure :production do
    Mongoid.logger = Logger.new($stdout, :warn)
  end

end