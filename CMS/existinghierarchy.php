<?php
	
	$mysqli = new mysqli("localhost","root","","dental_info");

	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}

	?>

 	<?php

	 	$id = $_GET['id'];
	 	$json_string = "";
	 	$condition = $_GET['condition'];
	 	
	 		if(!isset($id)) { 

	 			echo '{ "conditions": [' ;

	 			$query = "SELECT * FROM conditions";

	 			$results = $mysqli->query($query);

	 			while($row = $results->fetch_assoc()) { 

	 			$json_string .= json_encode($row) . ",";

	 				$id;

	 				foreach($row as $k=>$v) { 

	 					if ($k == "id") { 

	 						$id = $v;

	 					}

	 					if($k == "name") { 
	 						//echo "<span id='$id' data-condition='$v'>$v</span>";
	 					}
	 				}
	 			}
	 			echo substr($json_string,0,-1);

	 			echo "]}";
			}

		else { 


			echo '{ "name" : "' .  $condition  . '", "children": [' ;

			$query = "select * from $condition where parent_id = $id";

			$results = $mysqli->query($query);
	 			
	 		while($row = $results->fetch_assoc()) { 

	 			foreach($row as $k=>$v) {
 
	 				if($k == "name") { 

		 				$json_string .= '"' . $v . '"], ';

		 			}

		 			else if ($k == "id") { 

		 				$json_string .=  '["' . $v . '", ';
		 			}
		 		}

		 		$count++;

			}


	 			echo substr($json_string,0,-2);

	 			echo "]}";
	 	}
	 ?>
