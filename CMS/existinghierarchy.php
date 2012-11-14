<?php
	
	$mysqli = new mysqli("localhost","root","","dental_info");

	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}

	//boolean function
	function table_exists($table_name) { 

		$query = "select table_name FROM information_schema.tables
		WHERE table_schema = 'dental_info' AND table_name = '$table_name'";

		$mysqli = new mysqli('localhost','root','','dental_info');

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
	 	
	 	if(!isset($id)) { 

	 		echo '{ "conditions": [' ;

	 		$query = "SELECT * FROM conditions";

	 		$results = $mysqli->query($query);

	 		while($row = $results->fetch_assoc()) { 

	 			$json_string .= json_encode($row) . ",";

	 		}
	 		echo substr($json_string,0,-1);
	 		echo "]}";
		}


		else { 

			$query = "select * from $condition where parent_id";

			if($id == -1) { 

				$query .=  " IS NULL";

			}

			else { $query .= "= $id"; }

			$results = $mysqli->query($query);

		 	if ($results->num_rows > 0) { 

		 		echo '{ "name" : "' .  $condition  . '", "children": [' ;

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

		 	else { echo '{"children": [-1]}'; }


		 }
	 ?>
