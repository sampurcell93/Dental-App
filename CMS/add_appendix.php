<!DOCTYPE HTML>
	<html lang="en">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
			<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
			<link rel="stylesheet" media="screen" type="text/css" href="css/style.css" />
			<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
			<script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>
			<script src="main.js" type="text/javascript"></script>		

			<title>Add Dental Content</title>
		</head>

		<body>
			
			<div id="lander_wrap">
				<div id="lander">

					<form method="POST" action="appendixTry.php">

						<label for="term"><h2>Add a term:</h2>
							<input type="text" name="term" id="term" placeholder="Term name here." />
						</label>

						<textarea id="definition" name="definition" placeholder="Enter the definition here."></textarea>

 						<input type="submit" class="button" name="submit" value="Submit" />
 					</form>


 					<h2>Remove a term:</h2>

 					<div style="padding-left: 40px;">
 				<?php 
			
					$mysqli = new mysqli("localhost","root","","dental_info");

					$results = $mysqli->query("select * from appendix ORDER BY term");

					while($row = $results->fetch_assoc()) {

						$id; 

						foreach ($row as $key => $value) { 

							if ($key == "id") { 

								$id = $value;
							}

							else if ($key == "term"){ 

									echo "<div class='wrap'><h4 class='term'>" . $value . ": <div rel='" . $id . "' class='removeAppendix button' style='display: inline-block; width: 150px;'>Remove Term</div></h4> ";
						
							}

							else { echo "<div class='definition'>" . ucfirst($value) . "</div></div>"; }
				
						}
					}
				
					

					?>

					</div>

 				</div>
 			</div>

 		</body>
 	</html>