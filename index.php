
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
<!-- The first list can be as long as it needs to... as long as hierarchy is preserved as content is added, this
	this should work. Now, the current bug is: what if Fixed has a partial, and so does removable? Working on that now -->
		
		  <div data-role="footer" data-position="fixed">
		    <h4><a href="appendix.php">Appendix</a></h4>
		  </div>


</body>
</html>