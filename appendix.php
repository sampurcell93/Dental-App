<?php
	
	require_once("header.php");

	$mysqli = new mysqli('localhost','root','','dental_info');

	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}

	$results = $mysqli->query("select * from appendix");
	
?>

			<div data-role="page">
				<div data-role="header" data-theme="a">
					<a data-rel="back">Back</a>
					<h1>Appendix</h1>
				</div>

				<div data-role="content">
<?php
	
		if ($results->num_rows > 0) { 
			
			while($row = $results->fetch_assoc()) { 

				foreach ($row as $key => $value) { 

					if ($key != "id") { 

						if ($key == "term"){ 
						
							echo "<strong>" . $value . ":</strong> ";
						
						}

						else { echo $value . ". <br /><br />"; }
				
					}

				}
			}
		}	

?>				</div>
			</div>
				
		</body>

		</html>