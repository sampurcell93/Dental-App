
<?php

	require_once( "header.php");

	?>

		<div data-role="page" id="home" >
 
		  <div data-role="header">
		    <h1>Dental App</h1>
		  </div>
		 
		 <div data-role="content"> 
		 	<ul data-role="listview" data-theme="b" class="choice">
		 		<li>Choose a type of crown:</li>

		 		<li><a href="parse.php?c=fixed&lev=1" >Fixed</a></li>
		 		<li><a href="parse.php?c=removable&lev=1">Removable</a></li>
		 	</ul>
		  </div>

		
</body>
</html>