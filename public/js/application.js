var Model = {
	sendTripDetails: function(tripData){
		$.ajax({
			url: "/trips/round",
			method: "POST",
			dataType: "json",
			data: tripData
		}).done(function(response){
			View.removeCityToggle()
			View.updateFormArea(response)
			// if (response.status == 200){
			// 	$(".direction-selection-holder").remove();
			// 	View.updateFormArea(response)
			// } else {
			// 	View.displayFormError(response)
			// }
		});
	},

	getAvailableDatesForXAdults: function(number_of_adults, depart_city_id, return_city_id){
		$.ajax({
			url: "/trips/availability",
			method: "GET", 
			data: {
				number_of_adults: number_of_adults, 
				depart_city_id: depart_city_id, 
				return_city_id: return_city_id
			}
		}).done(function(response){
			View.updateAvailableDates(response[0], response[1]);
		})
	},

	sendPassengerInfo: function(UserInfoHash) {	// Usually passed {passengersInfo: 	passengersInfo, busID: $(".trip-id").html()}
		$.ajax({
			url: "/passengers",
			method: "POST",
			dataType: "json",
			data: UserInfoHash
		}).done(function(response){
			var formArea = $(".form-area");
			formArea.empty();
			$(".confirmation-view").html(response);
		});
	},

	sendStripPaymentDetails: function(StripePaymentInfo){
		$.ajax({
			url: "/stripe/charge",
			method: "POST",
			data: StripePaymentInfo
		}).done(function(confirm_html){
			debugger
			$(".form-area").empty();
			$(".stripe-checkout-success").css("display", "block");
		})
	}

};

var View = {
	updateFormArea: function(newHTML){
			formArea = $(".form-area");
			formArea.empty();
			formArea.html(newHTML);
	},

	removeCityToggle: function(){
		$(".direction-selection-holder").remove()
	},
	
	displayFormError: function(message){
		$(".error-holder").html(message).css("display", "block")
	},

	updateAvailableDates: function(departTrips, returnTrips){
		var departDates = departTrips.map(function (trip) {return trip.depart_date})
		var returnDates = returnTrips.map(function (trip) {return trip.depart_date})// map to get the available dates for each direction of travel.
		$("#depart-date").datepicker("destroy");
		$('#depart-date').datepicker({
		    beforeShowDay: function(date){
		        var formatedDate = jQuery.datepicker.formatDate("yy-mm-dd", date);
		        return [departDates.indexOf(formatedDate) == -1]
		    },
		    minDate: 0
		});
		$("#return-date").datepicker("destroy");
		$('#return-date').datepicker({
		    beforeShowDay: function(date){
		        var formatedDate = jQuery.datepicker.formatDate("yy-mm-dd", date);
		        return [returnDates.indexOf(formatedDate) == -1]
		    },
		    minDate: 0

		});
		View.toggleDatePickerLoading()
	},

	updatePriceInSubmitText:  function(numPassengers){
		var price = parseInt(numPassengers) * 65
		$(".trip-details").attr("value", "Book now for $" + price)
	},

	setUpLanding: function(){
		// $('#depart-date').datepicker();
		// $('#return-date').datepicker();
		Model.getAvailableDatesForXAdults(
			1, 
			$(".depart-city").data("city-id"), 
			$(".return-city").data("city-id"));
	},

	toggleToFromCities: function(){
		if ($(".direction-selection").css("flex-direction") == "row"){
			$(".direction-selection").css("flex-direction", "row-reverse");
		} else {
			$(".direction-selection").css("flex-direction", "row");
		}
		var orginal_depart_name = $(".depart-city").html();
		$(".depart-city").html($(".return-city").html());
		$(".return-city").html(orginal_depart_name)

		var orginal_depart_id = $(".depart-city").attr("data-city-id")
		$(".depart-city").attr("data-city-id", $(".return-city").attr("data-city-id"))
		$(".return-city").attr("data-city-id", orginal_depart_id)
	},

	getTripDetailsFormInfo: function(callback){
		var tripData = {}
		tripData["depart-date"] = $("#depart-date").val();
		tripData["return-date"] = $("#return-date").val();
		tripData["number_of_adults"] = $(".number_of_adults").val();
		tripData["departCityID"] = $(".depart-city").attr("data-city-id");
		tripData["arriveCityID"] = $(".return-city").attr("data-city-id");
		event.preventDefault();
		callback(tripData)
	},

	toggleDatePickerLoading: function(){
			if ($(".datepicker").css("display") == "none"){
				$(".datepicker").each(function(){
					$(this).css("display", "block");
				});
				$(".datepicker-loading").each(function(){
					$(this).css("display", "none")
				});
			} else {
				$(".datepicker").each(function(){
					$(this).css("display", "none");
				});
				$(".datepicker-loading").each(function(){
					$(this).css("display", "-webkit-inline-box")
				});
			}
	}
}




startListeners = function(){
	$(document).on("click", ".div-line-text", function(){ // $(document) selector has to be used for ajaxed in html
		View.toggleToFromCities() // switches the user seeable text for the cities also updates the data-city-id for both .depart-city and .return-city
		Model.getAvailableDatesForXAdults(
			$('.number_of_adults').val(), 
			$(".depart-city").attr("data-city-id"),
			$(".return-city").attr("data-city-id")
		)
		View.toggleDatePickerLoading()
	});

	$(".trip-details-form").submit(function(event){
		View.getTripDetailsFormInfo(Model.sendTripDetails) // gets the data from the form then sends it as a param to the callback
	});


	$('.number_of_adults').change(function(event){
		View.updatePriceInSubmitText($(this).val())
		Model.getAvailableDatesForXAdults(
			$(this).val(), 
			$(".depart-city").attr("data-city-id"),
			$(".return-city").attr("data-city-id")
		) // gets available dates for the next 2 months for however many passengers are selected then passes this to updateAvailableDates() which blocks out non-avaible dates for that many passengers
		// Security Note: blocking out the available dates on the datepicker only works if the user has javascript enabled so we also have test in the model to make sure no trips are over booked. updateAvailableDates should be viewed a just a UI improvement and not a way of making sure trips aren't over booked

		View.toggleDatePickerLoading() // We have to disable the date picker while the ajax call for availble dates is being made otherwise the user could select a date before the date picker is refreshed
	})

	$(document).on("click", ".send-user-info", function(event){
		event.preventDefault();
		var passengersInfo = {};
		$(".user-info-forms-holder").children('form').each(function(index){
			passengersInfo[index + "_passenger"] = $(this).serializeArray();
		});
		Model.sendPassengerInfo({passengersInfo: passengersInfo, busID: $(".trip-id").html()}); // send data from form to /passengers
	});

	$(document).on("submit", ".stripe-payment-form", function(event){
		event.preventDefault();
		Model.sendStripPaymentDetails($(this).serializeArray()) // sends stripe form data to /stripe/charge
	});
	
}

$(document).ready(function() {
	View.setUpLanding();
	startListeners();
});