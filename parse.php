<?php
	
	require_once("header.php");
	
	$top_level = $_GET['t'];
	$spec = $_GET['s'];

	$mysqli = new mysqli('localhost','root','','dental_info');

	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}

	$results = $mysqli->query("select * from $top_level where specs='$spec'");
	
?>

			<div data-role="page" data-add-back-btn="true" data-collapsible>
				<div data-role="header" data-theme="a" data-add-back-btn="true">

					<h1><?php echo $top_level . ", " . $spec; ?></h1>

				</div>

				<div data-role="content">
<?php
	
		if ($results->num_rows > 0) { 

			while($row = $results->fetch_assoc()) { 

				foreach ($row as $key => $value) { 

					if (!$key) { $key = "NULL"; }
				
					else if($key == "maintenance" ||  $key == "general_info") { 

						echo "<h2 data-role ='collapsible'>" . $key . " </h2>";
						echo "<p>" . $value . "</p>";

					}

					else if ($key == "procedures") { 

						echo "<h2>" . $key . " </h2>";
						echo $value;

					}

				

				}

			}
		}

?>		
<h2>Media</h2>
<video controls="controls">
  <source src="http://www.808.dk/pics/video/gizmo.mp4" type="video/mp4" />
  <source src="http://www.808.dk/pics/video/gizmo.webm" type="video/webm" />
  <source src="http://www.808.dk/pics/video/gizmo.ogv" type="video/ogg" />
  Video not playing? <a href="http://www.808.dk/pics/video/gizmo.mp4">Download file</a> instead.
</video>


				</div>
			</div>
				
		</body>

		</html>