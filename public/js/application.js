var View = {
	startListeners: function(){
		$(".trip-details-form").submit(function(event){
			event.preventDefault();
			$.ajax({
				url: "/trips",
				method: "POST",
				dataType: "json",
				data: $(this).serialize()
			}).done(function(response){
				formArea = $(".form-area");
				formArea.empty();
				formArea.html(response);
			});
		});

		$('.number_of_adults').change(function(event){
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
				formArea.html(response);
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
