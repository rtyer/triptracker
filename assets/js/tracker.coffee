#Main Application
$(document).ready ->
	@app = window.app ? {}

	class Tracker
		start:() ->
			@app.router = new app.TripTrackerRouter
			#setup an event aggregator 