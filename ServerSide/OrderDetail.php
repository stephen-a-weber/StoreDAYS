<?php
require_once "config.php";

$Method=$_SERVER['REQUEST_METHOD'];
switch ($Method){
case "POST":
if(!empty($_POST['ID'])){
    $ID = (int)$_POST['ID'];


    //initialize description in case one wasn't given
    $Items_ID=" ";
    $Orders_ID=" ";
    $Quantity=0;
    //if post is set assign the description
    if(!empty($_POST['Items_ID'])){
      $Items_ID=$_POST['Items_ID'];
    }
    if(!empty($_POST['Orders_ID'])){
      $Orders_ID =$_POST['Orders_ID'];
    }
    if(!empty($_POST['Quantity'])){
      $Quantity =$_POST['Quantity'];
    }
    $sql = "UPDATE Orders_Details set Items_ID = ?, Orders_ID = ?, Quantity = ? WHERE ID = ?    ";
    $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
    $stmt -> bind_param("ssssi",$Items_ID,$Orders_ID,$Quantity,$Zip,$ID)or die("Couldn't bind".htmlspecialchars($stmt->error));
    $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));
} else if (!empty($_POST['Items_ID'])) {
    //initialize description in case one wasn't given
    $Items_ID=" ";
    $Orders_ID=" ";
    $Quantity=" ";
    //if post is set assign the description
    if(!empty($_POST['Items_ID'])){
      $Items_ID=$_POST['Items_ID'];
    }
    if(!empty($_POST['Orders_ID'])){
      $Orders_ID =$_POST['Orders_ID'];
    }
    if(!empty($_POST['Quantity'])){
      $Quantity =$_POST['Quantity'];
    }
   

    $sql = "INSERT INTO Orders_Details (Items_ID, Orders_ID, Items_ID, Quantity) VALUES (?,?,?,?)";
    $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
    $stmt -> bind_param("ssiss",$Items_ID,$Orders_ID,$Items_ID,$Quantity)or die("Couldn't bind".htmlspecialchars($stmt->error));
    $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));
}else{
  die("Post Error: Niethier User or ID was define");
}
    break;
case "GET":
  //always using a string for query
  $sql = "";
  //always using an integer
  $var=0;
//if we are looking for one
  if(!empty($_GET['ID'])){
    $sql="SELECT * FROM Orders_Details Where ID = ?    ";
    $var=(int)$_GET['ID'];
  }

  //if we are looking for a set
  else if(!empty($_GET['Items_ID'])){
    $sql="SELECT * FROM Orders_Details Where Items_ID = ?";
    $var =(int)$_GET['Items_ID'];
  }else if (!empty($_POST['Orders_ID'])){
    $sql="SELECT * FROM Orders_Details Where Orders_ID = ?";
    $var =(int)$_GET['Items_ID'];
  }else{
    die("Get Error: Niethier User or ID was define");
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
        $sql="DELETE FROM Orders_Details Where ID = ?";
        $var=(int)$_GET['ID'];
      }

      //if we are looking for a set
      else if(!empty($_GET['Items_ID'])){
        $sql="DELETE FROM Orders_Details Where Items_ID = ?";
        $var =(int)$_GET['Items_ID'];}
     else if(!empty($_GET['Orders_ID'])){
        $sql="DELETE FROM Orders_Details WHERE Orders_ID = ?";
        $var =(int)$_GET['Orders_ID'];
      } else
      die("Delete wasn't define");

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
