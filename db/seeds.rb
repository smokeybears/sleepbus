bus = Bus.create(
		:name => "SF-LA",
		:num_seats => 19
)

passenger_ids = []

# 10.times do 
# 	p = Passenger.create(
# 			:first_name => Faker::Name.first_name,
# 			:last_name 	=> Faker::Name.last_name,
# 			:email 			=> Faker::Internet.email
# 		)
# 	passenger_ids << p.id
# end

sf = City.create(
		:name => "San Francisco, Ca",
	)

la = City.create(
		:name => "Los Angleses, Ca",
	)

# (18..22).each do |num|
	# if num % 2 == 0
		trip_from_sf = Trip.create(
			:bus_id 				=> bus.id,
			:depart_city_id => sf.id, 
			:seats_left			=> 19,
			:end_city_id 		=> la.id, 
			:depart_date		=> Date.parse("2016-04-18"),
			:arrive_date		=> Date.parse("2016-04-19")
		)
		
		 Trip.create(
			:bus_id 				=> bus.id,
			:depart_city_id => sf.id, 
			:seats_left			=> 19,
			:end_city_id 		=> la.id, 
			:depart_date		=> Date.parse("2016-04-20"),
			:arrive_date		=> Date.parse("2016-04-21")
		)		

		 Trip.create(
			:bus_id 				=> bus.id,
			:depart_city_id => sf.id, 
			:seats_left			=> 19,
			:end_city_id 		=> la.id, 
			:depart_date		=> Date.parse("2016-04-22"),
			:arrive_date		=> Date.parse("2016-04-24")
		)

		 Trip.create(
		 	:bus_id 				=> bus.id,
		 	:depart_city_id => sf.id, 
		 	:seats_left			=> 19,
		 	:end_city_id 		=> la.id, 
		 	:depart_date		=> Date.parse("2016-04-25"),
		 	:arrive_date		=> Date.parse("2016-04-26")
		 )

		 Trip.create(
		 	:bus_id 				=> bus.id,
		 	:depart_city_id => sf.id, 
		 	:seats_left			=> 19,
		 	:end_city_id 		=> la.id, 
		 	:depart_date		=> Date.parse("2016-04-27"),
		 	:arrive_date		=> Date.parse("2016-04-28")
		 )

		 Trip.create(
		 	:bus_id 				=> bus.id,
		 	:depart_city_id => sf.id, 
		 	:seats_left			=> 19,
		 	:end_city_id 		=> la.id, 
		 	:depart_date		=> Date.parse("2016-04-29"),
		 	:arrive_date		=> Date.parse("2016-05-01")
		 )


		 Trip.create(
		 	:bus_id 				=> bus.id,
		 	:depart_city_id => sf.id, 
		 	:seats_left			=> 19,
		 	:end_city_id 		=> la.id, 
		 	:depart_date		=> Date.parse("2016-05-02"),
		 	:arrive_date		=> Date.parse("2016-05-03")
		 )


	# else
		trip_from_la = Trip.create(
				:bus_id 				=> bus.id,
				:depart_city_id => la.id, 
				:seats_left			=> 19,
				:end_city_id 		=> sf.id, 
				:depart_date		=> Date.parse("2016-04-19"),
				:arrive_date		=> Date.parse("2016-04-20")
		)
	# end

	Trip.create(
				:bus_id 				=> bus.id,
				:depart_city_id => la.id, 
				:seats_left			=> 19,
				:end_city_id 		=> sf.id, 
				:depart_date		=> Date.parse("2016-04-21"),
				:arrive_date		=> Date.parse("2016-04-22")
		)
	Trip.create(
				:bus_id 				=> bus.id,
				:depart_city_id => la.id, 
				:seats_left			=> 19,
				:end_city_id 		=> sf.id, 
				:depart_date		=> Date.parse("2016-04-24"),
				:arrive_date		=> Date.parse("2016-04-25")
		)
	Trip.create(
				:bus_id 				=> bus.id,
				:depart_city_id => la.id, 
				:seats_left			=> 19,
				:end_city_id 		=> sf.id, 
				:depart_date		=> Date.parse("2016-04-26"),
				:arrive_date		=> Date.parse("2016-04-27")
		)

		Trip.create(
				:bus_id 				=> bus.id,
				:depart_city_id => la.id, 
				:seats_left			=> 19,
				:end_city_id 		=> sf.id, 
				:depart_date		=> Date.parse("2016-04-28"),
				:arrive_date		=> Date.parse("2016-04-29")
		)

	Trip.create(
				:bus_id 				=> bus.id,
				:depart_city_id => la.id, 
				:seats_left			=> 19,
				:end_city_id 		=> sf.id, 
				:depart_date		=> Date.parse("2016-05-01"),
				:arrive_date		=> Date.parse("2016-04-02")
		)


# passenger_ids.each do |passenger_id| # creates enough ticket for the trip where booking one user should work but booking two should fail
# 	Ticket.create(
# 			:passenger_id => passenger_id,
# 			:trip_id			=> trip_to_sf.id
# 		)
	
# 	Ticket.create(
# 			:passenger_id => passenger_id,
# 			:trip_id			=> trip_to_la.id
# 		)
# end