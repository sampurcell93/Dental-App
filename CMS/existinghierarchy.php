<?php
	
	$mysqli = new mysqli("localhost","sampurce_admin","kamehameha1","sampurce_dental");

	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}

	//boolean function, returns true if a nde already has content
	function row_exists($row_name) { 

		$mysqli = new mysqli('localhost','sampurce_admin','kamehameha1','sampurce_dental');
		$query = "select * from edentulism_content where tablename = '$row_name'";
		$results = $mysqli->query($query);
		
		if($results->num_rows) { 
			return 1;
		}
		return 0;
	}

	 	$id = $_GET['id'];
	 	$tablename = $_GET['table'];
	 	$condition = $_GET['condition'];
	 	$json_string = "";
	 	
	 	//if we're starting the browser, there is no parent to check yet.
	 	if(!isset($id)) { 

	 		echo '{ "conditions": [' ;

	 		$query = "SELECT * FROM edentulism where parent_id IS NULL";

	 		$results = $mysqli->query($query);

	 		while($row = $results->fetch_assoc()) { 

	 			$json_string .= json_encode($row) . ",";

	 		}
	 		echo substr($json_string,0,-1);
	 		echo "]}";
		}

		// if we have a node, check its direct descendants and put em in json
		else { 

			$query = "select * from $condition where parent_id = $id";

			$results = $mysqli->query($query);

			// if the node has direct descendants, we want to echo them.
		 	if ($results->num_rows > 0) { 

		 		echo '{ "name" : "' .  $condition  . '", "children": [' ;

		 		while($row = $results->fetch_assoc()) { 
		 			
		 			$temp_table = $tablename;
		 			foreach($row as $k=>$v) {
	 					
	 					if ($k == "id") { 

		 					$json_string .=  '{"id":' . $v . ', ';
		 					$temp_table .= "_" . $v;

		 					if (row_exists($temp_table)) { 

		 						$json_string .= '"table_exists": 1,';

		 					}
		 					else { $json_string .= '"table_exists": 0, '; }

		 					$json_string .=  '"table_name": "' . $temp_table . '", ';
			 			}
		 				else if($k == "name") { 
			 				$json_string .= '"childname":"' . $v . '"}, ';
			 			}
			 		}
				}
		 			echo substr($json_string,0,-2);

		 			echo "]}";
		 	}

		 	else { 

		 		echo '{"children": [-1]}'; }
		 }
	 ?>
