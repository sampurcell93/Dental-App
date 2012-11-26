
		function globals()  {


			this.index_count = 0;
			//compile a table name based on the selection in existing hierarchy
			this.tablename;
			this.loader = "<img src='images/loader.gif'/>";
			this.topLevel = function ($this) { 

				var topHeader = "<h2>Section " + (appGlobals.index_count + 1) + "</h2> <a class='close remove' data-close='remove'></a><input type='text' class='top_head info' placeholder='Put a top-level header here.' />";
				var description = "<p>Add sub-divisions to this header, then either sub-divide further or add content to that subheader.</p>";
				var newSecondButton = "<span class='addSecond'> Add Subheader</span>";
				$(topHeader + description + newSecondButton).appendTo($this);
				this.secondLevel($this);

			};
			this.secondLevel = function($this) {

				var secondHeader = "<div class='relative second_level_wrap w100 m20'><a class='close' data-remove='remove'></a><h3>Second level header</h3>";
				secondHeader += "<input type='text' placeholder='Put a second-level header name here.' class='second_head info' data-children='0'/>";
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
				var newTitle = "<div class='third_level_wrap'><a class='close' data-remove='remove'></a><input type='text' class='third_head info m10' placeholder = 'Enter a third level title.' />";
				//make input box
				var newContent = "<div class='relative m10' ><div class='description info' contentEditable='true' placeholder='Enter some content.'></div></div></div>";

				$(newTitle + newContent).appendTo(topicWrap);
				appGlobals.editor(topicWrap.find(".relative:last-child"));
				//in order to rendered correctly in the client app, hasChildren will be necessary for hierarchy
				topic.addClass("hasChildren").removeClass("hasNoChildren").attr("data-children", parseInt(topic.attr("data-children"))+1);
				// remove the option to add a simple desc. YOU MADE YOUR CHOICE
				$this.text("Add another third-level subheader");
				$this.parent().html($this);
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
					else if (extension == "pptx") { 

						makeMedia = '<iframe src="http://docs.google.com/gview?url=http://www.sampurcell.net/sam/Dental-App/CMS/fupload/server/php/files/homepage.pptx&embedded=true" style="width:100%; height:500px;" frameborder="0"></iframe>';

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
			this.compile = function() {

				//this is the content array, which will be formatted by the app view later
				var content = [];
				var boxes   = $(".info").length;

				var currentBox;
				//loop through all top level headers
				for (var i = 0; i < boxes; i++) {
					//the current text box being looked at
					currentBox = $(".info").eq(i);
					//is the box a div or an input?
					var tagType = currentBox.prop("tagName");

					//check for empty box
					if (tagType == "INPUT" && currentBox.val() == "") { 
						return false;
					}
					else if (tagType == "DIV" && currentBox.html() == ""){
						return false;
					}

					//if it's a content div, get the html
					if (currentBox.hasClass("description")) {
						content[i] = "<p>" + currentBox.html() + "</p>"; 
					}
					//otherwise, grab the value from the input
					else if (currentBox.hasClass("hasChildren")) {

						content[i] = "<h3 class='hasChildren'>" + currentBox.val() + "</h3>";

					}
					//if not, give another tag
					else if (currentBox.hasClass("second_head")){ 

						content[i] = "<h3>" + currentBox.val() + "</h3>";

					}
					else if (currentBox.hasClass("top_head")) {

						content[i] = "<h2>" + currentBox.val() + "</h2>";

					}
					else if (currentBox.hasClass("third_head")) {

						content[i] = "<h4>" + currentBox.val() + "</h4>";

					}
				}

				return content.join(' \n');
	 
			};
			this.titleToText = function (title) {

				title = title.split("_");
				var textString = $("#browseHierarchy").find(".selected[id=-1]").text() + ": ";

				for (var i = 0; i < title.length; i++){
					textString += $("#browseHierarchy").find("li[id=" + title[i] + "]").text() + ", ";
				}
				console.log(textString);
				return textString.substring(0,textString.length - 2);
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
			var desc = "<div class='relative m10'><div class='description info' contentEditable='true'></div></div>";
			$(desc).appendTo(topicWrap);
			appGlobals.editor(topicWrap.find(".relative:last-child"));
			topic.removeClass("hasChildren").addClass("hasNoChildren");
			$(this).parent().remove();
		});

		//.remove is a button which removes a section of the editing pane and decrements index
		$(".remove").live("click",function() { appGlobals.index_count--; });

		//when they click the preview button, their text inputs are aggregated. 
		$("#preview").on("click",function() { 
 			var toAdd = appGlobals.compile();
 			if (!toAdd) { toAdd = "<p>You need to fill in all of the added fields before the content can be added. Make sure all of the text boxes have something in them.</p>"}
 			//empty the preview content of their old inputs
			$("#previewContent").empty();
			//show the wrapper box, blur the bg, and scroll to the top
			$("#previewBox").show();
			$(".wrapper-border").addClass("blur");
			$("html, body").animate({ scrollTop: 0 }, "fast");

				//the title is determined by selection in the existing hierarchy tool
				var title = "<h1>" + appGlobals.titleToText(appGlobals.tablename) + "</h1>";
			
				$("#previewContent").html(title);
				var curr = $("#previewContent").html();

		//add each header followed by its text in order.

					$("#previewContent").html(curr + toAdd);
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
			appGlobals.compile();
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


