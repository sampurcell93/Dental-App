<?php
	
	require_once("header.php");
	
	$choice = $_GET['c'];
	$level = $_GET['lev'];

	$mysqli = new mysqli('localhost','root','','dental_info');

	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}

	$results = $mysqli->query("SELECT h1.spec_name AS lev1, h2.spec_name AS lev2
	FROM hierarchy AS h1
LEFT JOIN hierarchy AS h2 ON h2.parent_id = h1.id
WHERE h1.spec_name =  '$choice'");
	
?>

			<div data-role="page" data-add-back-btn="true" data-collapsible>
				<div data-role="header" data-theme="a" data-add-back-btn="true">

					<h1><?php echo $choice; ?></h1>

				</div>

				<div data-role="content">
<?php
	
		if($results->num_rows > 1) {

			?>

				<ul data-role="listview" data-theme="b" class="choice">
		 		<?php 

		 		while($row = $results->fetch_assoc()) { 

					foreach ($row as $key => $value) { 

						if ($key == "lev2") {
							echo "<li><a href='parse.php?&c=" . $value . "' >" . $value . "</a></li>";
						}
					}
				}

				?>

				</ul>

		<?php } 

		if ($results->num_rows > 0) {

			while($row = $results->fetch_assoc()) { 

				foreach ($row as $key => $value) { 

				echo $key . ": " . $value; 

				}

			}
		}

?>		
<!--<h2>Media</h2>
<video controls="controls">
  <source src="http://www.808.dk/pics/video/gizmo.mp4" type="video/mp4" />
  <source src="http://www.808.dk/pics/video/gizmo.webm" type="video/webm" />
  <source src="http://www.808.dk/pics/video/gizmo.ogv" type="video/ogg" />
  Video not playing? <a href="http://www.808.dk/pics/video/gizmo.mp4">Download file</a> instead.
</video>
-->

				</div>
			</div>
				
		</body>

		</html>