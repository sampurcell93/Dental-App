<!DOCTYPE HTML>
	<html lang="en">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
			<link rel="stylesheet" media="screen" type="text/css" href="css/style.css" />
			<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
			<script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>
			<script src="main.js"></script>

			<title>Appendix Updated</title>
		</head>

		<body>


<?php

	if(isset($_POST['submit'])) { 

		$term = $_POST['term'];
		$def = $_POST['definition'];

		$mysqli = new mysqli("localhost","root","","dental_info");

		$mysqli->query("INSERT INTO appendix VALUES ('','$term','$def')");


		if($mysqli->connect_errno) { 

			echo $mysqli->connect_error;
			exit();

		}

			echo "<div id='lander_wrap'><p style='text-align:center'>Your submission of term <strong>" . $term . "</strong> <br />";
			echo "<em>'" . $def . "'</em> was successful. Appendix updated!</p>";
			echo "<a href='index.php' class='button'>Go back</a></div>";


	}

	else { 

		echo "You need to add a term and a definition to add to the appendix.";

	}