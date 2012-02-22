#views
$(document).ready ->
	@app = window.app ? {}

	class AppView extends Backbone.View
    	el: '#app'
    	initialize: (options) ->
      		@collection.bind 'reset', @render, @
      		@subviews = [
        		new NewTripView(collection: @collection)
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
  
  class NewTripView extends Backbone.View
    el: "#container"
    tagName: "div"
    initialize: ->    
      @model = new app.Trip  
      @subviews = [
        new ClockView model: @model
        new ActionsView {model: @model, collection: @collection}
      ]
    render: ->
      $(@el).empty()
      $(@el).append subview.render().el for subview in @subviews
      @
    sup: ->
      console.log('change baby')

  @app.NewTripView = NewTripView

  class ClockView extends Backbone.View
    class: "row-fluid"
    tagName: "div"   
    initialize: ->
      @model.on 'change:duration', @render, @
    render: ->
      $(@el).html app.Template.clock(@model.toJSON())
      @
  @app.ClockView = ClockView

  class ActionsView extends Backbone.View
    class: "row-fluid"
    tagName: "div"    
    initialize: ->
      @model.on 'change:started', @render, @
    events:
      'click .startBtn': 'startTrip'
      'click .stopBtn': 'stopTrip'
      'click .saveBtn': 'saveTrip'
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
    saveTrip: () =>
      @collection.create(@model.attributes)
      
  @app.ActionsView = ActionsView

  class MapView extends Backbone.View
    class: "mapView"
    tagName: "div"
    initialize: ->
      @model.on 'change:points', @render, @
    render: ->
      console.debug("render")
      @
      
  @app.MapView = MapView
