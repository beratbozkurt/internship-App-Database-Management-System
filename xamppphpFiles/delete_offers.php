<?php 
session_start();

	include("connection.php");

    if($_SERVER['REQUEST_METHOD'] == "POST"){

        $company_id = $_POST['company_id'];
        $student_id = $_POST['student_id'];

        $query = " DELETE FROM offer WHERE company_id=$company_id and student_id=$student_id";
        $result = mysqli_query($con,$query);
        echo $result;
        echo "selam";
    }
    
?>