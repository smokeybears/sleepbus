post "/trips" do
	# TODO: precoded date and city needs to work
	# depart_date_array = params["depart_date"].split("-")
	# trip = Trip.create(
		# depart_city_id: params["depart_city"], 
		# depart_date: Date.new(
			# depart_date_array[0].to_i, #year
			# depart_date_array[1].to_i, #month
			# depart_date_array[2].to_i  #day
		# ))
	
	HTMLtemplate = erb :user_info_form, :layout => false, :locals => {trip_id: 1, number_of_passengers: params["number_of_adults"]}
	content_type :json
	return HTMLtemplate.to_json
end