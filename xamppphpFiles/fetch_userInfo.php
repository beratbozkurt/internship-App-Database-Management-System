<?php 
session_start();

	include("connection.php");

    if($_SERVER['REQUEST_METHOD'] == "POST"){

        $user_type = $_POST['user_type'];
        $user_id = $_POST['user_id'];

        if($user_type == "student"){

        
        $query = "SELECT * from student where student_id = $user_id";
        $result = mysqli_query($con,$query);
        $row = mysqli_fetch_assoc($result);
        echo json_encode($row);

        }
        if($user_type == "company"){

           
            $query = "SELECT * from company where company_id = $user_id";
            $result = mysqli_query($con,$query);
            $row = mysqli_fetch_assoc($result);
            echo json_encode($row);
            
            }
    }
?>