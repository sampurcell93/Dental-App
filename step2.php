<?php

	
	$case = $_POST['case'];
	$condition = $_POST['condition'];

	$mysqli = new mysqli("localhost","sampurce_admin","kamehameha1","sampurce_dental");

	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}

?>

	<h4 class='procedures'>Type of Procedure:</h3>

	<fieldset data-role="controlgroup">

<?php
	
	$query = "SELECT h1.name AS lev1, h2.name as lev2_name, h2.id AS lev2, h1.id AS lev1_id
			FROM $condition AS h1
			LEFT JOIN $condition AS h2 ON h2.parent_id = h1.id
			WHERE h1.id =  '$case'";

	$results = $mysqli->query($query);

	while( $row = $results->fetch_assoc()) { 

		foreach ($row as $k=>$v) {

			if ($k == "lev2_name") { 

				$text = $v;

			}

			if($k == "lev2") { 

				echo "\t\t\t\t\t<input type = 'radio' name = 'type' id = '" . $v . "' value = '" . $v . "' />";
				echo "<label for='" . $v ."'>" . $text ."</label>";
			}

		}


	}

	?>