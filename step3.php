<?php

	$condition = $_GET['condition'];
	$type = $_GET['type'];
	$case = $_GET['case'];
	$header = $type . ", " . $case;

	require_once("header.php");

	//open db connection: insecure on dev server. pass will be set when deployed
	$mysqli = new mysqli('localhost','root','','dental_info');

	//if it didn't work, throw error
	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}

	$query = "SELECT h1.name AS lev1, h2.name AS lev2, h1.id AS lev1_id
		FROM $condition AS h1
		LEFT JOIN $condition AS h2 ON h2.parent_id = h1.id
		WHERE h1.name = '$type'";

	$results = $mysqli->query($query);

	while($row = $results->fetch_assoc()) { 

		foreach($row as $key=>$val) { 

			echo $key .": " . $val . "<br />";

		}

	}



?>

	

	<div data-role="content">

	</div>
<?php 
	
	require_once("footer.php");
?>