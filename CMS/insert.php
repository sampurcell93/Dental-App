<!doctype html>
	<html>
		<head>
			
			 <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

 	</head>

 	<body>

<?php
	//get title of table
	$title = $_POST['title'];
	$title = utf8_encode($title);
	$title = str_replace(" ","_",$title);

	//get all text from input boxes, put into php array
	$text = $_POST['info'];
	$text = mysql_escape_string($text);
	$text = explode("|",$text);

	//get the comma delimeted list of headers, put into php array
	$headers = $_POST['headers'];
	$headers = explode("|",$headers);

	//create a table creation string which dynamically loads all of the headers into new columns
	$table_create_string = "CREATE TABLE $title (id int NOT NULL AUTO_INCREMENT, Primary Key(id), ";

		for($i = 0; $i < count($headers); $i++) { 

				$headers[$i] = str_replace(" ","_",$headers[$i]);

				if($i > 0) { 
					$headers[$i] = substr($headers[$i], 1, strlen($headers[$i]));
				}

				$table_create_string .= $headers[$i] . " text, ";
		
		}

		$table_create_string = substr($table_create_string,0,-2);
		$table_create_string .= ")";
		echo $table_create_string . "\n";

	$content_addition = "INSERT INTO $title VALUES('',";

		for($i = 0; $i < count($text); $i++) { 

				$text[$i] = mysql_real_escape_string($text[$i]);

				$content_addition .= "'" . $text[$i] . "', ";
		
		}

	$content_addition  = substr($content_addition, 0, -2);
	$content_addition .= ")";
	$content_addition = htmlspecialchars($content_addition);

	echo $content_addition;

	$mysqli = new mysqli("localhost","root","","dental_info");

	$mysqli->query($content_addition);

	$query = "SELECT * from $title";

	$results = $mysqli->query($query);

	while($row = $results->fetch_assoc()) {	

		foreach($row as $k=> $v) { 


				echo $v;
			

		}
	}

	mail("spurcell93@gmail.com","prof mufte added a node!","Get it!");
	?>

</body>
</html>