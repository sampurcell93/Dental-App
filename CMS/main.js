$(document).ready(function() { 

		function proto(name, face) { 

			this.name = name;
			this.face = face;
		}

		//tie consoles to textareas to allow for GUI style editing, sorry for the global...
		var index_count = 0;
		//the navigation bar calls lightboxes which slide down
		$(".fUpload, .help").on("click",function(e) {
			var pair = "#" + $(this).attr("data-rel");
			e.preventDefault();
			$(pair).fadeToggle("fast").addClass("inRange");
			$("#lander_wrap").addClass("blur");
		 });

		//click on the add header button to add what will become a new column in that node's sql table.
		$("#addHeader").on("click",function() {

			$(".content").append("<div id='wrap" + index_count + "'></div>");
			var wrapper = $("#wrap" + index_count);
			var toAppend = "";

			toAppend += newContent(index_count) + newConsole(index_count) + newRemove(index_count);
			wrapper.append(toAppend);
			wrapper.height(530);
			$("html, body").animate({ scrollTop: $(document).height() }, "slow");
			index_count++;
		});

		//when they click the a list button, denoted by the create subclass, the proper text is 
		//inserted into the box
		$("[class*=create]").live("click",function() {
			//get pairing of console to textarea
			var pair = $(this).parent().attr("data-rel");
			//append list item to textarea at cursor
			//insertAtCaret(pair, $(this).attr("data-content") + "\n");

			$("#" + pair).append($(this).attr("data-content"))
			console.log($("#" + pair).html());
		});

		//.remove is a button which removes a section of the editing pane
		$(".remove").live("click",function() { 
			var pair = $(this).attr("data-rel");
			$("#wrap" + pair).empty().remove();
			$(this).remove();
			index_count--;
		});

		//when they click the preview button, their text inputs are aggregated. 
		$("#preview").live("click",function() { 
 
 			//empty the preview content of their old inputs
			$("#previewContent").empty();
			//show the wrapper box
			$("#previewBox").show();

				//put the title outside the content, once. 
				var title = "<h1>" + $("#node_title").val() + "</h1>";
			
				$("#previewContent").html(title);

		//add each header followed by its text in order.
			for (var i = 0; i < $(".infoInput").length; i++) {
				var curr = $("#previewContent").html();
				var header = "<h2>" + $("#head" + i).val() + "</h2>\n";
				var text = $("#text" + i).html() + "<br />";
				
				if(header && title && text ) {

					$("#previewContent").html(curr + header + text);
				}
			}
		});
		
		//close function for lightboxes, or any parent element.
		$(".close").live("click",function() { 
			$(this).parent().hide().removeClass("inRange");
			$("#lander_wrap").removeClass("blur");
		});

		//get the content of previewContent, put it into a hidden input, and pass to php for insertion.
		$(".submitInfo").live("click",function(e) { 
			aggregate();
		});

		//insert.php: Show the submission
		$("#showPreview").on("click",function() {

			$("#dbPreview").slideToggle();

			var show = "See what you created, as it exists in our databases.";
			var hide = "Hide"

			if ($(this).text() == show) { 

				$(this).text(hide);

			}

			else { $(this).text(show); }
		});

		var browseHierarchy = $("#browseHierarchy");
		var makeHierarchy = $("#makeHierarchy");

		//if they choose to add to an existing node that's empty, this loads the list of diseases so they can navigate
		$("#existingHierarchy, #newHierarchy").on("click",function() { 
			makeHierarchyBox($(this).attr("rel"));
		});

		var tablename;

		//each span they click loads its direct children via json
		$(".hierarchy").delegate("span:not('.selected, .disabled')","click",function() { 

			var appendString = "<div class='block bottom'>";
			var $this = $(this);
			var pair = $("#" + $this.closest(".hierarchy").attr("id"));
			// the selected class will determine where content is placed.
			$this.addClass("selected").siblings().removeClass("selected");
			//each node needs to be checked to see if it exists as a table.
			tableName = makeTableName(pair);
			
			//if the user clicks a block higher than the lowest block, the lower blocks must be removed.
			if($this.closest(".block").index() < pair.find(".block").length) { 

				var parent_index = $this.parent().index(),
				num_blocks_before = pair.find(".block").length,
				num_blocks_after;

				$this.closest(".hierarchy").find(".block:gt(" + parent_index + ")").remove();

				num_blocks_after = browseHierarchy.find(".block").length;
			}
			var POST = 'existinghierarchy.php?id=' + $this.attr("id") + "&condition=" + $this.attr("data-condition") + "&table=" + tableName;
			console.log(POST);
			$.getJSON(POST, function(data) { 

				//test for an empty JSON set. if not empty, append row of children.
				if(!jQuery.isEmptyObject(data) && data.children[0] != -1) {
				
					//append each child of the span clicked in a new row
					for (var i = 0; i < data.children.length; i++) { 
						appendString += "<span id='" + data.children[i].id + "' data-condition='" + data.name + "'";
							
						if (data.children[i].table_exists) { 

							appendString += " class='disabled'";

						}

						appendString += ">" + data.children[i].childname + "</span>";
					}	

					//end the row
					if ($(pair).attr("id") == "makeHierarchy") { 
						appendString += "<div class='addNode'>+</div>";
					}

					appendString += "</div>";
					$(appendString).appendTo(pair);
		
				}
				else { 
					if ($(pair).attr("id") !== "makeHierarchy") { 
						$("<p class='block isEligible'>This node has no children, and no data associated with it." +
						" <a class='cursor' id='make' data-tablename='" + tableName + "'>Add Information</a></p>").appendTo(pair);
					}
					else { 
						$("<p class='block'><a class='cursor' id='fixNewHierarchy' data-tablename='" +  
							tableName + "'>Fix your specifications in place (Make sure you're happy).</a><div class='addNode'>+</div></p>").appendTo(pair);						

					}
				}
			});
		});

		$("#make").live("click",function() { 

			$("#addContent").slideDown("fast");
			makeTitle();

		});

		//when the user gets to a new level of the hierarchy, maybe they want to add a new node at that level. this is for them.
		$(".addNode").live("click",function(){ 

			var newSpan = "<span contentEditable='true' class='newNode'></span>";
			var $this = $(this);
			$(newSpan).appendTo($this.closest(".block"));
		});

		//in the appendix editor, this function passes the id of the entry to the php file for a removal query
		$(".removeAppendix").on("click",function() { 

			$(this).parent().html("loading....").load("remove_appendix.php?id=" + $(this).attr("rel"));
			$(this).closest(".wrap").remove();
		});
});

//instantiates a new header, whose attributes are based on the number already in play
function newContent(the_index) { 
	
		var header = "<hr /><input type='text' id='head" + the_index + "' placeholder='Put a header here.' />";
		var text = "<div class='infoInput' contentEditable='true' id='text" + the_index + "' placeholder='This is where the content for this header goes.'></div>";

			return header + text;
}

//same as header, but with a console for easy text editing.
function newConsole(the_index) {
	var bold = "<li data-content='<strong>Bold text here</strong>' class='createBold' >Bold</li>";
	var list = "<li data-content='<ul>\n<li>List item</li>\n<li>List item</li>\n<li>List item</li>\n</ul>' class='createList'>List</li>";
	var link = "<li data-content='<a href=\"http://yourlinkhere.com\" >Name your link</a>' class='createLink'>Link</li>";
	var subheader = "<li class='subList'>Header<ul data-rel='text" + the_index + "' id='H4s'><li class='createBig' data-content='<h3>Header</h3>'>Big</li><li class='createSmall' data-content='<h4>Header</h4>'>Small</li></ul></li>";
	var media = "<li>Media</li>";
	var console = "<ul class='console' id='console" + the_index + "' data-rel='text" + the_index + "'>"
	console +=  list + subheader + link + bold + media + "</ul>";

		return console;
}

function newRemove(the_index) { 

	return "<a class='button remove' data-rel='" + the_index + "' >Remove This</a>";

}

function aggregate() { 

	var headers = [];
	var textboxes = [];
	var compiledHeaders = "";
	var compiledText = "";

	for (var i = 0; i < $("[id*=head]").length - 1; i++) { 

		headers[i] = $("#head" + i).val();
		textboxes[i] = $("#text" + i).html();
		console.log(textboxes[i]);
		compiledHeaders += headers[i] + "| ";
		compiledText += textboxes[i] + "| ";

	}

	compiledText = compiledText.substring(0,compiledText.length - 2);
	compiledHeaders = compiledHeaders.substring(0, compiledHeaders.length - 2);

	$("#passheads").val(compiledHeaders);
	$("#passtext").val(compiledText);
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

function makeHierarchyBox(rel) { 

	var $update = $(rel);

	if (!$update.hasClass("activeBrowser")) {

		$(".hierarchy:not(" + rel + ")").hide().empty().removeClass("activeBrowser");

		var appendString = "<div class='block'>";

			$.getJSON('existinghierarchy.php', function(data) { 

					for (var i = 0; i < data.conditions.length; i++) { 

						appendString += "<span id='-1' data-condition='" + data.conditions[i].name + "'>" + data.conditions[i].name + "</span>";

					}

				if (rel == "#makeHierarchy") { 

					appendString += "<div class='addNode'>+</div>";

				}

				appendString += "</div>";
				$(appendString).appendTo($update);
				$update.addClass("activeBrowser");
				$update.show();
			});
	}
}

function makeTableName (id) { 

	var tablename = "";
	
	$(id).children(".block:gt(0)").not(".isEligible").each(function(){ 
		tablename += $(this).children(".selected").attr("id") + "_";
	});

	return tablename.substring(0,tablename.length - 1);

}

$(window).scroll(function(e){

  $el = $('#addHeader'); 

  if ($(this).scrollTop() > 260 && !$el.hasClass("fixed")) { 
  		$('#addHeader').addClass("fixed"); 
  } 

  if ($(this).scrollTop() < 260 && $el.hasClass("fixed")) { 
  		$el.removeClass("fixed");
  	 }
});


