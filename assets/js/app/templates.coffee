#templates
class Template
	@trip: _.template '''
		<div class="route">
			lat:  <%=lat%>
			long: <%=lng%>
		</div>
			'''
	@clock: _.template '''
		<div class="row-fluid">    
	      <h3 class="span8">
	        <%=duration%>
	      </h3>
	    </div> 
	'''
	@tripActionsStart: _.template '''
		<div class="row-fluid">        
	      <div class="span8">
	        <button class="btn startBtn">Start Trip</button> <button class="btn saveBtn">Save</button>
	      </div>
	    </div>
	'''
	@tripActionsStop: _.template '''
		<div class="row-fluid">        
	      <div class="span8">
			<button class="btn stopBtn">Stop Trip</button> <button class="btn saveBtn">Save</button>
	      </div>
	    </div>
	'''
	

@app = window.app ? {}
@app.Template = Template