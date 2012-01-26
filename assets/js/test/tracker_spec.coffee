app = window.app ? {}

class FakeLongLat
	constructor:(@longitude, @latitude) ->

class FakePosition 
	constructor:(lng, lat) ->
		@coords = new FakeLongLat(lng, lat)	

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
			expect(@trip.get('duration')).toEqual(@trip.tickFrequency/1000)
			@trip.stop()

		it "should have no points before starting", ->
			expect(@trip.get('points')).not.toBeNull
			expect(@trip.get('points').size()).toEqual(0)		
		
		it "should have points set after starting", ->	
			spyOn(app.Util, 'watchPosition').andCallFake (success, failure) ->
				success(new FakePosition(3.45, 4.56))
				success(new FakePosition(3.46, 4.57))
				return 1
			spyOn(app.Util, 'clearWatch').andCallFake (watchId) ->
				return

			@trip.start()
			points = @trip.get('points')
			expect(points.size()).toEqual(2)
			expect(points.at(0).get('location')).toEqual([3.45, 4.56])
			@trip.stop()			

	describe "stopping the trip", ->
		it "should stop the duration increasing", ->
			@trip.start()
			
			jasmine.Clock.tick(@trip.tickFrequency)
			timeOne = @trip.get('duration')

			@trip.stop()

			jasmine.Clock.tick(@trip.tickFrequency)
			
			expect(timeOne).toEqual(@trip.tickFrequency/1000)			
			expect(timeOne).toEqual(@trip.get('duration'))
			
		it "should flip the started flag to false", ->
			@trip.start()

			@trip.stop()

			expect(@trip.isStarted()).toBeFalsy()


			