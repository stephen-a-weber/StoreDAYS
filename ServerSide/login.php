<?php
require_once "config.php";
require_once "UserModel.php";

    
    if(isset($_POST['Email'])&&isset($_POST['Password'])){
      $ID = $_POST['Email'];
      $Password = $_POST['Password'];
      if ($Password == ""){
        echo "Blank Password"; 
        return;         
      };
      if ($ID == ""){
        echo "No User Given"; 
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
