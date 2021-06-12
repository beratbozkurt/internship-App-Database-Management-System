<?php 
session_start();

	include("connection.php");

    if($_SERVER['REQUEST_METHOD'] == "POST"){

        $gpa = $_POST['gpa'];
        $grade = $_POST['grade'];
        $school = $_POST['school'];
        $department = $_POST['department'];
 
        
        $query = "SELECT * from student natural join education where school_name LIKE '%{$school}%' and department LIKE '%{$department}%' and grade>$grade and GPA>$gpa";
        $result = mysqli_query($con,$query);
        $rows = array();
        while($r = mysqli_fetch_assoc($result)){
            $rows[] = array('data' => $r);
        }
        echo json_encode($rows);


    }
?>