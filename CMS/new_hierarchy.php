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

	