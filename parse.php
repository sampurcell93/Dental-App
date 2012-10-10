<?php

	require_once("header.php");

//so, a sample call of this function would be parse_words("tom,joe,dan",",")
//this would parse each comma delimeted word into a separate array cell.

	function parse_words($string,$delimeter) { 

		$words = array();
		$position = 0;
		$wordnum = 0;
		$words[$wordnum] = " ";

		while($position < strlen($string)) { 

			while($string[$position] != $delimeter) {


				$words[$wordnum] .= $string[$position];
				$position++;

				if ($position >= strlen($string)) { 

					break;

				}
			}

			if ($position >= strlen($string)) { 

					break;

			}

				$wordnum++;
				$words[$wordnum] = "";
				$position++;


		}

		return $words;

	}


	//gets the choice selected from a certain level of hierarchy
	$choice = $_GET['c'];

	//open db connection: insecure on dev server. pass will be set when deployed
	$mysqli = new mysqli('localhost','root','','dental_info');

	//if it didn't work, throw error
	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}

	//query hierarchy table for the selection and its direct child(ren).
	$results = $mysqli->query("SELECT h1.spec_name AS lev1, h2.spec_name AS lev2, h1.id as lev1_id
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

				//if a hierarchy is present (IE, more than one child), present a list of choices.
				if($results->num_rows > 1) {

			?>
				<ul data-role="listview" data-theme="b" class="choice">

		 		<?php 

		 		while($row = $results->fetch_assoc()) { 

					foreach ($row as $key => $value) { 

						//send the choices back to this page, except the query above will produce a different results table
						if ($key == "lev2" && $value != NULL) {
							echo "<li><a href='parse.php?&c=" . $value . "&id=" . $row['lev1_id'] ."' >" . $value . "</a></li>";
						}
					}
				}

				?>

				</ul>

		<?php } 

			//if there was only one child, then there is no choice for the user to make, 
			//and we must display the information instead of another choice
			else if ($results->num_rows == 1) {

				$row = $results->fetch_assoc();

				$procedure_name = $row['lev1'];

				$id = $row['lev1_id'];

				//go to info table to get the data related to this procedure
				$results = $mysqli->query("select * from info where spec = '$choice'") ;

				while($row = $results->fetch_assoc()) { 

					foreach ($row as $key => $value) { 	

						if($key == "info") { 

							echo $value;

						}

					}
				}
			}	



?>	

				</div>
			</div>
		</body>
	</html>