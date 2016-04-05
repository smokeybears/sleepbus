bus = Bus.create(
		:name => "SF-LA",
		:num_seats => 10
)

passenger_ids = []
9.times do 
	p = Passenger.create(
			:first_name => Faker::Name.first_name,
			:last_name 	=> Faker::Name.last_name,
			:email 			=> Faker::Internet.email
		)
	passenger_ids << p.id
end

sf = City.create(
		:name => "San Francisco, Ca",
	)

la = City.create(
		:name => "Los Angleses, Ca",
	)


trip_to_sf = Trip.create(
			:bus_id 				=> bus.id,
			:depart_city_id => la.id, 
			:seats_left			=> 10,
			:end_city_id 		=> sf.id, 
			:depart_date		=> Date.parse("2016-04-09"),
			:arrive_date		=> Date.parse("2016-04-10")
	)
trip_to_la = Trip.create(
			:bus_id 				=> bus.id,
			:depart_city_id => sf.id, 
			:seats_left			=> 10,
			:end_city_id 		=> la.id, 
			:depart_date		=> Date.parse("2016-04-10"),
			:arrive_date		=> Date.parse("2016-04-11")
	)
passenger_ids.each do |passenger_id| # creates enough ticket for the trip where booking one user should work but booking two should fail
	Ticket.create(
			:passenger_id => passenger_id,
			:trip_id			=> trip_to_sf.id
		)
	
	Ticket.create(
			:passenger_id => passenger_id,
			:trip_id			=> trip_to_la.id
		)
end