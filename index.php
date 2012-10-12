<?php
	
	$mysqli = new mysqli("localhost","root","","dental_info");

	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}

	require_once("header.php");

	?>
        
	 	<div data-role="content">

	 		<form method="GET" action="parse.php">

	 			<h3>Select a Condition</h3>

	 			<fieldset data-role="controlgroup">

	 	<?php

	 			$results = $mysqli->query("SELECT * FROM conditions");

	 			while($row = $results->fetch_assoc()) { 

	 				foreach($row as $k=>$v) { 

	 					if ($k == "name") {
	 						echo "<input type = 'radio' name = 'condition' id = '" 
	 							. str_replace(" ","_",$v) . "' value = '" . $v . "' />";

							echo "<label for='" . str_replace(" ","_",$v) . "' >" . $v . "</label>";
	 					}
	 				}

	 			}
	 	?>

	 			</fieldset>
	 		</form>
	 	</div>
	 </body>
</html>