<?php
	
	require_once("header.php");
	

	$choice = $_GET['c'];
	$level = $_GET['lev'];

	$mysqli = new mysqli('localhost','root','','dental_info');

	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}

	$results = $mysqli->query("SELECT h1.spec_name AS lev1, h2.spec_name AS lev2, h1.id as parent
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

						if ($key == "lev2" && $value != NULL) {
							echo "<li><a href='parse.php?&c=" . $value . "' >" . $value . "</a></li>";
						}
					}
				}

				?>

				</ul>

		<?php } 

		else if ($results->num_rows == 1) {

				$row = $results->fetch_assoc();

				$table = $row['lev1'];

				echo $table;

				$results = $mysqli->query("select * from `$table`") ;

				//$row = $results->fetch_assoc();

				foreach ($row as $key => $value) { 

					if($key != "id"){

						echo "<h2>" . $key . "</h2>";
						echo "<p>" . $value . "</p>";

					}
				}

		}

?>	

				</div>
			</div>
				
		</body>

		</html>
