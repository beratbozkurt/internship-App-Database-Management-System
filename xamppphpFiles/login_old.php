<?php 

	session_start();

	class obj {
		public $user_type = "";
		public $success = 0;
		public $user_id;
		public $desc;
	}
	
	include("connection.php");

	if($_SERVER['REQUEST_METHOD'] == "POST"){ //When clicked on login

		$email = $_POST['email'];     //Get the values of input texts
		$password = $_POST['password'];

		$hash_pass = md5($password);       //Hash password with md5 since we added hashed version of password to the database.

		$query = "SELECT email from user where email= ? and password= ?"; //Check whether account is in the database or not


		if ($stmt = $con->prepare($query)){      //In this part we are preparing statement as we did every sql statement in this assignment
													//The reason why we are doing this is to block all sql injections
			$stmt->bind_param("ss", $email, $hash_pass);

			$myObj = new obj();

			if($stmt-> execute()){
				$stmt-> store_result();
				$stmt-> bind_result($email);
				$stmt-> fetch();
				///
				if ($stmt->num_rows == 1){
					         // If the account exists then rotate to welcome page
					$_SESSION['email'] = $email; // Take the email in session to write in welcome page

					$query = "SELECT * from user where email= '$email' and password= '$hash_pass'";
					$result = mysqli_query($con, $query);
					$row = mysqli_fetch_assoc($result);
					$user_id= $row['user_id'];


					// check if the user is a student or company
					$query = "SELECT count(*) from company c INNER JOIN user ON user.user_id = c.company_id WHERE user.user_id = $user_id";
					$result = mysqli_query($con, $query);
					// $rows = array();
					// while($r = mysqli_fetch_assoc($result)) 
					// {
					// 	$rows[] = $r;
					// }
					$row_num = mysqli_num_rows($result);
					if($row_num >= 1)
					{
						$myObj-> success == 1;
						$_SESSION['user_type'] = 'company';
						$myObj-> user_type = "company";
						$myObj-> user_id = $user_id;
						$myObj-> desc = $row_num;
						//encode
						$myJSON = json_encode($myObj);
						echo $myJSON;
					}
					else if($row_num == 0)
					{
						$myObj-> success = 1;
						$_SESSION['user_type'] = 'student';
						$myObj-> user_type = 'student';
						$myObj-> user_id = $user_id;
						$myObj-> desc = $row_num;
						//encode
						$myJSON = json_encode($myObj);
						echo $myJSON;
					}
				}
				else
				{
					$myObj-> success = 0;
					$myObj-> desc = 'user do not belong student or company';
					$myJSON = json_encode($myObj);
					echo $myJSON;
				}
			}
			else{
				echo "Problem occured while executing sql statement";
			}
			$stmt->close();
		}else{
			echo "Problem occured while preparing sql statement";
		}


	}
?>

