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

	$choice = $_GET['c'];

	
	//open db connection: insecure on dev server. pass will be set when deployed
	$mysqli = new mysqli('localhost','root','','dental_info');

	//if it didn't work, throw error
	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}

	//query hierarchy table for the top level and all paths.
	$results = $mysqli->query("SELECT h1.spec_name AS lev1, h2.spec_name AS lev2, h3.spec_name as lev3, h4.spec_name as lev4
								FROM hierarchy AS h1
								LEFT JOIN hierarchy AS h2 ON h2.parent_id = h1.id
								LEFT JOIN hierarchy AS h3 ON h3.parent_id = h2.id
								LEFT JOIN hierarchy AS h4 ON h4.parent_id = h3.id
								WHERE h1.spec_name =  '$choice'");

						$lev2 = array();
						$lev3 = array();

						$count2 = 0;
						$count3 = 0;

						//puts all instances of level 2s into an array, and all level 3s into their own for organization
						while($row = $results->fetch_assoc()) {

							foreach($row as $key=>$value) { 

							

								if ($key == "lev2") { 
									$lev2[$count2] = $value;
									$count2++;
								}
								else if ( $key == "lev3") { 
									$lev3[$count3] = $value;
									$count3++;
								}

							}

						}

						for ($i = 0; $i < count($lev2); $i++) { 

							echo $lev2[$i] . "\n";

						}	
						for ($i = 0; $i < count($lev3); $i++) { 

							echo $lev3[$i];

						}
					
								?>
