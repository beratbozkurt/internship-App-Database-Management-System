<?php 
session_start();

	include("connection.php");

    if($_SERVER['REQUEST_METHOD'] == "POST"){

        $query = "SELECT * from student";
        $result = mysqli_query($con,$query);
        $rows = array();
        //retrieve and print every record
        while($r = mysqli_fetch_assoc($result)){
            $rows[] = array('data' => $r);
        }

        echo json_encode($rows);
    }
?>