<?php 
session_start();

	include("connection.php");

    if($_SERVER['REQUEST_METHOD'] == "POST"){

        $student_id = $_POST['student_id'];

      
        $query = "SELECT * from education natural join student WHERE student_id = $student_id limit 1";
        $result = mysqli_query($con,$query);
        $rows = array();
        while($r = mysqli_fetch_assoc($result)){
            $rows[] = array('data' => $r);
        }
        echo json_encode($rows);
    


    }
?>