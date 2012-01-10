#routers
$(document).ready ->
	class TripTrackerRouter extends Backbone.Router
		initialize: ->
			@view = new app.AppView collection: app.Trips
		

	@app = window.app ? {}
	@app.TripTrackerRouter = TripTrackerRouter  	