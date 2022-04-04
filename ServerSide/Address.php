<?php
require_once "config.php";

$Method=$_SERVER['REQUEST_METHOD'];
switch ($Method){
case "POST":
if(isset($_POST['ID'])){
    $ID = (int)$_POST['ID'];

    
    //initialize description in case one wasn't given
    $User_ID = 0;
    $Street=" ";
    $City=" ";
    $State=0;
    $Zip=" ";
    //if post is set assign the description
    if(isset($_GET['Street'])){
      $Street=$_GET['Street'];
    }
    if(isset($_GET['City'])){
      $City =$_GET['City'];
    }
    if(isset($_GET['State'])){
      $State =$_GET['State'];
    }
    if(isset($_GET['Zip'])){
        $Zip =$_GET['Zip'];
      }
      if (isset($_POST['User_ID'])){
        $User_ID = (int)$_POST['User_ID'];
      }

    $sql = "UPDATE Address set Street = ?, City = ?, User_ID = ?, State = ?, Zip = ? WHERE ID = ?    ";
    $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
    $stmt -> bind_param("ssissi",$Street,$City,$User_ID,$State,$Zip,$ID)or die("Couldn't bind".htmlspecialchars($stmt->error));
    $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));
} else if (isset($_POST['User_ID'])){
    $User_ID = (int)$_POST['User_ID'];
    //initialize description in case one wasn't given
    $Street=" ";
    $City=" ";
    $State=" ";
    $Zip=" ";
    //if post is set assign the description
    if(isset($_GET['Street'])){
      $Street=$_GET['Street'];
    }
    if(isset($_GET['City'])){
      $City =$_GET['City'];
    }
    if(isset($_GET['State'])){
      $State =$_GET['State'];
    }
    if(isset($_GET['Zip'])){
        $Zip =$_GET['Zip'];
      }


    $sql = "INSERT INTO Address (Street, City, User_ID, State, Zip) VALUES (?,?,?,?,?)";
    $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
    $stmt -> bind_param("ssiss",$Street,$City,$User_ID,$State,$Zip)or die("Couldn't bind".htmlspecialchars($stmt->error));
    $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));
}
    break;
case "GET":
  //always using a string for query
  $sql = "";
  //always using an integer
  $var=0;
//if we are looking for one 
  if(isset($_GET['ID'])){
    $sql="SELECT * FROM Address WHERE ID = ?    ";
    $var=(int)$_GET['ID'];
  }

  //if we are looking for a set
  if(isset($_GET['User_ID'])){
    $sql="DELETE FROM Address Where User_ID = ?";
    $var =(int)$_GET['User_ID'];
  }
  
  $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
  $stmt -> bind_param("i",$var) or die("Couldn't bind".htmlspecialchars($stmt->error));
  $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));;
  $rows=$stmt->get_result()->fetch_all(MYSQLI_ASSOC);
  echo json_encode($rows);

    break;


}
?>