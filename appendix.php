<?php
	
	require_once("header.php");

	$mysqli = new mysqli('localhost','root','','dental_info');

	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}

	$results = $mysqli->query("select * from appendix ORDER BY term");
	
?>

			<div data-role="content">
				<h1 style="text-align: center;" >Appendix</h1>
<?php
	
		if ($results->num_rows > 0) { 
			
			while($row = $results->fetch_assoc()) { 

				foreach ($row as $key => $value) { 

					if ($key != "id") { 

						if ($key == "term"){ 
						
							echo "<h4 class='term'>" . $value . ":</h4> ";
						
						}

						else { echo "<div class='definition'>" . ucfirst($value) . "</div>"; }
				
					}
				}
			}
		}	

?>				</div>
			</div>
		</body>
	</html>