<?php 
session_start();

	include("connection.php");

    if($_SERVER['REQUEST_METHOD'] == "POST"){

        $student_id = $_POST['student_id'];

        $query = 'SELECT c.company_name, offer.offer_status from offer inner join company c ON c.company_id = offer.company_id
                                 where offer.student_id = $student_id';

        $result = mysqli_query($con, $query);
        $rows = array();
        while($r = mysqli_fetch_assoc($result)) {
            $rows[] = $r;
        }

        $myJSON = json_encode($rows);

        echo $myJSON;
    }
?>