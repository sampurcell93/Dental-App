
		function globals()  {

			this.index_count = 0;
			this.tablename = "";
			this.loader= "<img src='/sam/Dental-App/CMS/images/loader.gif' />";

		}

		var appGlobals = new globals();

$(document).ready(function() { 

		//the navigation bar calls lightboxes which slide down
		$(".fUpload, .help").on("click",function(e) {
			var pair = "#" + $(this).attr("data-rel");
			e.preventDefault();
			$(pair).fadeToggle("fast").addClass("inRange");
			$(".wrapper-border").addClass("blur");
		 });

		//click on the add header button to add what will become a new column in that node's sql table.
		$("#addHeader").on("click",function() {

			$(".content").append("<div id='wrap" + appGlobals.index_count + "'></div>");
			var wrapper = $("#wrap" + appGlobals.index_count);
			var toAppend = "";

			toAppend += newContent(appGlobals.index_count) + newConsole(appGlobals.index_count) + newRemove(appGlobals.index_count);
			wrapper.append(toAppend);
			wrapper.height(530);
			$("html, body").animate({ scrollTop: $(document).height() }, "slow");
			appGlobals.index_count++;
		});

		//when they click the a list button, denoted by the create subclass, the proper text is 
		//inserted into the box
		$("[class*=create]").live("click",function() {
			//get pairing of console to textarea
			var pair = $(this).parent().attr("data-rel");
			//insertAtCaret(pair, $(this).attr("data-content") + "\n");
			$("#" + pair).append($(this).attr("data-content"))
		});

		//.remove is a button which removes a section of the editing pane
		$(".remove").live("click",function() { 
			var pair = $(this).attr("data-rel");
			$("#wrap" + pair).empty().remove();
			$(this).remove();
			appGlobals.index_count--;
		});

		//when they click the preview button, their text inputs are aggregated. 
		$("#preview").live("click",function() { 
 
 			//empty the preview content of their old inputs
			$("#previewContent").empty();
			//show the wrapper box
			$("#previewBox").show();

				//put the title outside the content, once. 
				var title = "<h1>" + appGlobals.tablename + "</h1>";
			
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

			if ($(this).attr("data-close") == "remove") { 
				$(this).parent().remove().removeClass("inRange");
			}
			else { 
				$(this).parent().hide().removeClass("inRange");
			}
			$(".wrapper-border").removeClass("blur");
		});

		//get the content of previewContent, put it into a hidden input, and pass to php for insertion.
		$(".submitInfo").live("click",function(e) { 
			//e.preventDefault();
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


		//each item they click loads its direct children via json
		$(".hierarchy").delegate("li:not('.selected, .disabled, .newNode')","click",function() { 

			var appendString = "<ul class='child_row bottom'>";
			var $this = $(this);
			var pair = $("#" + $this.closest(".hierarchy").attr("id"));
			// the selected class will determine where content is placed.
			$this.addClass("selected").siblings().removeClass("selected");
			
			//if the user clicks a block higher than the lowest block, the lower blocks must be removed.
			if($this.closest(".child_row").index() < pair.find(".child_row").length) { 

				var parent_index = $this.parent().index(),
				num_blocks_before = pair.find(".child_row").length,
				num_blocks_after;

				$this.closest(".hierarchy").find(".child_row:gt(" + parent_index + ")").remove();
				$("#addContent").hide();
				num_blocks_after = browseHierarchy.find(".child_row").length;
			}
			//each node needs to be checked to see if it exists as a table.
			tableName = makeTableName(pair);
			
			var GET = 'existinghierarchy.php?id=' + $this.attr("id") + "&condition=";
			GET += $this.attr("data-condition").charAt(0).toLowerCase() + $this.attr("data-condition").slice(1);
			GET += "&table=" + tableName;
			console.log(GET);
			$.getJSON(GET, function(data) { 

				//test for an empty JSON set. if not empty, append row of children.
				if(!jQuery.isEmptyObject(data) && data.children[0] != -1) {
				
					//append each child of the span clicked in a new row
					for (var i = 0; i < data.children.length; i++) { 
						appendString += "<li id='" + data.children[i].id + "' data-condition='" + data.name + "'";
							
						if (data.children[i].table_exists) { 
							appendString += " class='disabled'";
						}
						appendString += ">" + data.children[i].childname + "</li>";
					}	
					//end the row
					if ($(pair).attr("id") == "makeHierarchy") { 
						appendString += "<span class='addNode'>+</span>";
					}
					appendString += "</ul>";
					$(appendString).appendTo(pair);
				}
				else { 
					if ($(pair).attr("id") !== "makeHierarchy") { 
						$("<p class='child_row isEligible'>This node has no children, and no data associated with it." +
						" <a class='cursor' id='populateNode' data-tablename='" + appGlobals.tableName + "'>Add Information</a></p>").appendTo(pair);
					}
					else { 
						$("<p class='child_row'><a class='cursor' id='fixNewHierarchy'>Fix your specifications in place (Make sure you're happy).</a><div class='addNode'>+</div></p>").appendTo(pair);						
					}
				}
			});
		});

		$("#populateNode").live("click",function() { 

			$("#addContent").slideDown("fast");

		});

		$("#fixNewHierarchy").live("click",function() { 
			var addNewNodes = function($this) { 
				var child_rows = $this.closest(".hierarchy").find(".child_row").length;
				console.log(child_rows);
				var to_send = "{[";
			}($(this));
		});

		//add a new node at any level of the hierarchy
		$(".addNode").live("click",function(){ 
			//the blank node
			var newSpan = "<li contentEditable='true' class='newNode override'>Give me a title!</li>";
			var $this = $(this);
			$(newSpan).appendTo($this.closest(".child_row"));
			$this.closest(".newNode").trigger("click");
			$this.closest(".hierarchy").append("<ul class='child_row'><span class='addNode'>+</span><li contentEditable='true' class='newNode override'>Give me a title!</li><a class='close' data-close='remove'></a></ul>");
		});

		$(".newNode").live("click",function() {
			//select all the content for easy editing
			document.execCommand('selectAll',false,null);

		});

		//in the appendix editor, this function passes the id of the entry to the php file for a removal query
		$(".removeAppendix").on("click",function() { 

			$(this).parent().html(appGlobals.loader).load("remove_appendix.php?id=" + $(this).attr("rel"));
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
		compiledHeaders += headers[i] + "| ";
		compiledText += textboxes[i] + "| ";

	}

	compiledText = compiledText.substring(0,compiledText.length - 2);
	compiledHeaders = compiledHeaders.substring(0, compiledHeaders.length - 2);

	$("#passheads").val(compiledHeaders);
	console.log($("#passheads").val());
	$("#passtext").val(compiledText);
	console.log($("#passtext").val());
	$("#passtitle").val(appGlobals.tablename);
	console.log($("#passtitle").val());

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

		var appendString = "<ul class='child_row'>";

			$.getJSON('existinghierarchy.php', function(data) { 

					for (var i = 0; i < data.conditions.length; i++) { 

						appendString += "<li id='-1' data-condition='" + data.conditions[i].name + "'>" + data.conditions[i].name + "</li>";

					}

				if (rel == "#makeHierarchy") { 

					appendString += "<span class='addNode'>+</span>";

				}

				appendString += "</ul>";
				$(appendString).appendTo($update);
				$update.addClass("activeBrowser");
				$update.show();
			});
	}
}

function makeTableName (id) { 
	
	appGlobals.tablename = "";	

	$(id).children(".child_row:gt(0)").not(".isEligible").each(function(){ 
		appGlobals.tablename += $(this).children(".selected").attr("id") + "_";
	});

	appGlobals.tablename = appGlobals.tablename.substring(0,appGlobals.tablename.length - 1)

	return appGlobals.tablename;
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


