#models
class Point extends Backbone.Model

class Points extends Backbone.Collection
	model: Point

class Trip extends Backbone.Model	
	tickFrequency: 	500		
	defaults: 
		duration:	0,
		started:	false,
		points:		new Points()
	initialize: ->
		# _.bindAll(this, 'tick') - replaced with fat arrow
	isStarted:() ->
		@get "started"
	tick:()=>
		@set duration:((@get "duration") + @tickFrequency)
	addPoint:(position) =>
		points = (@get 'points')
		location = [position.coords.longitude, position.coords.latitude]		
		points.add(new Point({
			location:location ,
			time:	  new Date()
		}))
		console.log('size:' + points.size())
		if(points.size() == 1)
			console.log('setting start_location: ' + location)
			@set 'start_location':location
	start:() ->
		@set started:true
		@intervalId = setInterval @tick, @tickFrequency
		@watchId = app.Util.watchPosition(@addPoint, app.Util.logWarning)		
	stop:()->
		clearInterval(@intervalId)	
		app.Util.clearWatch(@watchId)	

@app = window.app ? {}
@app.Trip = Trip
@app.Point = Point