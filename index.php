<?php
	$fancyheader = 1;
	require_once("header.php");

	$mysqli = new mysqli("localhost","sampurce_admin","kamehameha1","sampurce_dental");

	//if it didn't work, throw error
	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}
	$condition = "edentulism";

?>

	<div data-role="content">

		<!--pass along the original condition (edentulism to start)-->
	 		<form method="GET" action="step3.php" >

	 			<h3>Case:</h3>

	 			<fieldset data-role="controlgroup" data-submission="step2.php" data-condition=<?php echo "'" . $condition . "'"; ?>>
	 				<input type="hidden" value=<?php echo "'" . $condition . "'" ?> name="condition" />
<?php

	$results = $mysqli->query("select * from edentulism where parent_id = '11'");


		while($row = $results->fetch_assoc()) { 

	 				foreach($row as $k=>$v) { 

	 					if($k == "id") { 

	 						$id = $v;
	 						echo "\t\t\t\t\t<input type = 'radio' name = 'case' id = '" .
	 							$v;
	 					}
	 					else if ($k == "name") { 

	 						$name = $v;
							echo  "' value = '" . $id . "' />";
						
	 					}

	 				}
							echo "<label for='" . $id . "' >" . $name . "</label>\n";
	 		}
?>				</fieldset>

				<div class="ajaxContent"></div>

				<div data-role="controlgroup" data-type="horizontal" style="text-align:right" >
					<a data-role="button" data-theme="b" style="display: none;" id="continue" >Continue</a>          
				</div>
			</form>
	</div>


<?php 
	
	require_once("footer.php");
?>
	
