$(document).ready(function()  {

	$("[name=condition]").on("click",function() { 

		$(this).closest("form").submit();

	})



})