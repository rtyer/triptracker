#models
class Point extends Backbone.Model

class Points extends Backbone.Collection
	model: Point

class Trip extends Backbone.Model	
	tickFrequency: 	500		
	started: 		false
	defaults: 
		duration:	0,
		points:		new Points()
	isStarted:() ->
		@started
	tick:()=>
		@set duration:((@get "duration") + (@tickFrequency/1000))
	addPoint:(position) =>		
		(@get 'points').add(new Point({
			location:[position.coords.longitude,position.coords.latitude],
			time:	  new Date()
		}))
	start:() ->
		@started = true
		@trigger 'change:started'
		@intervalId = setInterval @tick, @tickFrequency
		@watchId = app.Util.watchPosition(@addPoint, app.Util.logWarning)		
	stop:()->
		@started = false
		@trigger 'change:started'
		clearInterval(@intervalId)	
		app.Util.clearWatch(@watchId)	

@app = window.app ? {}
@app.Trip = Trip
@app.Point = Point