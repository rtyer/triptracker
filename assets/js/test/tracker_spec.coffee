app = window.app ? {}

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

	describe "stopping the trip", ->
		it "should stop the duration increasing", ->
			@trip.start()
			
			jasmine.Clock.tick(@trip.tickFrequency)
			timeOne = @trip.get('duration')

			@trip.stop()

			jasmine.Clock.tick(@trip.tickFrequency)
			
			expect(timeOne).toEqual(@trip.tickFrequency)			
			expect(timeOne).toEqual(@trip.get('duration'))
		it "should spy like a mfer", ->
			spyOn(app.Util, 'currentLocation').andCallFake (success, failure) ->
				console.log('here')
			app.Util.currentLocation(app.Util.logPosition, app.Util.logPosition)
	