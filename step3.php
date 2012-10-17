<?php

	require_once("header.php");

	//open db connection: insecure on dev server. pass will be set when deployed
	$mysqli = new mysqli('localhost','root','','dental_info');

	//if it didn't work, throw error
	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}
	$condition = $_GET['condition'];
	$case = $_GET['case'];

?>

	<div data-role="content">

	</div>
<?php 
	
	require_once("footer.php");
?>