<?php
require_once "config.php";
require_once "UserModel.php";

    if(isset($_POST['Email'])&&isset($_POST['Password'])){
      $Email = $_POST["Email"];
      $Password = $_POST["Password"];
if (checkDuplicateuser($_POST["Email"]))
die("There is a duplicate user");
      if ($Password == ""){
        die("Blank Password");
        return;
      };
      if ($Email == ""){
        die( "No User Given");
        return;
      };
      //optional handling
      $UserName="User";
      $FirstName="First";
      $LastName="Last";
      $DateOfBirth="2022-04-03";
      $Admin=0;
      if(isset($_POST['UserName'])){
        $UserName=$_POST['UserName'];}
    if(isset($_POST['FirstName'])){
        $FirstName=$_POST['FirstName'];}
    if(isset($_POST['LastName'])){
        $LastName=$_POST['LastName'];}
    if(isset($_POST['DateOfBirth'])){
        $DateOfBirth=$_POST['DateOfBirth'];}
    if(isset($_POST['Admin'])){
        $Admin=(int)$_POST['Admin'];}
    $sql="INSERT INTO User (UserName, FirstName, LastName, DateOfBirth, Password, Email, Admin) VALUES (?,?,?,?,?,?,?)";

      $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
      $stmt -> bind_param("ssssssi",$UserName,$FirstName,$LastName,$DateOfBirth,$Password,$Email,$Admin) or die("Couldn't bind".htmlspecialchars($stmt->error));
      $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));
      echo "success";
    }else{
die("Post was not met");
    }

    function checkDuplicateuser($email)
    {
    
        $sql = "SELECT COUNT(*) FROM User WHERE Email=?";
        $stmt = $_SERVER['dbconnection']->prepare($sql);
    
        $stmt->bind_param("s",$email);
        $stmt->execute();
        if ($stmt->get_result()->fetch_row()[0] > 0) {
            return true;
        } // If we found an entry we know there's a duplicate

        return false;
    }
?>
