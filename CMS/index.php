<!DOCTYPE HTML>
	<html lang="en">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1"> 
			<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
			<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
			<link rel="stylesheet" media="screen" type="text/css" href="css/style.css" />
			<script src="jquery.min.js"></script>
			<script src="fupload/js/vendor/jquery.ui.widget.js"></script>
			<script src="fupload/js/jquery.iframe-transport.js"></script>
			<script src="fupload/js/jquery.fileupload.js"></script>
			<script src="main2.js" type="text/javascript"></script>		
			<title>Add Dental Content - Tufts Dental</title>
		</head>

		<body>
			<script>
				$(function () {
				    $('#fileupload').fileupload({
				        dataType: 'json',
				        done: function (e, data) {
				            $.each(data.result, function (index, file) {

				            	//add successfully uploaded file to the list of files
				                $('<li/>').text(file.name + " uploaded successfully!").prependTo($("#files"));
				                //update all existing media panels
								$(".addMedia").each(function() { 
									var $this = $(this);
					            	$this.find("div").remove();
					            	var media = parseData.getMedia();
					            	$(media).appendTo($this);
				          		  });
				            });
				        },
				        fail: function(e,data) { 
				        	$.each(data.result, function (index,file) { 

				        		$('<li/>').text(file.name + " upload failed! Bad filetype or size too large. ").appendTo($("#files"));

				        	});
				        }

				    });
				});
			</script>

			<div class="box" id="helpBox">

				<a class="close"></a>

					<h2>Tips:</h2>

					<ul>
						<li>If you want to add information to a section that does not exist yet, click "New Hierarchy." Create your new hierarchy
							, and the page will refresh. Then, click "Add to Existing" and you can add content to your new hierarchy.</li>
						<li>Use the console at right of each textbox to add headers, lists of items, links, and media.</li>
						<li>You probably have media to upload. You can upload pictures (.jpg, .png, .gif) and videos (.mp4, .mpeg, .avi)
							using the upload tool.</li>
						<li>The appendix can be updated easily. Just add a term name, followed by its definition. 
							If you make a mistake, you can remove that term.</li>
						<li>Feedback always helps! <a href="mailto:samuel.purcell@tufts.edu">Samuel.Purcell@tufts.edu</a></li>
					</ul>

			</div>

			<div class="box" id="fileUploadBox">

				<a class="close"></a>

				<h2>File Uploader</h2>

				<p>Your files will appear in the console, so you can add them to each section as you please. Accepted filetypes:</p>
				<ul>
					<li>Videos: .mp4</li>
					<li>Pictures: .gif, .jpeg, .jpg, .png</li>
				</ul>

				<button class='button' id='fake_button'>Add A File</button>
				<input id="fileupload" class="hidden" type="file" name="files[]" data-url="fupload/server/php/" multiple>
				<ul id="files">
				</ul>

			</div>

			<div class="box" id="previewBox">

				<a class="close"></a>

				<div id="previewContent"></div>

				<form action="insert_data.php" method="POST">
						<input type = "hidden" name="title_num" id="passtitlenum" />
						<input type = "hidden" name="title_words" id="passtitlewords" />
						<input type = "hidden" name="formatted" id="passformatted" />
						<input type = "hidden" name="barebones" id="passbarebones" />
						<input type = "hidden" name="editable" id="passeditable" />
						<input id='add_data' type="submit" class='button' name="submit" value="Submit (for real)" />
				</form>

			</div>

			<div class='wrapper-border'>

				<div class='wrapper'>

					<header>
						<h1>Add Content<span> - Tufts Dental School</span></h1>
						<nav>
							<ul>
								<li><a class="help" data-icon="&#42;"  data-rel="helpBox">Help</a></li>
								<li><a href="add_appendix.php" data-icon="&#36;"  target="_blank">Appendix</a></li>
								<li><a class="fUpload" data-icon="&#38;" data-rel="fileUploadBox">Upload</a></li>
							</ul>
						</nav>
					</header>

					<p>Do you want to make a new hierarchy, or add content to an existing one? (New still incomplete)<br> 
					 	<span class="button" id="newHierarchy" rel="#makeHierarchy">New Hierarchy</span>
					 	<span class="button" id="existingHierarchy" rel="#browseHierarchy">Add to Existing</span>
					</p>

					 <div id="browseHierarchy" class="hidden relative hierarchy"></div>
					 <div id="makeHierarchy" class="hidden relative hierarchy"></div>
					 
					 <div id="addContent">
						
						<a class="button" id="addHeader" >Add a Section</a>

						<div class="content"><div id="wrap0" class="content_wrap"><h2>Section 1</h2> <a class="close remove" data-close="remove"></a><input type="text" class="top_head info" placeholder="Put a top-level header here." value="top"><p>Add sub-divisions to this header, then either sub-divide further or add content to that subheader.</p><span class="addSecond"> Add Subheader</span><div class="relative second_level_wrap w100 m20"><a class="close" data-close="remove"></a><h3>Second level header</h3><input type="text" placeholder="Put a second-level header name here." class="second_head info hasChildren" data-children="1" value="second"><p class="center"><span class="button w25 addTertiary inline w60">Add another third-level subheader</span></p><div class="third_level_wrap"><a class="close" data-close="remove"></a><input type="text" class="third_head info m10" placeholder="Enter a third level title." value="third"><div class="relative m10"><div class="description info" contenteditable="true" placeholder="Enter some content." value="">twt</div><ul class="editor"><li class="addList icon">Ã®Â€Â€<div><ul class="listchoice"><li class="add" data-content=" &lt;ul&gt;&lt;li&gt;List 1&lt;/li&gt;&lt;li&gt;List 2&lt;/li&gt;&lt;li&gt;List 3&lt;/li&gt;&lt;/ul&gt;">Unordered list</li><li class="add" data-content=" &lt;ol&gt;&lt;li&gt;List 1&lt;/li&gt;&lt;li&gt;List 2&lt;/li&gt;&lt;li&gt;List 3&lt;/li&gt;&lt;/ol&gt;">Ordered list</li></ul></div></li><li class="addImage input icon">Ã®Â€Â‚<div><input type="text" class="inline w60" placeholder="Enter image URL"><span class="url add"></span><span class="button p0 inline w30">Add</span></div></li><li class="addLink input icon">Ã®Â€Â<div><input type="text" class="inline" placeholder="Enter link URL"><span class="url add"></span><span class="button p0 inline w30">Add</span></div></li><li data-role="Media" class="addMedia icon">Ã®Â€Â„<div class="scroll"><ul class="fileList"><li class="media_icon add" data-content="&lt;video class='path'  controls='controls'&gt;&lt;source src='fupload/server/php/files/19 Thrift Shop (feat. Wanz).mp4' type='video/mp4;' &gt;&lt;/source&gt;&lt;/video&gt;">19 Thrift Shop (feat. Wanz).mp4</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/clouds.jpg' /&gt;&lt;br /&gt;">clouds.jpg</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/Contact.png' /&gt;&lt;br /&gt;">Contact.png</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/Conversation.png' /&gt;&lt;br /&gt;">Conversation.png</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/cube.jpg' /&gt;&lt;br /&gt;">cube.jpg</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/darkmenu.jpg' /&gt;&lt;br /&gt;">darkmenu.jpg</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/everest.jpeg' /&gt;&lt;br /&gt;">everest.jpeg</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/facebook.png' /&gt;&lt;br /&gt;">facebook.png</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/fto_prelim.jpg' /&gt;&lt;br /&gt;">fto_prelim.jpg</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/genericorp.png' /&gt;&lt;br /&gt;">genericorp.png</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/highup (1).jpeg' /&gt;&lt;br /&gt;">highup (1).jpeg</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/highup.jpeg' /&gt;&lt;br /&gt;">highup.jpeg</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/hotplanet_thumb.jpg' /&gt;&lt;br /&gt;">hotplanet_thumb.jpg</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/iphone.jpg' /&gt;&lt;br /&gt;">iphone.jpg</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/iphone.png' /&gt;&lt;br /&gt;">iphone.png</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/jumbosmash_splash_thumb.jpg' /&gt;&lt;br /&gt;">jumbosmash_splash_thumb.jpg</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/milkyeway.jpeg' /&gt;&lt;br /&gt;">milkyeway.jpeg</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/milkyeway.jpg' /&gt;&lt;br /&gt;">milkyeway.jpg</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/miniscapture.jpg' /&gt;&lt;br /&gt;">miniscapture.jpg</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/purple.jpeg' /&gt;&lt;br /&gt;">purple.jpeg</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/rainbow.jpeg' /&gt;&lt;br /&gt;">rainbow.jpeg</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/warped.png' /&gt;&lt;br /&gt;">warped.png</li><li class="media_icon add" data-content="&lt;br &gt;&lt;/li&gt;&lt;img class='path' src='fupload/server/php/files/youtube.png' /&gt;&lt;br /&gt;">youtube.png</li></ul></div></li><li data-content="&lt;strong&gt;Your text&lt;/strong&gt;done" class="bold icon add"><strong>B</strong></li><li data-content="&lt;em&gt;Your text&lt;/em&gt;done" class="italic icon add"><em>i</em></li><li data-content="&lt;u&gt;Your text&lt;/u&gt;done" class="underline icon add"><u>U</u></li></ul></div></div></div></div></div>

						<input type="submit" class="button" value="Submit (see preview)" id="preview"/>
					
						<div style="clear: both;"></div>
					</div>
				</div>
			</div>

			

		</body>

	</html>