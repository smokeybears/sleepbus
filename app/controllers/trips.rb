post "/trips" do
	# TODO:  date and city look up and creation needs to work currently hard coded for trip_id in HTMLtemplate should be trip.id 
	# depart_date_array = params["depart_date"].split("-")
	# trip = Trip.create(
	# 	depart_city_id: 1, 
	# 	end_city_id: 2,
	# 	depart_date:  Date.parse(params["depart-date"]),
	# 	arrive_date:  Date.parse(params["arrive-date"]),
	# 	bus_id: 1,
	# 	seats_left: 5
	# )
	trip = Trip.find_by(
		depart_date: Date.parse(params["depart-date"]), 
		arrive_date:  Date.parse(params["arrive-date"])
	)
	binding.pry
	HTMLtemplate = erb :user_info_form, :layout => false, :locals => {trip_id: trip.id, number_of_passengers: params["number_of_adults"]}
	content_type :json
	return HTMLtemplate.to_json
end


post "/trips/availability" do 
	trips = Trip.where(depart_city_id: 1, depart_date: Date.today..Date.today.to_time.advance(:months => 2).to_date, arrive_date: Date.today..Date.today.to_time.advance(:months => 2).to_date)
	num_passengers = params.first[0]
	
	not_availabile_dates = []
	trips.each do |trip_object|
		if trip_object.seats_left < (num_passengers.to_i + 5) # currently assuming only one bus working from city to city each day
			not_availabile_dates << trip_object.depart_date
		end
	end
	content_type :json
	return not_availabile_dates.to_json
end