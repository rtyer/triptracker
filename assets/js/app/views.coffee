#views
$(document).ready ->
	@app = window.app ? {}

	class AppView extends Backbone.View
    	el: '#container'
    	initialize: (options) ->
      		@collection.bind 'reset', @render, @
      		@subviews = [
        		new RouteView(collection: @collection)
        	]
        		# new DateTitleView collection: @collection
        		# new TasksView     collection: @collection
        		# new NewTaskView   collection: @collection
        	# ]
    	render: ->
      		$(@el).empty()
      		$(@el).append subview.render().el for subview in @subviews
      		@

    @app.AppView = AppView

  class ClockView extends Backbone.View
    class: 'clock'
    tagName: 'h3'    
    initialize: ->
      @model.on 'change:duration', @render, @
    render: ->
      $(@el).html app.Template.clock(@model.toJSON())
      @
  @app.ClockView = ClockView

  class TripActions extends Backbone.View
    class: "actions"
    tagName: "div"    
    initialize: ->
      @model.on 'change:started', @render, @
    events:
      'click .startBtn': 'startTrip'
      'click .stopBtn': 'stopTrip'
    render: ->
      if(@model.isStarted())
        $(@el).html app.Template.tripActionsStop()
        @
      else
        $(@el).html app.Template.tripActionsStart()      
        @
    startTrip: () ->
      @model.start()
    stopTrip: () ->
      @model.stop()    
  
  @app.TripActions = TripActions
 
	class TripView extends Backbone.View
		className: 'trip'
		render: ->			
	    	$(@el).html app.Template.route(@model.toJSON())
	    	@