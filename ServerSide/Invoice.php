<?php
require_once "config.php";

$Method=$_SERVER['REQUEST_METHOD'];
switch ($Method){
case "POST":
    if(!empty($_POST['ID'])){
        $ID = (int)$_POST['ID'];
        $User_ID = (int)$_POST['User_ID'];
        echo " in ID";

        //initialize description in case one wasn't given
        $Sum=0;
        $Shipping_ID=0;
        $PaymentMethods_ID=0;
        //if post is set assign the description
        if(!empty($_POST['Sum'])){
          $Sum=(int)$_POST['Sum'];
        }
        if(!empty($_POST['Shipping_ID'])){
          $Shipping_ID =(INT)$_POST['Shipping_ID'];
        }
          if (!empty($_POST['PaymentMethods_ID'])){
            $PaymentMethods_ID = (int)$_POST['PaymentMethods_ID'];
          }

        $sql = "UPDATE Invoice set Cost = ?, User_ID = ?, Shipping_ID = ?, PaymentMethods_ID = ? WHERE ID = ?";
        $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
        $stmt -> bind_param("iiiii",$Sum,$User_ID,$Shipping_ID,$PaymentMethods_ID,$ID)or die("Couldn't bind".htmlspecialchars($stmt->error));
        $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));
    }else if (!empty($_POST['User_ID'])){
        $User_ID = (int)$_POST['User_ID'];
        //initialize description in case one wasn't given
        $Sum=0;
        $Shipping_ID=0;
        $Expiration=" ";
        $Name=" ";
        $PaymentMethods_ID=0;
        //if post is set assign the description
        if(!empty($_POST['Sum'])){
            $Sum=(int)$_POST['Sum'];
          }
          if(!empty($_POST['Shipping_ID'])){
            $Shipping_ID =$_POST['Shipping_ID'];
          }
          if(!empty($_POST['Expiration'])){
            $Expiration =$_POST['Expiration'];
          }
          if(!empty($_POST['Name'])){
              $Name =$_POST['Name'];
            }
            if (!empty($_POST['PaymentMethods_ID'])){
              $PaymentMethods_ID = (int)$_POST['PaymentMethods_ID'];
            }


        $sql = "INSERT INTO Invoice (Cost, User_ID, Shipping_ID, PaymentMethods_ID) VALUES (?,?,?,?)";
        $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
        $stmt -> bind_param("iiii",$Sum,$User_ID,$Shipping_ID,$PaymentMethods_ID)or die("Couldn't bind".htmlspecialchars($stmt->error));
        $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));

$sql="SELECT LAST_INSERT_ID() as LAST_INSERT_ID";
$stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
$stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));
$rows=$stmt->get_result()->fetch_all(MYSQLI_ASSOC);
echo json_encode($rows);
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
    $sql="SELECT * FROM Invoice WHERE ID = ?";
    $var=(int)$_GET['ID'];
  }

  //if we are looking for a set
 else if(!empty($_GET['User_ID'])){
    $sql="SELECT *FROM Invoice WHERE User_ID = ?";
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
        $sql="DELETE FROM Invoice Where ID = ?";
        $var=(int)$_GET['ID'];
      }

      //if we are looking for a set
     else if(!empty($_GET['User_ID'])){
        $sql="DELETE FROM Invoice WHERE User_ID = ?";
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
