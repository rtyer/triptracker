#models

class Trip extends Backbone.Model	
	tickFrequency: 	500		
	defaults: 
		duration:	0,
		started:	false	
	initialize: ->
		# _.bindAll(this, 'tick') - replaced with fat arrow
	isStarted:() ->
		@get "started"
	tick:()=>
		@set duration:((@get "duration") + @tickFrequency)
	start:() ->
		@set started:true
		@intervalId = setInterval @tick, @tickFrequency
	stop:()->
		clearInterval(@intervalId)		
	
			
class Point extends Backbone.Model

@app = window.app ? {}
@app.Trip = Trip
@app.Point = Point