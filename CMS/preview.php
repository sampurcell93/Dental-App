<!DOCTYPE HTML>
	<html lang="en">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
			<link rel="stylesheet" media="screen" type="text/css" href="css/style.css" />
			<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
			<script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>
			<script src="main.js"></script>

			<title>Add Dental Content</title>
		</head>

		<body>

<?php

	$mysqli = new mysqli("localhost","root","","dental_info");

	if($mysqli->connect_errno) { 

		echo $mysqli->connect_error;
		exit();

	}