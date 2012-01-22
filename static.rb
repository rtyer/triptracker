require 'bundler'
Bundler.require

class Static < Sinatra::Base
	set :root, File.dirname(__FILE__)

	#Enable the public folder to be able to show private data
	set :static, false  

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
		 '/js/lib/zepto.js',
		 '/js/lib/underscore.js',
		 '/js/lib/backbone.js',
		 '/js/lib/modernizr-latest.js',
		 '/js/app/utils.js',
		 '/js/app/models.js',
		 '/js/app/collections.js',
		 '/js/app/views.js',
		 '/js/app/routers.js',
		 '/js/tracker.js'
		]

		css :application, '/css/application.css', [
		 '/css/bootstrap.css',
		 '/css/test.css'
		]

		js :test, 'js/test.js', [
			'/js/test/jasmine.js',
			'/js/test/jasmine-html.js',
			'/js/test/tracker_spec.js'
		]
		
		css :test, '/css/test.css', [
			'/css/jasmine.css'
		]

		js_compression  :closure, :level => "SIMPLE_OPTIMIZATIONS"
		css_compression :simple        
	
	}
   
    #Reloader setup
    configure :development do
		require "sinatra/reloader"
		register Sinatra::Reloader
		also_reload "/js/**/*.js"
		also_reload "/css/**/*.css"
    end

    #view paths
	get '/' do
		erb :index, :format=>:html5
	end

	get '/spec' do
		erb :spec_runner, :format=>:html5
	end
end