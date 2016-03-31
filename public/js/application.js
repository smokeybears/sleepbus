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

		$(document).on("click", ".send-user-info", function(event){
			console.log("workin")
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
				data: {passengersInfo: passengersInfo, busID: $(".trip-id").val()}
			}).done(function(response){
				debugger
			});
		});
	},

	updateDates: function(){
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1;
		var yyyy = today.getFullYear();
		$(".start_date").atrr("value", yyyy + "-" + mm + "-" + dd);
		$(".return_date").atrr("value", yyyy + "-" + mm + "-" + (dd + 2));
	}
}

$(document).ready(function() {
	View.startListeners();
});
