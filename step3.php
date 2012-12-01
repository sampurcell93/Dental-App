<?php
//come back here in 6 months... and cringe.
	$condition = $_GET['condition'];
	$condition = lcfirst($condition);
	$content_table = $condition . "_content";
	$type = $_GET['type'];
	$case = $_GET['case'];
	$extent = $_GET['extent'];
	$header = $type . ", " . $case;
	$tablefull = $case . "_" . $type . "_" . $extent;
	$tablehalf = $case . "_" . $type;
	$tablebasic = $case;
	$base = 1;
	require_once("header.php");

	//open db connection: insecure on dev server. pass will be set when deployed
	$mysqli = new mysqli("localhost","sampurce_admin","kamehameha1","sampurce_dental");

	//if it didn't work, throw error
	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}

	function has_children($id, $condition)  {
		$mysqli = new mysqli("localhost","sampurce_admin","kamehameha1","sampurce_dental");
		$query = "select * from $condition where parent_id = $id";
		$results = $mysqli->query($query);
		if ($results->num_rows) { 
		
			return 1;
		}
		return 0;
	}

	function row_exists($row_name) { 

		$mysqli = new mysqli('localhost','sampurce_admin','kamehameha1','sampurce_dental');
		$query = "select * from edentulism_content where tablename = '$row_name'";
		$results = $mysqli->query($query);
		
		if($results->num_rows) { 
			return 1;
		}
		return 0;
	}

?>
	
	
		<div data-role="content">

<?php

	$query = "SELECT h1.name AS lev1, h2.id as lev2_id,  h2.name AS lev2, h1.id AS lev1_id
		FROM $condition AS h1
		LEFT JOIN $condition AS h2 ON h2.parent_id = h1.id
		WHERE h1.id = '$type'";

	$results = $mysqli->query($query);
	$correct_table_value;

	//at each stage in the hierarchy, there's the possibility that a node has been added for that particular level. this checks all cases

		if (row_exists($tablefull)) { $correct_table_value = $tablefull; }
		else if (row_exists($tablehalf)) { $correct_table_value = $tablehalf; }
		else if (row_exists($tablebasic)) { $correct_table_value = $tablebasic; }
		
		if (!isset($extent) && !row_exists($tablebasic) && !row_exists($tablefull) && !row_exists($tablehalf)){ ?>

			<h3>Extent</h3>

			 <form action="step3.php" method="get">

				 <fieldset data-role="controlgroup" class="last">

					 <input type='hidden' value="<?php echo $condition; ?>" name='condition' />
					 <input type='hidden' value="<?php echo $type; ?>" name='type' />
					 <input type='hidden' value="<?php echo $case; ?>" name='case' />

<?php

			while($row = $results->fetch_assoc()) { 

			foreach($row as $key=>$val) { 

				if($key == "lev2_id") { 

					$id = $val;

				}

				if($key == "lev2" && $val) { 

					echo "\t\t\t\t\t<input type = 'radio' name = 'extent' id = '" . $val . "' value = '" . $id . "' />";
					echo "<label for='" . $val ."'>" . $val ."</label>";
				}

			}
		}

			echo "\t</fieldset>";
			echo '
				<div data-role="controlgroup" data-type="horizontal" style="text-align:right" >
					<a data-role="button" data-theme="b" id="continue" >Continue</a>          
				</div>';
			echo "</form>";

		}
		
		else if (!has_children($type,$condition) || !has_children($extent,$condition)){
			
			$query = "select formatted from $content_table where tablename = '$correct_table_value'";
			
			$results = $mysqli->query($query);

			while($row = $results->fetch_assoc()) { 

				foreach($row as $k=>$v) { 
					if ($k == "formatted")
						echo $v ;
				
				}
			}
		}

		else { 

			echo "There seems to be a problem...!";

		}

	
?>

		</div>
<?php 
	
	require_once("footer.php");
?>