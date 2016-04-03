var View = {
	startListeners: function(){
		// switch direction of travel
		$(document).on("click", ".div-line-text", function(){
			if ($(".direction-selection").css("flex-direction") == "row"){
				$(".direction-selection").css("flex-direction", "row-reverse");
			} else {
				$(".direction-selection").css("flex-direction", "row");
			}
			var orginal_depart_name = $(".depart-city").html();
			var orginal_depart_id = $(".depart-city").data("city-id")
			$(".depart-city").html($(".arrive-city").html());
			$(".arrive-city").html(orginal_depart_name)
			$(".depart-city").data("city-id", $(".arrive-city").data("city-id"))
			$(".arrive-city").data("city-id", orginal_depart_id)
			
		});
		$(".trip-details-form").submit(function(event){
			var tripData = {}
			tripData["depart-date"] = $("#depart-date").val();
			tripData["arrive-date"] = $("#arrive-date").val();
			tripData["number_of_adults"] = $(".number_of_adults").val();
			tripData["departCityID"] = $(".depart-city").data("city-id");
			tripData["arriveCityID"] = $(".arrive-city").data("city-id");
			debugger
			event.preventDefault();
			$.ajax({
				url: "/trips",
				method: "POST",
				dataType: "json",
				data: tripData
			}).done(function(response){
				$(".direction-selection-holder").remove();
				formArea = $(".form-area");
				formArea.empty();
				formArea.html(response);
			});
		});

		$('.number_of_adults').change(function(event){
			View.updatePriceInSubmitText($(this).val())
			$.ajax({
				url: "/trips/availability",
				method: "POST",
				data: $(this).val()
			}).done(function(response){
				debugger
				// View.updateAvailableDates(response);
			})
		})

		$(document).on("click", ".send-user-info", function(event){ // $(document) selector has to be used for ajaxed in html
			event.preventDefault();
			var formsHolder = $(".user-info-forms-holder");
			var passengersInfo = {};
			formsHolder.children('form').each(function(index){
				passengersInfo[index + "_passenger"] = $(this).serializeArray();
			});
			$.ajax({
				url: "/passengers",
				method: "POST",
				dataType: "json",
				data: {passengersInfo: passengersInfo, busID: $(".trip-id").html()}
			}).done(function(response){
				var formArea = $(".form-area");
				formArea.empty();
				$(".confirmation-view").html(response);
			});

			$(document).on("submit", ".stripe-payment-form", function(event){
				event.preventDefault();
				stripeData = $(this).serializeArray()
				$.ajax({
					url: "/stripe/charge",
					method: "POST",
					data: stripeData
				}).done(function(confirm_html){
					debugger
					$(".form-area").empty();
					$(".stripe-checkout-success").css("display", "block");
				})
			})
		});
	},


	updateAvailableDates: function(notAllowedDates){
		var array = ["2013-03-14","2013-03-15","2013-03-16"]
		$('input').datepicker({
		    beforeShowDay: function(date){
		        var string = jQuery.datepicker.formatDate('yyyy-mm-dd', date);
		        return [ array.indexOf(string) == -1 ]
		    }
		});
	},

	updatePriceInSubmitText:  function(numPassengers){
		var price = parseInt(numPassengers) * 65
		$(".trip-details").attr("value", "Book now for $" + price)
	},

	setUpLanding: function(){
		// debugger
		// $('#depart-date').datepicker();
		// $('#arrive-date').datepicker();
	}
}

$(document).ready(function() {
	View.setUpLanding();
	View.startListeners();
});
