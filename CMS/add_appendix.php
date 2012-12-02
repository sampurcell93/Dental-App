<!DOCTYPE HTML>
	<html lang="en">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1"> 
			<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
			<link rel="stylesheet" media="screen" type="text/css" href="css/style.css" />
			<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
			<script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>
			<script src="main2.js" type="text/javascript"></script>		

			<title>Add Dental Content</title>
		</head>

		<body>
			
			<div class='wrapper-border'>
				<div class='wrapper'>

					<form method="POST" action="appendixTry.php">

						<label for="term"><h2>Add a term:</h2>
							<input type="text" name="term" id="term" placeholder="Term name here." />
						</label>

						<div class='relative m10'>
							<div contentEditable='true' class="definition info" name="definition" placeholder="Enter the definition here."></div>
							<ul class='editor'><li data-role='List' data-content=' <ul><li>List 1</li><li>List 2</li><li>List 3</li>' class='addList icon add'>&#xe000;</li><li class='addImage input icon'>&#xe002;<div><input type='text' class='inline w60' placeholder='Enter image URL' /><span class='url add'></span><span class='button p0 inline w30'>Add</span></div></li><li class='addLink input icon' >&#xe001;<div><input type='text' class='inline' placeholder='Enter link URL' /><span class='url add'></span><span class='button p0 inline w30'>Add</span></div></li><li data-role='Media' class='addMedia icon' >&#xe004;<div class='scroll'><ul class='fileList'><li class="media_icon add" data-content="<br /><video controls='controls'><source src='fupload/server/php/files/19 Thrift Shop (feat. Wanz).mp4' type='video/mp4;' /></video><br />">19 Thrift Shop (feat. Wanz).mp4</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/clouds.jpeg' /><br />">clouds.jpeg</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/clouds.jpg' /><br />">clouds.jpg</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/Contact.png' /><br />">Contact.png</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/Conversation.png' /><br />">Conversation.png</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/cube.jpg' /><br />">cube.jpg</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/darkmenu.jpg' /><br />">darkmenu.jpg</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/everest.jpeg' /><br />">everest.jpeg</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/facebook.png' /><br />">facebook.png</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/fto_prelim.jpg' /><br />">fto_prelim.jpg</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/genericorp.png' /><br />">genericorp.png</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/highup (1).jpeg' /><br />">highup (1).jpeg</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/highup.jpeg' /><br />">highup.jpeg</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/hotplanet_thumb.jpg' /><br />">hotplanet_thumb.jpg</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/iphone.jpg' /><br />">iphone.jpg</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/iphone.png' /><br />">iphone.png</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/jumbosmash_splash_thumb.jpg' /><br />">jumbosmash_splash_thumb.jpg</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/milkyeway.jpeg' /><br />">milkyeway.jpeg</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/milkyeway.jpg' /><br />">milkyeway.jpg</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/miniscapture.jpg' /><br />">miniscapture.jpg</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/purple.jpeg' /><br />">purple.jpeg</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/rainbow.jpeg' /><br />">rainbow.jpeg</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/warped.png' /><br />">warped.png</li><li class="media_icon add" data-content="<br /><img src='fupload/server/php/files/youtube.png' /><br />">youtube.png</li></ul></div></li><li data-content=' <strong>Your tssext</strong> done' class='bold icon add' ><strong>B</strong></li><li data-content=' <em>Your text</em> done' class='italic icon add' ><em>i</em></li><li data-content=' <u>Your tessxt</u> done' class='underline icon add' ><u>U</u></li></ul> 
						</div>
 						<input type="submit" class="button" name="submit" value="Submit" />
 					</form>


 					<h2>Remove a term:</h2>

 					<div style="padding-left: 40px;">
 				<?php 
			
					$mysqli = new mysqli('localhost','sampurce_admin','kamehameha1','sampurce_dental');

					$results = $mysqli->query("select * from appendix ORDER BY term");

					while($row = $results->fetch_assoc()) {

						$id; 

						foreach ($row as $key => $value) { 

							if ($key == "id") { 

								$id = $value;
							}

							else if ($key == "term"){ 

									echo "<div class='wrap'><h4 class='term'>" . $value . ": <div rel='" . $id . "' class='removeAppendix button' style='display: inline-block; width: 150px;'>Remove Term</div></h4> ";
						
							}

							else { echo "<div class='definition'>" . ucfirst($value) . "</div></div>"; }
				
						}
					}
				
					

					?>

					</div>

 				</div>
 			</div>

 		</body>
 	</html>