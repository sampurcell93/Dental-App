<?php
	
	$mysqli = new mysqli("localhost","root","","dental_info");

	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}

	?>

	 	<?php

	 			$results = $mysqli->query("SELECT * FROM conditions");

	 			echo "<div style='display: block; width: 100%;'>";

	 			while($row = $results->fetch_assoc()) { 


	 				foreach($row as $k=>$v) { 

	 					if($k == "name") { 
	 						echo "<span>$v</span>";
	 					}
	 				}
	 			}
	 			echo "</div>";	 			
	 	?>
