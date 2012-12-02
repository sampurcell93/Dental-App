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

				<input id="fileupload" class="button" type="file" name="files[]" data-url="../fupload/server/php/" multiple>
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
						<input class="button" id='add_data' type="submit" name="submit" value="Submit (for real)" />
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

						<div class="content"></div>

						<input type="submit" class="button" value="Submit (see preview)" id="preview"/>
					
						<div style="clear: both;"></div>
					</div>
				</div>
			</div>

			

		</body>

	</html>