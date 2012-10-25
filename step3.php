

<?php
//come back here in 6 months... and cringe.
	$condition = $_GET['condition'];
	$type = $_GET['type'];
	$case = $_GET['case'];
	$extent = $_GET['extent'];
	$header = $type . ", " . $case;

	if(isset($extent)) { 

		$header .= ": " . $extent;

	}

	require_once("header.php");

	//open db connection: insecure on dev server. pass will be set when deployed
	$mysqli = new mysqli('localhost','root','','dental_info');

	//if it didn't work, throw error
	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}

?>
	
	
		<div data-role="content">

<?php

	$query = "SELECT h1.name AS lev1, h2.name AS lev2, h1.id AS lev1_id
		FROM $condition AS h1
		LEFT JOIN $condition AS h2 ON h2.parent_id = h1.id
		WHERE h1.name = '$type'";

	$results = $mysqli->query($query);

		if (!isset($extent)) { ?>

			<h3>Extent</h3>

			 <form action="step3.php" method="get">

				 <fieldset data-role="controlgroup" class="last">

					 <input type='hidden' value="<?php echo $condition; ?>" name='condition' />
					 <input type='hidden' value="<?php echo $type; ?>" name='type' />
					 <input type='hidden' value="<?php echo $case; ?>" name='case' />

<?php

			while($row = $results->fetch_assoc()) { 

			foreach($row as $key=>$val) { 

				if($key == "lev2" && $val) { 

					echo "\t\t\t\t\t<input type = 'radio' name = 'extent' id = '" . $val . "' value = '" . $val . "' />";
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

		else {

			$table = $type . " " . $case . " " . $extent;
			$table = str_replace(" ", "_", $table);

			$query = "select * from $table";

			$results = $mysqli->query($query);

			while($row = $results->fetch_assoc()) { 

				$count = 0;

				foreach($row as $k=>$v) { 
					

					$v =  html_entity_decode($v);
					$v = str_replace("<h3>", "\n\t\t\t\t\t</div>\n\t\t\t\t\t<li data-icon='arrow-d'><a>", $v);
					$v = str_replace("</h3>", "</a></li>\n\t\t\t\t\t<div class='hidden content'>",$v);
					//$v = str_replace("</li>", "</li>\n", $v);
					$v = str_replace("www", "http://www", $v);

					echo "\t\t\t<div data-role='collapsible' data-collapsed='false' data-theme='a' data-content-theme='d'>\n";
					echo "\t\t\t\t<h2>" . str_replace("_"," ",$k) ."</h2>\n";
            		//echo "\t\t\t<div data-role='collapsible'>\n";

					echo "\t\t\t\t<ul data-role='listview' class='subtitle' data-inset='true' data-theme='d'>\n";
					echo "\t\t\t\t\t<div>"; // so first li element doesn't close list
					echo $v . "</div>\n\t\t\t\t</ul>\n\t\t\t</div>\n";
					$count++;
				}
			}
		}
	

?>

		</div>
<?php 
	
	require_once("footer.php");
?>