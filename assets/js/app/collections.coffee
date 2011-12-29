#collections

class Trips extends Backbone.Collection
	model: 	app.Trip
	url:	'/api/trips'

@app = window.app ? {}
@app.Trips = new Trips