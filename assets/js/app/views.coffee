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

  class StopWatchView extends Backbone.View
    class: 'stopwatch'
    render: ->
      $(@el).html app.Template.stopWatch(@model.toJSON())
      @
    
	class RouteView extends Backbone.View
		className: 'route'
		render: ->			
	    	$(@el).html app.Template.route(@model.toJSON())
	    	@