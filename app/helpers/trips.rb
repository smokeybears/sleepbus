helpers do 
	def find_not_availabile_dates(trips, num_seats)
	not_availabile_dates = []
		depart_trips.each do |trip_object|
			if trip_object.seats_left < (num_passengers.to_i + 5) # currently assuming only one bus working from city to city each day
				not_availabile_dates << trip_object.depart_date
			end
		end
		return not_availabile_dates
	end
end