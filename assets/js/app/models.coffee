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
		(@get 'points').add(new Point({
			location:[position.coords.longitude,position.coords.latitude],
			time:	  new Date()
		}))
	start:() ->
		@set started:true
		@intervalId = setInterval @tick, @tickFrequency
		@watchId = app.Util.watchPosition(@addPoint, app.Util.logWarning)		
	stop:()->
		@set started:false
		clearInterval(@intervalId)	
		app.Util.clearWatch(@watchId)	

@app = window.app ? {}
@app.Trip = Trip
@app.Point = Point