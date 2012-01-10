#utils
Util = 
	currentLocation: (successCallback, errorCallback) -> 
		if Modernizr.geolocation
			navigator.geolocation.getCurrentPosition(successCallback,errorCallback,{enableHighAccuracy: true})
		else
			message = "browser does not support geolocation"
			console.log(message)
			errorCallback(message)
	logPosition: (position) ->
		console.log("Latitude: " + position.coords.latitude + ", Longitude: " + position.coords.longitude)

@app = window.app || {}
@app.Util = Util