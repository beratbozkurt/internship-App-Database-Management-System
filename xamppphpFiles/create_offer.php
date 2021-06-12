<?php 
session_start();

	include("connection.php");

    if($_SERVER['REQUEST_METHOD'] == "POST"){
        $company_id = $_POST['company_id'];
        $student_id = $_POST['student_id'];

        $query = " INSERT INTO offer VALUES ($company_id, $student_id,'Waiting')";
        $result = mysqli_query($con,$query);
        echo $result;
    }
    
?>