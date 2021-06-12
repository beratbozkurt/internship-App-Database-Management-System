<?php 
session_start();

	include("connection.php");

    if($_SERVER['REQUEST_METHOD'] == "POST"){

        $student_id = $_POST['student_id'];
        $school = $_POST['school'];
        $gpa = $_POST['gpa'];
        $department = $_POST['department'];
        $grade = $_POST['grade'];
        
        $query = "INSERT INTO education (student_id, school_name, grade, gpa, department) 
                    VALUES ($student_id, '$school', $grade, $gpa, '$department')";
        $result = mysqli_query($con,$query);
        echo 'RESULTTT== ';
        echo "$result, $student_id, $school, $grade, $gpa, $department";
    }
    
?>