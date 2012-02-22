#routers
$(document).ready ->
	class TripTrackerRouter extends Backbone.Router
		routes:
			'':'index'
			'trips/new':'showNew'
			'trips/:id':'show'

		initialize: ->
			@view = new app.AppView collection: app.Trips
		index:->
			console.log('index')
			new app.NewTripView(collection: app.Trips).render()
		showNew:->
			console.log('show new')
		show:(id) ->
			console.log("show: " + id)
		

	@app = window.app ? {}
	@app.TripTrackerRouter = TripTrackerRouter  	