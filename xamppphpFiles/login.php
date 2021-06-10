<?php 

session_start();

	include("connection.php");

	if($_SERVER['REQUEST_METHOD'] == "POST"){ //When clicked on login

		$email = $_POST['email'];     //Get the values of input texts
		$password = $_POST['password'];

		$hash_pass = md5($password);       //Hash password with md5 since we added hashed version of password to the database.
		

			$query = "select email from user where email =? and password=? "; //Check whether account is in the database or not

			if ($stmt = $con->prepare($query)){      //In this part we are preparing statement as we did every sql statement in this assignment
				                                     //The reason why we are doing this is to block all sql injections

				$stmt->bind_param("ss", $email,$hash_pass);

				if($stmt->execute()){
					$stmt->store_result();
					$stmt->bind_result($email);
					$stmt->fetch();
					if ($stmt->num_rows == 1){         // If the account exists then rotate to welcome page

						$_SESSION['email'] = $email; // Take the email in session to write in welcome page
						echo "succesfull";
						
					}else{
						echo "wrong password or email";
					}
				}else{
					echo "Problem occured while executing sql statement";
				}
				$stmt->close();
			}else{
				echo "Problem occured while preparing sql statement";
			}


	}
?>

