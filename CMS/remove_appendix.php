<?php

	$id = $_GET['id'];

	$mysqli = new mysqli('localhost','sampurce_admin','kamehameha1','sampurce_dental');

	$mysqli->query("DELETE FROM appendix where id=$id");

	echo "Successfully Deleted! <a class='cursor' onclick='location.reload(true)'>Refresh the page.</a>";