#templates
class Template
	@trip: _.template '''
		<div class="route">
			lat:  <%=lat%>
			long: <%=lng%>
		</div>
			'''
	@clock: _.template '''
		<%=duration%>
	'''
	@tripActionsStart: _.template '''
		<button class="btn startBtn">Start Trip</button>
	'''
	@tripActionsStop: _.template '''
		<button class="btn stopBtn">Stop Trip</button>
	'''
	

@app = window.app ? {}
@app.Template = Template