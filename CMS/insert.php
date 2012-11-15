<!DOCTYPE HTML>
	<html lang="en">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
			<link rel="stylesheet" media="screen" type="text/css" href="css/style.css" />
			<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
			<script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>
			<script src="main.js"></script>

			<title>Add Dental Content</title>
		</head>

		<body>

<?php

	$mysqli = new mysqli("localhost","sampurce_admin","kamehameha1","sampurce_dental");

	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}

	function table_exists($table_name) { 

		$query = "select table_name FROM information_schema.tables
		WHERE table_schema = 'sampurce_dental' AND table_name = '$table_name'";

		$mysqli = new mysqli('localhost','sampurce_admin','kamehameha1','sampurce_dental');

		$results = $mysqli->query($query);

		if($results->num_rows) { 
			return 1;
		}
		return 0;
	}


	//get title of table
	$title = $_POST['title'];
	$title = utf8_encode($title);

	if (isset($_POST['submit']) && !table_exists($title)) { 

		//get all text from input boxes, put into php array
		$text = $_POST['info'];
		$text = mysql_escape_string($text);
		$text = explode("|",$text);

		//get the comma delimeted list of headers, put into php array
		$headers = $_POST['headers'];
		$headers = explode("|",$headers);

		//create a table creation string which dynamically loads all of the headers into new columns
		$table_create_string = "CREATE TABLE $title (";

		for($i = 0; $i < count($headers); $i++) { 

				$headers[$i] = str_replace(" ","_",$headers[$i]);


				if($i > 0) { 
					$headers[$i] = substr($headers[$i], 1, strlen($headers[$i]));
				}


				if($headers[$i] == "Procedure" || $headers[$i] == "procedure") { 

					$headers[$i] = "Procedures";

				}

				$table_create_string .= $headers[$i] . " text, ";
			
		}

	$table_create_string = substr($table_create_string,0,-2);
	$table_create_string .= ")";
	
	$mysqli->query($table_create_string);

	$content_addition = "INSERT INTO $title VALUES(";

		for($i = 0; $i < count($text); $i++) { 

				$text[$i] = mysql_real_escape_string($text[$i]);

				$content_addition .= "'" . $text[$i] . "', ";
		
		}

	$content_addition  = substr($content_addition, 0, -2);
	$content_addition .= ")";
	$content_addition  = htmlentities($content_addition);

	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}

	$mysqli->query($content_addition);

	$query = "SELECT * from $title";

	$results = $mysqli->query($query);


	mail("spurcell93@gmail.com","prof muftu added a node!","Get it!");
	?>

	<div id='lander_wrap'>
		<p style='text-align:center'>Your submission was successful!<br />
			<a href='index.php' class='button'>Go back</a>
		</p>

		<p style='text-align:center'><a id="showPreview" href="#">See what you created, as it exists in our databases.</a></p>

	<div id="dbPreview" style="display: none; ">


		<?php

			while ($row = $results->fetch_assoc()) { 

				foreach($row as $k=>$v) { 


					echo "<h2>" . str_replace("_"," ",$k) . "</h2>";
					echo html_entity_decode(str_replace("\n"," ",$v));


				}

			}

		}

		else { ?>


		<div id='lander_wrap'><p style='text-align:center'>Your submission was a failure. You did not click the submit button,
		 or the information you are trying to insert already exists. Please report this bug to Samuel.Purcell@tufts.edu! </p><br />
		<a href='index.php' class='button'>Go back</a>


		<?php } ?>


	</div>

</div>

</body>
</html>