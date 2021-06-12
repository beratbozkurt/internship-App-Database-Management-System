<?php 
session_start();

	include("connection.php");

    if($_SERVER['REQUEST_METHOD'] == "POST"){

        $user_type = $_POST['user_type'];
        $user_id = $_POST['user_id'];

        if($user_type=="company"){
            $query = "SELECT * from offer natural join student WHERE company_id = $user_id";
            $result = mysqli_query($con,$query);
            $rows = array();
            while($r = mysqli_fetch_assoc($result)){
                $rows[] = array('data' => $r);
            }
            echo json_encode($rows);
        }
        else{
            $query = "SELECT * from offer natural join student WHERE student_id = $user_id and offer_status = 'waiting'";
            $result = mysqli_query($con,$query);
            $rows = array();
            while($r = mysqli_fetch_assoc($result)){
                $rows[] = array('data' => $r);
            }
            echo json_encode($rows);
        }

    }
?>