<?php
require_once "config.php";

$Method=$_SERVER['REQUEST_METHOD'];
switch ($Method){
case "POST":
if(!empty($_POST['ID'])){
    $ID = (int)$_POST['ID'];


    //initialize description in case one wasn't given
    $Street=" ";
    $City=" ";
    $State=0;
    $Zip=" ";
    //if post is set assign the description
    if(!empty($_POST['Street'])){
      $Street=$_POST['Street'];
    }
    if(!empty($_POST['City'])){
      $City =$_POST['City'];
    }
    if(!empty($_POST['State'])){
      $State =$_POST['State'];
    }
    if(!empty($_POST['Zip'])){
        $Zip =$_POST['Zip'];
      }
      if (!empty($_POST['User_ID'])){
        $User_ID = (int)$_POST['User_ID'];
      }

    $sql = "UPDATE Address set Street = ?, City = ?, State = ?, Zip = ? WHERE ID = ?    ";
    $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
    $stmt -> bind_param("ssssi",$Street,$City,$State,$Zip,$ID)or die("Couldn't bind".htmlspecialchars($stmt->error));
    $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));
} else if (!empty($_POST['User_ID'])){
    $User_ID = (int)$_POST['User_ID'];
    //initialize description in case one wasn't given
    $Street=" ";
    $City=" ";
    $State=" ";
    $Zip=" ";
    //if post is set assign the description
    if(!empty($_POST['Street'])){
      $Street=$_POST['Street'];
    }
    if(!empty($_POST['City'])){
      $City =$_POST['City'];
    }
    if(!empty($_POST['State'])){
      $State =$_POST['State'];
    }
    if(!empty($_POST['Zip'])){
        $Zip =$_POST['Zip'];
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
  if(!empty($_GET['ID'])){
    $sql="SELECT * FROM Address WHERE ID = ?    ";
    $var=(int)$_GET['ID'];
  }

  //if we are looking for a set
  if(!empty($_GET['User_ID'])){
    $sql="SELECT * FROM Address Where User_ID = ?";
    $var =(int)$_GET['User_ID'];
  }

  $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
  $stmt -> bind_param("i",$var) or die("Couldn't bind".htmlspecialchars($stmt->error));
  $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));;
  $rows=$stmt->get_result()->fetch_all(MYSQLI_ASSOC);
  echo json_encode($rows);

    break;
    case "DELETE":
      //always using a string for query
      $sql = "";
      //always using an integer
      $var=0;
    //if we are looking for one
      if(!empty($_GET['ID'])){
        $sql="DELETE FROM Address Where ID = ?";
        $var=(int)$_GET['ID'];
      }

      //if we are looking for a set
     else if(!empty($_GET['User_ID'])){
        $sql="DELETE FROM Address WHERE User_ID = ?";
        $var =(int)$_GET['User_ID'];
      } else
      die("Get wasn't define");

      $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
      $stmt -> bind_param("i",$var) or die("Couldn't bind".htmlspecialchars($stmt->error));
      $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));;
      $rows=$stmt->get_result()->fetch_all(MYSQLI_ASSOC);
      echo json_encode($rows);

        break;

default:
die("Methode wasn't define");
break;

}
?>
