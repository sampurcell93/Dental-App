<!doctype html>
	<html>
		<head>
			 <meta http-equiv="Content-Type"
 content="text/html; charset=utf-8">

 	</head>

 	<body>

<?php

	$title = $_POST['title'];
	$title = utf8_encode($title);
	$info = $_POST['info'];
	$info = utf8_encode($info);

	$mysqli = new mysqli("localhost","root","","dental_info");

	$query = "INSERT INTO info VALUES('','$title','$info')";

	$mysqli->query($query);

	$query = " SELECT * from info where spec = '$title'";

	$results = $mysqli->query($query);

	while($row = $results->fetch_assoc()) {	

		foreach($row as $k=> $v) { 

			if ($k == "info") { 

				echo $v;
			}

		}
	}

	mail("spurcell93@gmail.com","prof mufte added a node!","Get it!");

	?>

</body>
</html>