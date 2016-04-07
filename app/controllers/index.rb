get "/" do
	page_information = info_array = [
		{
			"header" 			=> "Wake up in <br> San Francisco",
			"sub-header" 	=> "SleepBus has nightly non-stop <br> trips between Los Angeles, CA <br> and San Francisco, CA",
			"button" 			=> "false",
			"image_url"		=> "/images/sample-checkout.jpg"
		},
		{
			"header" 			=> "Book Any <br> Ticket for $65",
			"sub-header" 	=> "Whether you book 10 months <br> before or 10 minuets before the <br> price never changes",
			"button" => "true",
			"image_url"		=> "/images/sample-ticket.jpg"
		},

		{
			"header" 			=> "Arrive Rested <br> & Ready",
			"sub-header" 	=> "Every passenger gets a full size <br> twin bed with 10 cubit feet of <br> overhead storage",
			"button" => "true",
			"image_url"		=> "/images/sample-ticket.jpg"
		}
	]

	amenities_array = [
		{
			"icon_name" => "connection",
			"text"			=> "Wifi on Every Bus"
		},
		{
			"icon_name" => "switch",
			"text" 			=> "Personal Power Outlets"
		}, 
		{
			"icon_name" => "cup",
			"text" 			=> "Free Coffee for the Whole Trip"
		}
	]

	fhq_array = [
		{
 
			"question" => "Lorem ipsum dolor sit amet consectetur?",
			"answer" => "Nobis facilis modi reiciendis, hic eveniet voluptatem itaque incidunt non quisquam, dicta repellat!"
		},
		{
		
			"question" => "Lorem ipsum dolor sit amet consectetur?",
			"answer" => "Nobis facilis modi reiciendis, hic eveniet voluptatem itaque incidunt non quisquam, dicta repellat!"
		},
		{
		
			"question" => "Lorem ipsum dolor sit amet consectetur?",
			"answer" => "Nobis facilis modi reiciendis, hic eveniet voluptatem itaque incidunt non quisquam, dicta repellat!"
		},
		{
		
			"question" => "Lorem ipsum dolor sit amet consectetur?",
			"answer" => "Nobis facilis modi reiciendis, hic eveniet voluptatem itaque incidunt non quisquam, dicta repellat!"
		},
		{
		
			"question" => "Lorem ipsum dolor sit amet consectetur?",
			"answer" => "Nobis facilis modi reiciendis, hic eveniet voluptatem itaque incidunt non quisquam, dicta repellat!"
		},
		{
		
			"question" => "Lorem ipsum dolor sit amet consectetur?",
			"answer" => "Nobis facilis modi reiciendis, hic eveniet voluptatem itaque incidunt non quisquam, dicta repellat!"
		}
	]
	erb :landing, :locals => { info_array: page_information, amenities_array: amenities_array, fhq_array: fhq_array}
end



