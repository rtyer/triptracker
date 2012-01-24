#utils
Util = 
	currentLocation: (successCallback, errorCallback) -> 
		if Modernizr.geolocation
			navigator.geolocation.getCurrentPosition(successCallback,errorCallback,{enableHighAccuracy: true})
		else
			message = "browser does not support geolocation"
			console.log(message)
			errorCallback(message)
	watchPosition: (successCallback, errorCallback) ->
		if Modernizr.geolocation
			return navigator.geolocation.watchPosition(successCallback,errorCallback,{enableHighAccuracy: true})
		else
			message = "browser does not support geolocation"
			console.log(message)
			errorCallback(message)
	clearWatch: (watchId) ->
		if Modernizr.geolocation
			navigator.geolocation.clearWatch(watchId)
		else
			console.log("could not clear watch; geolocation not available")
	logPosition: (position) ->
		console.log("Latitude: " + position.coords.latitude + ", Longitude: " + position.coords.longitude)
	logWarning: () ->
		message = "There was a problem accessing geolocation capabilities of your browser"
		console.log(message)
		alert(message);

@app = window.app || {}
@app.Util = Util