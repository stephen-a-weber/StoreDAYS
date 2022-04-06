<?php
require_once "config.php";

$Method=$_SERVER['REQUEST_METHOD'];
switch ($Method){
case "POST":
    if(!empty($_POST['ID'])){
        $ID = (int)$_POST['ID'];
        $User_ID = (int)$_POST['User_ID'];

        //initialize description in case one wasn't given
        $ShippingType=" ";
        $Cost=0.0;
        $ETA=" ";
        $Status=" ";
        $Address_ID=0;
        //if post is set assign the description
        if(!empty($_POST['ShippingType'])){
          $ShippingType=(int)$_POST['ShippingType'];
        }
        if(!empty($_POST['Cost'])){
          $Cost =(INT)$_POST['Cost'];
        }
        if(!empty($_POST['ETA'])){
          $ETA =$_POST['ETA'];
        }
        if(!empty($_POST['Status'])){
            $Status =$_POST['Status'];
          }
          if (!empty($_POST['Address_ID'])){
            $Address_ID = (int)$_POST['Address_ID'];
          }

        $sql = "UPDATE Shipping set ShippingType = ?, Cost = ?, ETA = ?, User_ID = ?, Status = ?, Address_ID = ? WHERE ID = ?";
        $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
        $stmt -> bind_param("sdsisii",$ShippingType,$Cost,$ETA,$User_ID,$Status,$Address_ID,$ID)or die("Couldn't bind".htmlspecialchars($stmt->error));
        $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));
    }else if (!empty($_POST['User_ID'])){
        $User_ID = (int)$_POST['User_ID'];
        //initialize description in case one wasn't given
        $ShippingType=0;
        $Cost=0;
        $ETA=" ";
        $Status=" ";
        $Address_ID=0;
        //if post is set assign the description
        if(!empty($_POST['ShippingType'])){
            $ShippingType=(int)$_POST['ShippingType'];
          }
          if(!empty($_POST['Cost'])){
            $Cost =$_POST['Cost'];
          }
          if(!empty($_POST['ETA'])){
            $ETA =$_POST['ETA'];
          }
          if(!empty($_POST['Status'])){
              $Status =$_POST['Status'];
            }
            if (!empty($_POST['Address_ID'])){
              $Address_ID = (int)$_POST['Address_ID'];
            }


        $sql = "INSERT INTO Shipping (ShippingType, Cost, ETA, User_ID, Status, Address_ID) VALUES (?,?,?,?,?,?)        ";
        $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
        $stmt -> bind_param("sdsisi",$ShippingType,$Cost,$ETA,$Status,$User_ID,$Address_ID)or die("Couldn't bind".htmlspecialchars($stmt->error));
        $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));
}else{  die("Post wasn't define");
}
    break;
case "GET":
  //always using a string for query
  $sql = "";
  //always using an integer
  $var=0;
//if we are looking for one
  if(!empty($_GET['ID'])){
    $sql="SELECT * FROM Shipping WHERE ID = ?";
    $var=(int)$_GET['ID'];
  }

  //if we are looking for a set
 else if(!empty($_GET['User_ID'])){
    $sql="SELECT *FROM Shipping WHERE User_ID = ?";
    $var =(int)$_GET['User_ID'];
  } else
  die("Get wasn't define");

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
        $sql="DELETE FROM Shipping Where ID = ?        ";
        $var=(int)$_GET['ID'];
      }

      //if we are looking for a set
     else if(!empty($_GET['User_ID'])){
        $sql="DELETE FROM Shipping WHERE User_ID = ?";
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
