<?php
require_once "config.php";
require_once "UserModel.php";

    if(isset($_POST['Email'])&&isset($_POST['Password'])&&isset($_POST['ID'])){
      $Email = $_POST["Email"];
      $ID = $_POST["ID"];
      $Password = $_POST["Password"];

      if ($Password == ""){
        die("Blank Password");
        return;
      };
      if ($ID == ""){
        die( "No User Given");
        return;
      };
      //keep track how many addtional variables
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

      "UPDATE User set UserName = ?, FirstName = ?, LastName = ?, DateOfBirth = ?, Password = ?, Email = ? WHERE ID = ?";
      $sql = "SELECT * FROM User WHERE Email = ? AND Password = ?";
      $stmt = $_SERVER['dbconnection']->prepare($sql);
      $stmt -> bind_param("ssssssi",$ID,$Password,$UserName,$FirstName,$LastName,$DateOfBirth,$Admin);
      $stmt->execute();
    $rows=$stmt->get_result()->fetch_all(MYSQLI_ASSOC);
      echo json_encode($rows);
    }else{
      die("Post was not met");

    }


?>
