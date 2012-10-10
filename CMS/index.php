<!DOCTYPE HTML>
	<html lang="en">
		<head>
			<meta http-equiv="Content-Type"
 content="text/html; charset=utf-8">
			<link rel="stylesheet" media="screen" type="text/css" href="css/style.css" />
			<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
			<script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>
			<script src="main.js"></script>

			<title>Add Dental Content</title>
		</head>

		<body>

			<div id="admin">Hello, Professor Mufte. Today is <?php echo date("d/m/y") ?> . Add some stuff.</div>

			<aside>
				<a class="help">Close</a>
					<h3>Tips:</h3>

						<ul>
							<li>Use the console at right of each textbox to add headers, lists of items, links, and pictures.</li>
							<li>This system is still new, so make sure that when you enter your information, it's correct.
							 It can be changed after the fact, but not by you.</li>
							 <li>Feedback always helps! <a href="mailto:samuel.purcell@tufts.edu">Samuel.Purcell@tufts.edu</a></li>
						</ul>

					</aside>
			<div id="lander_wrap">
				<div id="lander">

					<a class="help" title="help" >Help</a>



					<h1>Add Content</h1>

					<hr />

					<p>This app was designed so that it could be added to easily by non-programmers (dentists).
						Here you go. </p> 

					<p>Use the sidebar at the side to easily format your content. Make sure it's formatted right here, 
						so it displays correctly in the app.</p>



						<input type="text" placeholder="Title of the content" name="node_title" id="node_title"/>
						
						<a class="button" id="addHeader" >Add Content</a>

						<div class="content"></div>

						<input type="submit" class="button" value="Submit (see preview)" id="preview"/>
					

						<div style="clear: both;"></div>
				</div>
			</div>

			<div id="previewBox"><a class="close"></a>

				<div id="previewContent"></div>

				<form action="insert.php" method="POST">
						<input type = "text" name="info" id="passtext" style="visibility: hidden; pointer-events: none;" />
						<input type = "hidden" value="" name="title" id="passtitle" />
						<input class="button submitInfo" type="submit" value="Submit (for real)" />
				</form>

			</div>

		</body>

	</html>

	<!--

		Each input block is dynamically generated, so it may be hard to follow.

		The format for a single editing block is thus (where this is the fourth such block):

		<hr />
		<input type='text' id='head3' placeholder='Put a header here.' />

		<textarea id='text3' placeholder='This is where the content for this header goes.'></textarea> 
		<ul class='console' data-rel='text3'>

			<li data-content='
				<ul>
					<li>List item</li>
					<li>List item</li>
					<li>List item</li>
				</ul>' 
				class='createList'>List</li>

			<li data-content='<h3>Your subheader here</h3>' class='createSub'>SubHead</li>

			<li data-content='<a href="http://yourlinkhere.com" >Name your link</a>' class='createLink'>Link</li>

			<li data-content='<strong>Bold text here</strong>' class='createBold' >Bold</li>

		</ul> 

		This allows for one javascript function to generate text for all button types, as opposed
		to a separate click function for each type.

	-->

