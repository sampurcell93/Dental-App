<!DOCTYPE HTML>
	<html lang="en">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1"> 
			<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
			<link rel="stylesheet" media="screen" type="text/css" href="css/style.css" />
			<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
			<script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>
			<script src="main2.js" type="text/javascript"></script>		
			<script type='text/javascript'>
				$(document).ready(function() {

					addContent.editor($(".relative.m10"));

					$("#submission").on("click",function() { 

						var val = $("#placeholder").html();
						$("[name=definition]").val(val);

					});

				});
			</script>

			<title>Add Dental Content</title>
		</head>

		<body>
			
			<div class='wrapper-border'>
				<div class='wrapper'>

					<form method="POST" action="appendix_try.php">

						<label for="term"><h2>Add a term:</h2>
							<input type="text" name="term" id="term" placeholder="Term name here." />
						</label>

						<div class='relative m10'>
							<div contenteditable class="description info" id='placeholder' ></div>
						</div>
						<textarea name='definition' class='hidden'></textarea>
 						<input type="submit" class="button" id='submission' name="submit" value="Submit" />
 					</form>


 					<h2>Appendix Terms</h2>

 					<div style="padding-left: 40px;">
 				<?php 
			
					$mysqli = new mysqli('localhost','sampurce_admin','kamehameha1','sampurce_dental');

					$results = $mysqli->query("select * from appendix ORDER BY term");

					while($row = $results->fetch_assoc()) {

						$id; 

						foreach ($row as $key => $value) { 

							if ($key == "id") { 

								$id = $value;
							}

							else if ($key == "term"){ 

									echo "<h4 class='appendix-term'>" . $value . ": <a rel='" . $id . "' class='removeAppendix'>Remove Term</a></h4> ";
						
							}

							else { echo "<div class='appendix-definition'>" . ucfirst($value) . "</div>"; }
				
						}
					}
				
					

					?>

					</div>

 				</div>
 			</div>

 		</body>
 	</html>