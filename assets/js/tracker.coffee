#Main Application
$(document).ready ->
	@app = window.app ? {}

	class Tracker
		start:() ->			
			app.router = new app.TripTrackerRouter
			Backbone.history.start({pushState: true})
	
	@app.Tracker = new Tracker