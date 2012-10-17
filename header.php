<!DOCTYPE HTML>
	<html>
		<head>
			<title>My jQuery Mobile App</title>
			
			<meta name="viewport" content="width=device-width, initial-scale=1"> 
			<link rel="stylesheet" href="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.css" />
			<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
			<script src="main.js" type="text/javascript"></script>
			<script src="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.js"></script>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
			<link rel="stylesheet" media="Screen" type="text/css" href="custom.css" />
   

		</head>

		<body>

			<div data-role="page" >
				<div data-role="header" data-theme="b">

					<a data-rel="back" data-iconpos="notext" data-icon="back" ></a>

					<?php if (!isset($header)) {

							echo "<h1>Beginner's Guide to Dental Implant Prosthodontics</h1>";

						}

						else { echo "<h1>". $header . "</h1>"; }
					?>

		            <select name="nav" id="nav" data-icon="menu" class="ui-btn-right" data-mini="true" data-iconpos="notext">

		            		<option value=""></option>
		 					<option value="index.php">Procedures</option>
							<option value="appendix.php">Appendix</option>
							 
					</select> 

				</div>