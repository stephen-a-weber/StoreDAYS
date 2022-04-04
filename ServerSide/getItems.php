<?php
require_once "config.php";
require_once "ReviewModel.php";

    $sql = "";

    if(isset($_GET['ID'])){
      $ID = $_GET['ID'];
      $sql = "SELECT * FROM Items WHERE ID = ?";
      $stmt = $_SERVER['dbconnection']->prepare($sql);
      $stmt -> bind_param("i",$ID);
      $stmt->execute();
    $rows=$stmt->get_result()->fetch_all(MYSQLI_ASSOC);
      echo json_encode($rows);
    }
    else if(isset($_GET['Catagory_ID'])){
      $ID = $_GET['Catagory_ID'];
      $sql = "SELECT * FROM Items WHERE Catagory_ID = ?";
      $stmt = $_SERVER['dbconnection']->prepare($sql);
      $stmt -> bind_param("i",$ID);
      $stmt->execute();
    $rows=$stmt->get_result()->fetch_all(MYSQLI_ASSOC);
      echo json_encode($rows);
    }else{
$sql = "SELECT * FROM Items Availability=1";
$result = $_SERVER['dbconnection']->query($sql, MYSQLI_USE_RESULT);
$rows = $result->fetch_all(MYSQLI_ASSOC);
echo json_encode($rows);
    }



?>
