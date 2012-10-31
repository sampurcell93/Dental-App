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

?>

	<div data-role="content">

		<!--pass along the original condition (edentulism to start)-->
	 		<form method="GET" action="step3.php" >

	 			<h3>Case:</h3>

	 			<fieldset data-role="controlgroup" data-submission="step2.php" data-condition=<?php echo "'" . $condition . "'"; ?>>
	 				<input type="hidden" value=<?php echo "'" . $condition . "'" ?> name="condition" />
<?php

	$results = $mysqli->query("select * from $condition where parent_id IS NULL");


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
	
