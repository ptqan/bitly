$(document).ready(function() {

	// Fade in Fade Out jQuery
	$(".ui-open").click(function() {
			$(".results").fadeIn();
	});

	$(".ui-close").click(function() {
			$(".results").fadeOut();
	});


	// Toggle Intro Message
	$(".introduction p").hide()

	$(".introduction h1").click(function(){
		$(".introduction p").slideToggle()

	});



	$("#target").on("submit", function(event) {
		console.log($(this).serialize());
		console.log($(this).attr("method"));
		console.log($(this).attr("action"));
		event.preventDefault();

		$.ajax({
		  type: $(this).attr("method"),
		  url: $(this).attr("action"),
		  data: $(this).serialize(),  
		  dataType: "json",

		  success: function(abc) {
		  	if(abc["errors"]) {
		  		//$("#errors").html(abc["errors"])
		  	}
		  	else
		  	{
		  		//$("#error").html("")
		  		$(".results").append(
		  			'<tr>' + '<td>' + abc.long_url + '</td>' + '<td>' + '<a href="/' + abc.short_url + '">' + "http://bitly.es/" + abc.short_url + '</a>' + '</td>' + '<td>' + abc.url_count + '</td>' + '</tr>'
		  			);
		  	}
		  },
		});
		//it will go to the next line
		//console.log($(this).serialize());
	});

});



