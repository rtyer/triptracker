app = window.app ? {}

describe "Util", ->
	it "should be sane", ->
		expect(true).toBeTruthy()

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
