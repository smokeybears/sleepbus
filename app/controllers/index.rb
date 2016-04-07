get "/" do
	page_information = info_array = [
		{
			"header" 			=> "Wake up in <br> San Francisco",
			"sub-header" 	=> "SleepBus has nightly non-stop <br> trips between Los Angeles, CA <br> and San Francisco, CA",
			"button" 			=> "false",
			"base_image_url"	=> "/images/sample-checkout.jpg",
			"srcset_image_ulrs" => ""
		},
		{
			"header" 			=> "Book Any <br> Ticket for $65",
			"sub-header" 	=> "Whether you book 10 months <br> before or 10 minuets before the <br> price never changes",
			"button" => "true",
			"base_image_url"	=> "/images/PHONE@2x.png",
			"srcset_image_ulrs" => "/images/PHONE@2x_cut.png 765w"
		},

		{
			"header" 			=> "Arrive Rested <br> & Ready",
			"sub-header" 	=> "Every passenger gets a full size <br> twin bed with 10 cubit feet of <br> overhead storage",
			"button" => "true",
			"base_image_url"		=> "/images/bus-interior-0.jpg",
			"srcset_image_ulrs" => ""
		}
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
		{
			"image_url" => "/svgs/UTENSILS.svg",
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



