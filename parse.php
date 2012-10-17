<?php

	require_once("header.php");


	//gets the choice selected from a certain level of hierarchy
	$choice = $_GET['c'];

	//open db connection: insecure on dev server. pass will be set when deployed
	$mysqli = new mysqli('localhost','root','','dental_info');

	//if it didn't work, throw error
	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}

?>

	<div data-role="content">

	 		<form method="GET" action="step2.php">

	 			<h3>Case:</h3>

	 			<fieldset data-role="controlgroup">
<?php

	$condition = $_GET['condition'];

	$results = $mysqli->query("select * from $condition where parent_id IS NULL");

		while($row = $results->fetch_assoc()) { 

	 				foreach($row as $k=>$v) { 

	 					if($k == "name") { 

	 						echo "<input type = 'radio' name = 'condition' id = '" 
	 							. str_replace(" ","_",$v) . "' value = '" . $v . "' />";

							echo "<label for='" . str_replace(" ","_",$v) . "' >" . $v . "</label>";
							
	 					}

	 				}

	 		}

?>

