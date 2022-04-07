<?php
require_once "config.php";

    $sql = "";

    if(!empty($_GET['ID'])){
      $ID = $_GET['ID'];
      $sql = "SELECT * FROM Items WHERE ID = ?";
      $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));;
      $stmt -> bind_param("i",$ID)or die("Couldn't bind".htmlspecialchars($stmt->error));;
      $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));;
    $rows=$stmt->get_result()->fetch_all(MYSQLI_ASSOC);
      echo json_encode($rows);
    }
    else if(!empty($_GET['Catagory_ID'])){
      $ID = $_GET['Catagory_ID'];
      $sql = "SELECT * FROM Items WHERE Catagory_ID = ?";
      $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
      $stmt -> bind_param("i",$ID) or die("Couldn't bind".htmlspecialchars($stmt->error));
      $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));
    $rows=$stmt->get_result()->fetch_all(MYSQLI_ASSOC);
      echo json_encode($rows);
    }else{
$sql = "SELECT * FROM Items WHERE Availability=1";
$result = $_SERVER['dbconnection']->query($sql, MYSQLI_USE_RESULT) or die("Couldn't excute".htmlspecialchars($stmt->error));;
$rows = $result->fetch_all(MYSQLI_ASSOC);
echo json_encode($rows);
    }



?>
