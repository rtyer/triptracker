
window.getLocation = () ->
	if Modernizr.geolocation
		navigator.geolocation.getCurrentPosition(displayPosition,displayError,{enableHighAccuracy: true})
	else
		console.log("else - Nothing")

window.startWatch = () ->
	navigator.geolocation.watchPosition(displayPosition, displayError, { enableHighAccuracy: true})	

window.stopWatch = (id) ->
	console.log("clearing id " + id)
	navigator.geolocation.clearWatch(id)	

displayPosition = (position) ->
	console.log("Latitude: " + position.coords.latitude + ", Longitude: " + position.coords.longitude)

displayError = (error) ->
	console.log("Some shit went down: " + error)