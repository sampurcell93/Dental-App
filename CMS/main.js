$(document).ready(function() { 

			//tie consoles to textareas to allow for GUI style editing,
			var index_count = 0;

		//begin with a console and a header in content

		$(".help").click(function(e) { 

			e.preventDefault();
			$("aside").fadeToggle("fast").toggleClass("pointers");


		});

		//click on the add header button to add what will become a new column in that node's sql table.
		$("#addHeader").on("click",function() {

			$(".content").append(newHeader(index_count));
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
			insertAtCaret(pair, $(this).attr("data-content"));
		});


		//when they click the preview button, their text inputs are aggregated. 
		$("#preview").live("click",function() { 
 
 		//empty the preview content of their old inputs
			$("#previewContent").empty();
		//show the wrapper box
			$("#previewBox").show();

				var title = "<h1>" + $("#node_title").val() + "</h1>";
				$("#previewContent").html(title);

		//add each header followed by its text in order.
			for (var i = 0; i < $("textarea").length; i++) {

				var curr = $("#previewContent").html();
				var header = "<h2>" + $("#head" + i).val() + "</h2><br />";
				var text = $("#text" + i).val() + "<br />";

				if(header != "" && title != "" && text != "") {

					$("#previewContent").html(curr + header + text);
			}
		}


		});
		
		//close function
		$(".close").live("click",function() { 

			$("#previewBox").hide();

		});

		$(".submitInfo").live("click",function() { 

			aggregate();

		})



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

function aggregate() { 

	console.log($("#previewContent").html());
	$("#passtext").attr("value",$("#previewContent").html());
	$("#passtitle").attr("value",$("#node_title").val());

}


//props to gclaghorn of stackoverflow for the awesome function
function insertAtCaret(areaId,text) {
    var txtarea = document.getElementById(areaId);
    var scrollPos = txtarea.scrollTop;
    var strPos = 0;
    var br = ((txtarea.selectionStart || txtarea.selectionStart == '0') ? 
        "ff" : (document.selection ? "ie" : false ) );
    if (br == "ie") { 
        txtarea.focus();
        var range = document.selection.createRange();
        range.moveStart ('character', -txtarea.value.length);
        strPos = range.text.length;
    }
    else if (br == "ff") strPos = txtarea.selectionStart;

    var front = (txtarea.value).substring(0,strPos);  
    var back = (txtarea.value).substring(strPos,txtarea.value.length); 
    txtarea.value=front+text+back;
    strPos = strPos + text.length;
    if (br == "ie") { 
        txtarea.focus();
        var range = document.selection.createRange();
        range.moveStart ('character', -txtarea.value.length);
        range.moveStart ('character', strPos);
        range.moveEnd ('character', 0);
        range.select();
    }
    else if (br == "ff") {
        txtarea.selectionStart = strPos;
        txtarea.selectionEnd = strPos;
        txtarea.focus();
    }
    txtarea.scrollTop = scrollPos;
}
