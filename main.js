
$(document).ready(function() { 

	$(".bottomLevel").each(function() {

		$(this).attr("data-transition","slide");

		var inner = $(this).text().toLowerCase();

		$(this).attr("href", "parse.php?&t=" + 
		 $(this).closest("[data-role=page]").attr("data-referrer") + "&s=" + inner);


	});


	$("[data-role=page]").live('pagebeforeshow', function(event, data) {

    	console.log("the previous page was: " + data.prevPage.attr('id'));

	});

<<<<<<< HEAD
	$("h1, li a").text(function(i, text) {
=======
	$("h2").text(function(i, text) {
>>>>>>> upstream/master

   		return text.substr(0,1).toUpperCase() + text.substr(1);

	});

	$("[data-collapsible] h2").click(function() {

		$(this).next().fadeToggle("fast");


	})

});