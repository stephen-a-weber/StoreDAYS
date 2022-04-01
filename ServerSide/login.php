<?php
require_once "config.php";
require_once "UserModel.php";

    
    if(isset($_GET['Email'])&&isset($_GET['Password'])){
      $ID = $_GET['Email'];
      $Password = $_GET['Password'];
      if ($Password == ""){
        echo "Blank Password"; 
        return;         
      };
      $sql = "SELECT * FROM User WHERE Email = ? AND Password = ?";
      $stmt = $_SERVER['dbconnection']->prepare($sql);
      $stmt -> bind_param("ss",$ID,$Password);
      $stmt->execute();
    $rows=$stmt->get_result()->fetch_all(MYSQLI_ASSOC);
      echo json_encode($rows);
    }else{
echo "Incorrect Crodentials";
    }



?>
