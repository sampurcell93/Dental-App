<!DOCTYPE HTML>
	<html lang="en">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
			<link rel="stylesheet" media="screen" type="text/css" href="css/style.css" />
			<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
			<script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>
			<script src="main2.js"></script>

			<title>Add Dental Content</title>
		</head>

		<body>

<?php

	$mysqli = new mysqli("localhost","sampurce_admin","kamehameha1","sampurce_dental");

	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}

	function row_exists($row_name) { 

		$mysqli = new mysqli('localhost','sampurce_admin','kamehameha1','sampurce_dental');
		$query = "select * from edentulism_content where tablename = '$row_name'";
		$results = $mysqli->query($query);
		
		if($results->num_rows) { 
			return 1;
		}
		return 0;
	}

	//get title of table
	$title_num = $_POST['title_num'];
	$title_num = utf8_encode($title_num);
	$title_words = $_POST['title_words'];
	$title_words = utf8_encode($title_words);


	if (isset($_POST['submit'])) { 

		//get all text from input boxes, put into php array
		$formatted = $_POST['formatted'];
		$formatted = mysql_escape_string($formatted);
		$formatted = utf8_encode($formatted);

		$barebones = $_POST['barebones'];
		$barebones = mysql_escape_string($barebones);
		$barebones = utf8_encode($barebones);

		$editable = $_POST['editable'];
		$editable = mysql_escape_string($editable);
		$editable = utf8_encode($editable);
		
		$result = $mysqli->query("select * from `edentulism_content` where tablename = '$title_num'");
		echo "select * from `edentulism_content` where tablename = '$title_num'";

		if (!$result->num_rows) 
			$insert_string = "insert into `edentulism_content` VALUES('','$title_num','$barebones','$formatted','$title_words', '$editable')";
		else {
			echo "editing";
			$insert_string = "UPDATE `edentulism_content`
								SET barebones = '$barebones',
								formatted = 'ballsonya',
								editable = '$editable'
							WHERE tablename = '$title_num'";
		}
		
		$mysqli->query($insert_string);

		$query = "SELECT 'barebones' from `edentulism_content` where tablename = '$title'";
		
		$results = $mysqli->query($query);

		mail("spurcell93@gmail.com","prof muftu added a node!","Get it!");
	?>

	<div class='wrapper-border'>
		<p style='text-align:center'>Your submission was successful!<br />
			<a href='index.php' class='button'>Go back</a>
		</p>

		<p style='text-align:center'><a id="showPreview" href="#">See what you created, as it exists in our databases.</a></p>

	<div id="dbPreview" style="display: none; ">


		<?php

			while ($row = $results->fetch_assoc()) { 

						echo html_entity_decode(str_replace("\n"," ",$row['barebones']));

			}

		}

		else { ?>


		<div class='wrapper-border'><p style='text-align:center'>Your submission was a failure. You did not click the submit button,
		 or the information you are trying to insert already exists. This bug has been reported!</p><br />
		<a href='index.php' class='button'>Go back</a>


		<?php } ?>


	</div>

</div>

</body>
</html>