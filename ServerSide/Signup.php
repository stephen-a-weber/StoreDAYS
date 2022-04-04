<?php
require_once "config.php";
require_once "UserModel.php";

    if(isset($_POST['Email'])&&isset($_POST['Password'])){
      $ID = $_POST["Email"];
      $Password = $_POST["Password"];
if (checkDuplicateuser($_POST["Email"]))
die("There is a duplicate user");
      if ($Password == ""){
        die("Blank Password");
        return;
      };
      if ($ID == ""){
        die( "No User Given");
        return;
      };
      //optional handling
      $UserName="";
      $FirstName="";
      $LastName="";
      $DateOfBirth="";
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

      $stmt = $_SERVER['dbconnection']->prepare($sql);
      $stmt -> bind_param("ssssssi",$ID,$Password,$UserName,$FirstName,$LastName,$DateOfBirth,$Admin);
      $stmt->execute();
    $rows=$stmt->get_result()->fetch_all(MYSQLI_ASSOC);
      echo json_encode($rows);
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
