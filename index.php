
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
		 		<li><a href="#fixed" >Fixed</a></li>
		 		<li><a href="#removable" >Removable</a></li>
		 	</ul>
		  </div>

		  <div data-role="footer" class="ui-bar" data-position="fixed">
		  		<a href="appendix.php" >Appendix</a>
		  	</div>

		</div>

		<div data-role="page" id="fixed" data-referrer="fixed">
			<ul data-role="listview" data-theme="b" class="choice">
		 		<li><a href="#multi" >Partial</a></li>
		 		<li><a  class="bottomLevel" >Complete</a></li>
		 	</ul>
		</div>

		<div data-role="page" id="removable" data-referrer="removable">
			<ul data-role="listview" data-theme="b" class="choice">
		 		<li><a class="bottomLevel" >Partial</a></li>
		 		<li><a class="bottomLevel"  >Complete</a></li>
		 	</ul>
		</div>
 
 		<div data-role="page" id="multi" data-referrer="fixed">
			<ul data-role="listview" data-theme="b" class="choice">
		 		<li><a  class="bottomLevel" >Single</a></li>
		 		<li><a  class="bottomLevel" >Multiple</a></li>
		 	</ul>
		</div>

</body>
</html>