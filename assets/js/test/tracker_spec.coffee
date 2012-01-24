app = window.app ? {}

class FakeLongLat
	latitude: 1
	longitude: 2

class FakePosition 
	coords: new FakeLongLat()

describe "Trip", ->
	beforeEach ->
		@trip = new app.Trip	
		jasmine.Clock.useMock()

	describe "starting the trip",->
		it "should report started status correctly", ->
			expect(@trip.isStarted()).toBeFalsy()
			@trip.start()
			expect(@trip.isStarted()).toBeTruthy()
			@trip.stop()

		it "should have a zero duration before starting", ->
			expect(@trip.get('duration')).toEqual(0)

		it "should have a non zero duration after starting", ->			
			@trip.start()									
			jasmine.Clock.tick(@trip.tickFrequency)
			expect(@trip.get('duration')).toEqual(@trip.tickFrequency)
			@trip.stop()

		it "should have no points before starting", ->
			expect(@trip.get('points')).not.toBeNull
			expect(@trip.get('points').size()).toEqual(0)
		
		it "should have a non zero points after starting", ->	
			spyOn(app.Util, 'watchPosition').andCallFake (success, failure) ->
				success(new FakePosition())
				success(new FakePosition())
				return 1
			spyOn(app.Util, 'clearWatch').andCallFake (watchId) ->
				return

			@trip.start()
			expect(@trip.get('points').size()).toEqual(2)

	describe "stopping the trip", ->
		it "should stop the duration increasing", ->
			@trip.start()
			
			jasmine.Clock.tick(@trip.tickFrequency)
			timeOne = @trip.get('duration')

			@trip.stop()

			jasmine.Clock.tick(@trip.tickFrequency)
			
			expect(timeOne).toEqual(@trip.tickFrequency)			
			expect(timeOne).toEqual(@trip.get('duration'))
	describe "", ->
		it "should", ->
			spyOn(app.Util, 'currentLocation').andCallFake (success, failure) ->
				console.log('here')
			app.Util.currentLocation(app.Util.logPosition, app.Util.logPosition)
	