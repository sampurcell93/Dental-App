<!DOCTYPE HTML>
	<html lang="en">
		<head>
			<meta charset="utf-8">
			<link rel="stylesheet" media="screen" type="text/css" href="css/style.css" />
			<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
			<script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>
			<script src="main.js"></script>

			<title>Add Dental Content</title>
		</head>

		<body>
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
					<p>This app was designed so that it could be added to easily by non-programmers (dentists).
						Here you go. Add content to a specification (EG Single Tooth is a specification of 
						Fixed > Partial.</p>

					<p>Use the sidebar at the side to easily format your content. Make sure it's formatted right here, 
						so it displays correctly in the app.</p>


						<input type="text" placeholder="Title of the content" name="node_title" id="node_title"/>
						
						<a class="button addHeader">Add Content</a>

						<div class="content"></div>

						<input type="submit" class="button" value="Submit (see preview)"/>
					

						<div style="clear: both;"></div>
				</div>
			</div>


		</body>

	</html>

