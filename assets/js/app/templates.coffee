#templates
class Template
	@route: _.template '''
		<div class="route">
			lat:  <%=lat%>
			long: <%=lng%>
		</div>
			'''
	

@app = window.app ? {}
@app.Template = Template