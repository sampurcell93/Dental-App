<?php

	$id = $_GET['id'];

	$mysqli = new mysqli("localhost","root","","dental_info");

	$mysqli->query("DELETE FROM appendix where id=$id");

	echo "Successfully Deleted! Refresh the page.";