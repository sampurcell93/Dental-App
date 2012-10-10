

$(document).ready(function() { 

			//tie consoles to textareas to allow for GUI style editing,
			var index_count = 0;
			var textboxes = [];

		//begin with a console and a header in content

		$(".help").click(function(e) { 

			e.preventDefault();
			$("aside").fadeToggle("fast").toggleClass("pointers");


		});

		//click on the add header button to add what will become a new column in that node's sql table.
		$("#addHeader").on("click",function() {

			console.log(newHeader(index_count));
			console.log(newConsole(index_count));
			$(".content").append(newHeader(index_count));

			textboxes[index_count] = $("#text" + index_count).attr("value");
			console.log(textboxes[index_count]);
			$(".content").append(newConsole(index_count));
			index_count++;

		});

		//when they click the a list button, denoted by the create subclass, the proper text is 
		//inserted into the box
		$("[class*=create]").live("click",function() {
			//get pairing of console to textarea
			var pair = $(this).parent().attr("data-rel");
			var pairVal = $("#" + pair).attr("value");
			//append list item to textarea
			$("#" + pair).attr("value", pairVal + 
				$(this).attr("data-content") + "\n");
		});


		//when they click the preview button, their text inputs are aggregated. 
		$("#preview").live("click",function() { 
 
			$("#previewBox").empty();

			for (var i = 0; i < textboxes.length; i++) {

				var curr = $("#previewBox").html();
				var title = "<h1>" + $("#node_title").val() + "</h1>";
				var header = "<h2>" + $("#head" + i).val() + "</h2> \n";
				var text = $("#text" + i).val() + "<br />";

				if(header != "" && title != "" && text != "") {

					$("#previewBox").html(curr + title + header + text);
			}
		}


		});



});

//instantiates a new header, whose attributes are based on the number already in play
function newHeader(the_index) { 
	
		var header = "<hr /><input type='text' id='head" + the_index + "' placeholder='Put a header here.' />";
		var text = "<textarea id='text" + the_index + "' placeholder='This is where the content for this header goes.'></textarea>";

			return header + text;

		}

//same as header, but with a console for easy text editing.
function newConsole(the_index) { 
	var bold = "<li data-content='<strong>Bold text here</strong>' class='createBold' >Bold</li>";
	var list = "<li data-content='<ul>\n<li>List item</li>\n<li>List item</li>\n<li>List item</li>\n</ul>' class='createList'>List</li>";
	var link = "<li data-content='<a href=\"http://yourlinkhere.com\" >Name your link</a>' class='createLink'>Link</li>";
	var subheader = "<li data-content='<h3>Your subheader here</h3>' class='createSub'>SubHead</li>";
	var console = "<ul class='console' data-rel='text" + the_index + "'>"

		console +=  list + subheader + link + bold + "</ul>";

		return console;


}