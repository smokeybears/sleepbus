post "/trips/round" do
	content_type :json

 	trip = Trip.find_by(
		depart_date: Date.strptime(params["depart-date"], "%m/%d/%Y"),
		depart_city_id: params["departCityID"],
		end_city_id: params["arriveCityID"]
	)
	if trip && trip.seats_left >= params["number_of_adults"].to_i # serverside check for seat avaiblity
		return_trip = Trip.find_by(
			depart_date:  Date.strptime(params["return-date"], "%m/%d/%Y"),
			depart_city_id: params["arriveCityID"],
			end_city_id: params["departCityID"]
		)
		HTMLtemplate = erb :user_info_form,
			:layout => false,
			:locals => {
				trip_ids: [trip.id, return_trip.id],
				number_of_passengers: params["number_of_adults"]
			}
			status 200
		return HTMLtemplate.to_json
	else
		status 406
		return "Sorry Doesn't look like we have any more seats available on that route".to_json
	end

end

post "/trips/oneway" do

end

get "/trips/availability" do
	num_passengers = params["number_of_adults"].to_i
	depart_trips = Trip.where(depart_city_id: params["depart_city_id"], depart_date: Date.today..Date.today.to_time.advance(:months => 2).to_date)
	
	depart_trips = depart_trips.select do |trip_ob|
		num_passengers > trip_ob.seats_left
	end

	return_trips = Trip.where(depart_city_id: params["return_city_id"], depart_date: Date.today..Date.today.to_time.advance(:months => 2).to_date)
	return_trips = return_trips.select do |trip_ob|
		num_passengers > trip_ob.seats_left
	end
	content_type :json
	return [depart_trips, return_trips].to_json
end