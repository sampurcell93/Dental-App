	var textboxes = [];
	var consoles = [];

$(document).ready(function() { 

			//tie consoles to textareas to allow for GUI style editing
			var index_count = 1;

			//begin with a console and a header
		$(".content").append(newHeader(0)).append(newConsole(0));

		$(".addHeader").click(function() {

			console.log(newHeader(index_count));
			console.log(newConsole(index_count));
			$(".content").append(newHeader(index_count));
			$(".content").append(newConsole(index_count));
			index_count++;


		});

});

//instantiates a new header, whose attributes are based on the number already in play
function newHeader(the_index) { 
	
		var header = "<hr /><input type='text' id='head" + the_index + "' placeholder='Put a header here.' />";
		var text = "<textarea id='text" + the_index + "' placeholder='This is where the content for this header goes.'></textarea>";

		textboxes[the_index] = text;

			return header + text;

		}

//same as header, but with a console.
function newConsole(the_index) { 

	var list = "<li class='createList'>List</li>";
	var console = "<ul class='console' data-rel='head" + the_index + "'>" + list + "</ul>";

		consoles[the_index] = console;

		return console;


}