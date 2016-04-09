get "/" do
	page_information = info_array = [
		{
			"header" 			=> "Wake up in <br> Los Angeles",
			"sub-header" 	=> "SleepBus has nightly non-stop <br> trips between Los Angeles, CA <br> and San Francisco, CA",
			"button" 			=> "false",
			"base_image_url"	=> "/images/sample-checkout.jpg",
			"srcset_image_ulrs" => ""
		},
		{
			"header" 			=> "Book Any <br> Ticket for $65",
			"sub-header" 	=> "Whether you book 10 months <br> before or 10 minutes before the <br> price never changes",
			"button" => "true",
			"base_image_url"	=> "/images/PHONE@2x.png",
			"srcset_image_ulrs" => "/images/PHONE@2x_cut.png 765w"
		},

		{
			"header" 			=> "Arrive Rested <br> & Ready",
			"sub-header" 	=> "Every passenger gets a full size <br> twin bed premium bedding and <br> 10 cubic feet of storage space.",
			"button" => "true",
			"base_image_url"		=> "/images/bus-interior-0.jpg",
			"srcset_image_ulrs" => ""
		},
	]

	amenities_array = [
		{
			"image_url" => "/svgs/WIFI.svg",
			"text"			=> "Wifi on Every Bus"
		},
		{
			"image_url" => "/svgs/OUTLET.svg",
			"text" 			=> "Personal Power Outlets"
		}, 
		# {
		# 	"image_url" => "/svgs/UTENSILS.svg",
		# 	"text" 			=> "Free Coffee for the Whole Trip"
		# }
	]

	fhq_array = [
		{
 
			"question" => "What are the pick-up and drop-off locations?",
			"answer" => "We're starting our services in the Mission District in San Francisco and in Santa Monica in Los Angeles. See below for specific locations. <br> <br> Los Angeles pick up and drop off: Santa Monica Parking, 1550 Pacific Coast Highway
San Francisco pick up and drop off: Zeitgeist, 199 Valencia Street"
		},
		{
		
			"question" => "What are the amenities on the SleepBus?",
			"answer" => "A privacy screen for each bed, personal power outlets, WiFi, fresh sheets, coffee, tea, seating areas, and a restroom. We also will have a SleepBus attendant on each service to answer any of your questions and to serve as your point of contact during the ride."
		},
		{
		
			"question" => "Is there WiFi on the SleepBus?",
			"answer" => "Yes. We ask our passengers to not use video-streaming devices or services during the SleepBus ride to ensure quality of WiFi for the rest of the passengers.
"
		},
		{
		
			"question" => "What linens are used on the bus?",
			"answer" => "We are using 100% cotton sheets."
		},
		{
		
			"question" => "How early should I arrive for check in and how long can I stay before I need to check out?",
			"answer" => "You should aim to arrive at the pick up location 20 minutes before departure. Upon arrival, check-out time is 30 minutes after arrival. Departure time is 11pm sharp in both San Francisco and Los Angeles."
		},
		{
		
			"question" => "How long is the bus ride?",
			"answer" => "Given normal traffic and weather conditions, we expect the bus ride to last 6 hours.
"
		},
		{
		
			"question" => "What are the departure and arrival times in SF and LA?",
			"answer" => "Departure time will always be 11pm sharp. Arrival times will vary, though we expect to arrive in either city by 5am or 6am."
		}
	]
	erb :landing, :locals => { info_array: page_information, amenities_array: amenities_array, fhq_array: fhq_array}
end



