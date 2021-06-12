<?php 
session_start();

	include("connection.php");


	if($_SERVER['REQUEST_METHOD'] == "POST"){  // when clicked on signup

		
	      							    	// Get the values of input texts
		$password = $_POST['password'];
		$email = $_POST['email'];
		$user_type = $_POST['user_type'];
		$name = $_POST['name'];
		if(isset($_POST['contact_mail'])){
			$contact_mail = $_POST['contact_mail'];
		}
		if(isset($_POST['company_desc'])){
			$company_desc = $_POST['company_desc'];
		}
		$surname = $_POST['surname'];
		$age = $_POST['age'];
		$offer_acceptance = $_POST['offer_acceptance'];
		$gender = $_POST['gender'];

		$count = 0 ; 
		
		class signUpObj{
			public $user_type = "";
			public $success = 0;
			public $desc = "";
			public $user_id;
		}

		$myObj = new signUpObj();

		//Necessary checkings of input texts whether they are proper or not.										   
		if(strpos($email,"@") == false){
			// echo "invalid mail\n";
			$myObj-> success = 0;
			$myObj-> desc = 'invalid mail';
			//encode
			$myJSON = json_encode($myObj);
			echo $myJSON;
			$count++;
		}

		if(strlen($password)<8){
			// echo "invalid password";
			$myObj-> success = 0;
			$myObj-> desc = 'invalid password';
			//encode
			$myJSON = json_encode($myObj);
			echo $myJSON;
			$count++;
		}

		$query = "SELECT `email` FROM user WHERE email=?";

		if ($stmt = $con->prepare($query)){             //Check the email exists or not

				$stmt->bind_param("s", $email);

				if($stmt->execute()){

					$stmt->store_result();
					$stmt->bind_result($email_check);
					$stmt->fetch();
					if ($stmt->num_rows >= 1){
						// echo "That Email already exists";
						$myObj-> success = 0;
						$myObj-> desc = 'Email already exist.';
						//encode
						$myJSON = json_encode($myObj);
						echo $myJSON;
						$count++;
					}
				}
			}
	
	
		if($count==0) // if every control is okey then signup the person and add to database. In order to make more secure the system, numerous controls can be added.
		{
			$query = "INSERT INTO user (email,password) VALUES ( ? , ?)";
			if ($stmt = $con->prepare($query))
			{

				$hash_pass = md5($password); // hashing password with md5 to protect 
				$stmt->bind_param("ss",$email,$hash_pass);
				
				if($stmt->execute()){
					$myObj-> success = 1;
				}

			}
				
				$query = "SELECT * from user where email ='$email' and password='$hash_pass'";                    
				// Get all users from database
				$result = mysqli_query($con,$query);
				$row = mysqli_fetch_assoc($result);
				$id_copy= $row['user_id'];

				if($user_type=="student"){

					$query = "INSERT INTO student (student_id,name,age,gender,surname,offer_acceptance) VALUES (? , ? , ? , ?, ? ,?)";
					if ($stmt = $con->prepare($query)){
		
						$stmt->bind_param("isisss", $id_copy, $name, $age, $gender,$surname,$offer_acceptance);
						
						 if($stmt->execute()){
							$myObj-> user_type = $user_type;
							$myObj-> user_id = $id_copy;
							$myJSON = json_encode($myObj);
							echo $myJSON;
						}
		
					}
				}
				if($user_type=="company"){

					$query = "INSERT INTO company (company_id,company_name,contact_mail,description) VALUES (? , ? , ? , ?)";
					if ($stmt = $con->prepare($query)){
		
						$stmt->bind_param("isss",$id_copy, $name, $contact_mail, $company_desc);
						
						 if($stmt->execute()){
							$myObj-> user_type = $user_type;
							$myJSON = json_encode($myObj);
							echo $myJSON;
						}
		
					}
				}
				
			
		}
	}
	
?>
