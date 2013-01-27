<?php

	$mysqli = new mysqli("localhost","sampurce_admin","kamehameha1","sampurce_dental");

	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		echo "!";
		exit();

	}

	$parents = $_GET['parents'];
	$query = "select * from `edentulism_content` where tablename = '$parents'";
	$results = $mysqli->query($query);
	$row = $results->fetch_assoc(); 
	echo $row['editable'];
