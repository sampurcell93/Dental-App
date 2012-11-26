
		function globals()  {

			this.index_count = 0;
			this.tablename = "";
			this.loader = "<img src='/sam/Dental-App/CMS/images/loader.gif'/>";
			this.media = "<div>";
			this.topLevel = function ($this) { 

				var topHeader = "<h2>Section " + (appGlobals.index_count + 1) + "</h2> <a class='close remove' data-close='remove'></a><input type='text' id='top_head" + this.index_count + "' placeholder='Put a top-level header here.' />";
				var description = "<p>Add sub-divisions to this header, then either sub-divide further or add content to that subheader.</p>";
				var newSecondButton = "<span class='addSecond'> Add Subheader</span>";
				$(topHeader + description + newSecondButton).appendTo($this);
				this.secondLevel($this);

			};
			this.secondLevel = function($this) {

				var secondHeader = "<div class='relative second_level_wrap w100 m20'><a class='close' data-remove='remove'></a><h3>Second level header</h3>";
				secondHeader += "<input type='text' id='second_head" + appGlobals.index_count + "' placeholder='Put a second-level header name here.' class='second_head' />";
				secondHeader += "<p class='center'><span class='button w25 addTertiary inline'>Add a third level</span> OR <span class='button w40 addSecondDesc inline'>Add Content without sub-divisions</span></p></div>";
				$(secondHeader).appendTo($this);
				secondHeader = $this.find(".descWrap:last-child");
				this.editor(secondHeader);

			};
			this.thirdLevel = function($this) { 

				//get the wrapper, and the title of the wrapper
				var topicWrap = $this.closest(".second_level_wrap");
				var topic = $this.parent().siblings(".second_head");
				//make header
				var newTitle = "<div class='third_level_wrap'><a class='close' data-remove='remove'></a><input type='text' class='third_head m10' placeholder = 'Enter a third level title.' />";
				//make input box
				var newContent = "<div class='relative m10' ><div class='description' contentEditable='true'>Enter some content.</div></div></div>";

				$(newTitle + newContent).appendTo(topicWrap);
				console.log($(".third_head").eq(1).text());
				appGlobals.editor(topicWrap.find(".relative:last-child"));
				//in order to rended correctly in the client app, hasChildren will be necessary for hierarchy
				topic.addClass("hasChildren").removeClass("hasNoChildren");

			};
			this.editor = function($this){ 

				var list = " <ul><li>List 1</li><li>List 2</li><li>List 3</li>";
				var underline = ' <u>Your tessxt</u> done';
				var bold = ' <strong>Your tssext</strong> done';
				var italic = ' <em>Your text</em> done';
				
				//get all of the files currently in the media directory as array
				var mediastring = this.getMedia();
				var editor = "<ul class='editor'>";
				editor += "<li data-role='List' data-content='" + list + "' class='addList icon add'>&#xe000;</li>";
				editor += "<li class='addImage input icon'>&#xe002;<div><input type='text' class='inline w60' placeholder='Enter image URL' /><span class='url add'></span><span class='button p0 inline w30'>Add</span></div></li>";
				editor += "<li class='addLink input icon' >&#xe001;<div><input type='text' class='inline' placeholder='Enter link URL' /><span class='url add'></span><span class='button p0 inline w30'>Add</span></div></li>";
				editor += "<li class='addMedia icon' >&#xe004;" + mediastring + "</li>";
				editor += "<li data-content='" + bold + "' class='bold icon add' ><strong>B</strong></li>";
				editor += "<li data-content='" + italic + "' class='italic icon add' ><em>i</em></li>";
				editor += "<li data-content='" + underline + "' class='underline icon add' ><u>U</u></li>";
				editor += "</ul>";
				$(editor).appendTo($this);
			};
			//pull the files from the media dir, return json array
			this.getMedia = function() { 
				
				var media = [];
				$.ajax({
				  url: 'mediafiles.php',
				  async: false,
				  dataType: 'json',
				  success: function (json) {
				    media = json.files;
				  }
				});	
				var mediastr = "<div class='scroll'><ul class='fileList'>";
				var makeMedia, name, extension;

				for (var i = 0; i < media.length - 1; i++) { 
					name = media[i].name;
					extension = media[i].extension;
				
					if (extension == "png" || extension =="jpg" || extension == "gif" || extension == "jpeg") { 
						makeMedia = "<br /><img src='fupload/server/php/files/" + name + "' /><br />";
					}
					else if (extension == "mp4") { 

						makeMedia = "<video><source src='fupload/server/php/files/" + name + "' type='video/mp4;' /></video>";
					}
					else  {
						makeMedia = "<span class='insertMedia' data-path='CMS/fupload/server/php/files" + name + "' data-type='" + extension + "'>" + name + "</span>";
					}
					mediastr += '<li class="media_icon add" data-content="' + makeMedia + '">';
					mediastr += name;
					mediastr += "</li>";
				}
				mediastr += "</ul></div>";
				return mediastr;
			};
			
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
			//give the content wrapper a unique id
			$(".content").append("<div id='wrap" + appGlobals.index_count + "'></div>");
			//get the unique wrapper object
			var wrapper = $("#wrap" + appGlobals.index_count);

			//add a top level header title and description
			appGlobals.topLevel(wrapper);
			//add an editor to the description box

			//scroll to the botom of the page
			$("html, body").animate({ scrollTop: $(document).height() }, "slow");
			appGlobals.index_count++;
		});

		//add a second level header
		$(".addSecond").live("click",function() { 
			//get unique wrapper parent obj
			var wrapper = $(this).closest("[id*=wrap]");
			//add the second level box
			appGlobals.secondLevel(wrapper);

		});

		// when clicked, the closest input box will have some content appended to it
		$(".add").live("click",function() { 

			var $this = $(this);
			//choose the closest input box to add content to
			pairing = $this.closest(".editor").siblings(".description");
			//get the data to be added
			var content = $this.attr("data-content");
			//append data
			$(content).appendTo(pairing);

		});

		//console has hover options for links and images.
		$(".editor").find(".input").live("click",function(e) {

			var input = $(this).find("input");
			var go = $(this).find(".button");
			input.focus();

			input.keyup(function() { 

				if($(this).closest(".input").hasClass("addImage")) { 
					$(this).next(".url").attr("data-content","<img src='" + $(this).val() + "' />\n");
				}
				else { $(this).next(".url").attr("data-content","<a href='" + $(this).val() + "' >Your link Title</a>"); }
			});

			go.live("click",function() { 

				console.log("!!!");
				$(this).prev(".url").trigger("click");
			});
		});

		//button titled "add a third level" adds new title box and contenteditable div
		$(".addTertiary").live("click",function() { 
			appGlobals.thirdLevel($(this));
		});
		//adds contenteditable div and marks topic as having no children.
		$(".addSecondDesc").live("click",function() { 
			var topicWrap = $(this).closest(".second_level_wrap");
			var topic = $(this).parent().siblings(".second_head");
			var desc = "<div class='relative m10'><div class='description' contentEditable='true'></div></div>"

			$(desc).appendTo(topicWrap);
			appGlobals.editor(topicWrap.find(".relative:last-child"));
			topic.removeClass("hasChildren").addClass("hasNoChildren");

		});

		//.remove is a button which removes a section of the editing pane and decrements index
		$(".remove").live("click",function() { appGlobals.index_count--; });

		//when they click the preview button, their text inputs are aggregated. 
		$("#preview").on("click",function() { 
 
 			//empty the preview content of their old inputs
			$("#previewContent").empty();
			//show the wrapper box
			$("#previewBox").show();

				//the title is determined by selection in the existing hierarchy tool
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
/*
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

}*/

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
  		$('#addHeader').addClass("fixed medShadow"); 
  } 

  if ($(this).scrollTop() < 260 && $el.hasClass("fixed")) { 
  		$el.removeClass("fixed medShadow");
  	 }
});


