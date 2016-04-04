post "/trips" do
	content_type :json
 	trip = Trip.find_by(
		depart_date: Date.parse(params["depart-date"]),
		depart_city_id: params["departCityID"],
		end_city_id: params["arriveCityID"]
	)
	if trip
		return_trip = Trip.find_by(
			depart_date: Date.parse(params["arrive-date"]),
			depart_city_id: params["arriveCityID"],
			end_city_id: params["departCityID"]
		)
		HTMLtemplate = erb :user_info_form, 
			:layout => false, 
			:locals => {
				trip_ids: [trip.id, return_trip.id],	
				number_of_passengers: params["number_of_adults"]
			}
		return HTMLtemplate.to_json
	else
		return "error no trip".to_json
	end
	
end


post "/trips/availability" do 
	#TODO add dynamic city look up
	depart_trips = Trip.where(depart_city_id: 1, depart_date: Date.today..Date.today.to_time.advance(:months => 2).to_date)
	arrive_trips = Trip.where(end_city_id: 2, depart_date: Date.today..Date.today.to_time.advance(:months => 2).to_date)
	num_passengers = params.first[0]
	
	content_type :json
	return [depart_trips, arrive_trips].to_json
end