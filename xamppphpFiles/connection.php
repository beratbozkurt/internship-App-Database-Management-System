<?php
// This page helps to connect frontend and datbase


$dbhost = "localhost";    ////!!!Your MySQL enterance data!!!////
$dbuser = "root";
$dbpass = "1798";

	if($con = mysqli_connect($dbhost, $dbuser, $dbpass, "database_project"))
	{

	}
	else{

	die("Connection Failed To Database Service!!!");

	}
?>