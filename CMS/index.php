<!DOCTYPE HTML>
	<html lang="en">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
			<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
			<link rel="stylesheet" media="screen" type="text/css" href="css/style.css" />
			<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
			<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>
			<script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>
			<script src="fupload/js/vendor/jquery.ui.widget.js"></script>
			<script src="fupload/js/jquery.iframe-transport.js"></script>
			<script src="fupload/js/jquery.fileupload.js"></script>
			<script src="main.js" type="text/javascript"></script>		
			<title>Add Dental Content - Tufts Dental</title>
		</head>

		<body>
			
			<div class="box" id="helpBox">

				<a class="close"></a>

					<h3>Tips:</h3>

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

				<p>Your files will appear in the console, so you can add them to each section as you please.</p>
				<input id="fileupload" class="button" type="file" name="files[]" data-url="fupload/server/php/" multiple>

			<!-- the below script calls the file uploader and appends a list of names to the upload box -->
				<script>
				$(function () {
				    $('#fileupload').fileupload({
				        dataType: 'json',
				        done: function (e, data) {
				            $.each(data.result, function (index, file) {
				                $('<p/>').text(file.name).appendTo(document.body);
				            });
				        }
				    });
				});
				</script>
			</div>

			<div id="lander_wrap">

				<div id="lander">

					<header>
						<h1>Add Content<span> - Tufts Dental School</span></h1>
						<nav>
							<ul>
								<li><a class="help" data-icon="*"  data-rel="helpBox">Help</a></li>
								<li><a href="add_appendix.php" data-icon="$"  target="_blank">Appendix</a></li>
								<li><a class="fUpload" data-icon="&" data-rel="fileUploadBox">Upload</a></li>
							</ul>
						</nav>
					</header>

					<p>Do you want to make a new hierarchy, or add to an existing one?<br> 
					 	<span class="button" id="newHierarchy" rel="#makeHierarchy">New Hierarchy</span>
					 	<span class="button" id="existingHierarchy" rel="#browseHierarchy">Add to Existing</span>
					</p>

					 <div id="browseHierarchy" class="hidden relative hierarchy"></div>
					 <div id="makeHierarchy" class="hidden relative hierarchy"></div>
					 
					 <div class="hidden" id="addContent">
						<!--<input type="text" placeholder="Title of the content" name="node_title" id="node_title"/>-->
						
						<a class="button medShadow" id="addHeader" >Add A Section</a>

						<div class="content"></div>

						<input type="submit" class="button" value="Submit (see preview)" id="preview"/>
					
						<div style="clear: both;"></div>
					</div>
				</div>
			</div>

			<div class="box" id="previewBox">

				<a class="close"></a>

				<div id="previewContent"></div>

				<form action="insert.php" method="POST">
						<input type = "text" name="info" id="passtext" style="visibility: hidden; pointer-events: none;" />
						<input type = "text" name="headers" id="passheads" style="visibility: hidden; pointer-events: none;" />
						<input type = "hidden" value="" name="title" id="passtitle" />
						<input class="button submitInfo" type="submit" name="submit" value="Submit (for real)" />
				</form>

			</div>

		</body>

	</html>