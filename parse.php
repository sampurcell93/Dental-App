<?php
	
	require_once("header.php");
	
<<<<<<< HEAD
	$choice = $_GET['c'];
	$level = $_GET['lev'];
=======
	$top_level = $_GET['t'];
	$spec = $_GET['s'];
>>>>>>> upstream/master

	$mysqli = new mysqli('localhost','root','','dental_info');

	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}

<<<<<<< HEAD
	$results = $mysqli->query("SELECT h1.spec_name AS lev1, h2.spec_name AS lev2, h1.id as parent
								FROM hierarchy AS h1
								LEFT JOIN hierarchy AS h2 ON h2.parent_id = h1.id
								WHERE h1.spec_name =  '$choice'");
=======
	$results = $mysqli->query("select * from $top_level where specs='$spec'");
>>>>>>> upstream/master
	
?>

			<div data-role="page" data-add-back-btn="true" data-collapsible>
				<div data-role="header" data-theme="a" data-add-back-btn="true">

<<<<<<< HEAD
					<h1><?php echo $choice; ?></h1>
=======
					<h1><?php echo $top_level . ", " . $spec; ?></h1>
>>>>>>> upstream/master

				</div>

				<div data-role="content">
<<<<<<< HEAD

			<?php
	
				if($results->num_rows > 1) {

			?>

				<ul data-role="listview" data-theme="b" class="choice">

		 		<?php 

		 		while($row = $results->fetch_assoc()) { 

					foreach ($row as $key => $value) { 

						if ($key == "lev2" && $value != NULL) {
							echo "<li><a href='parse.php?&c=" . $value . "' >" . $value . "</a></li>";
						}
					}
				}

				?>

				</ul>

		<?php } 

		if ($results->num_rows == 1) {

				$row = $results->fetch_assoc();

				$table = $row['lev1'];

				$results = $mysqli->query("select * from `$table`") ;

				$row = $results->fetch_assoc();

				foreach ($row as $key => $value) { 

					if($key != "id"){

						echo "<h2>" . $key . "</h2>";
						echo "<p>" . $value . "</p>";

					}
				}

		}

?>		
<!--<h2>Media</h2>
=======
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
>>>>>>> upstream/master
<video controls="controls">
  <source src="http://www.808.dk/pics/video/gizmo.mp4" type="video/mp4" />
  <source src="http://www.808.dk/pics/video/gizmo.webm" type="video/webm" />
  <source src="http://www.808.dk/pics/video/gizmo.ogv" type="video/ogg" />
  Video not playing? <a href="http://www.808.dk/pics/video/gizmo.mp4">Download file</a> instead.
</video>
<<<<<<< HEAD
-->
=======

>>>>>>> upstream/master

				</div>
			</div>
				
		</body>

		</html>