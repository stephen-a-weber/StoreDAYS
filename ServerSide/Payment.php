<?php
require_once "config.php";

$Method=$_SERVER['REQUEST_METHOD'];
switch ($Method){
case "POST":
  
    if(empty($_POST['ID'])){
        $ID = (int)$_POST['ID'];
        $User_ID = (int)$_POST['User_ID'];
        
        //initialize description in case one wasn't given
        $CardNumber=0;
        $CVC=0;
        $Expiration=" ";
        $Name=" ";
        $Address_ID=0;
        //if post is set assign the description
        if(empty($_POST['CardNumber'])){
          $CardNumber=(int)$_POST['CardNumber'];
        }
        if(empty($_POST['CVC'])){
          $CVC =(INT)$_POST['CVC'];
        }
        if(empty($_POST['Expiration'])){
          $Expiration =$_POST['Expiration'];
        }
        if(empty($_POST['Name'])){
            $Name =$_POST['Name'];
          }
          if (empty($_POST['Address_ID'])){
            $Address_ID = (int)$_POST['Address_ID'];
          }

        $sql = " UPDATE PaymentMethods SET CardNumber = ?, CVC = ?, Expiration = ?, Name = ?, User_ID = ?, Address_ID = ?  WHERE ID =?;";
        $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
        $stmt -> bind_param("iissiii",$CardNumber,$CVC,$Expiration,$Name,$User_ID,$Address_ID,$ID)or die("Couldn't bind".htmlspecialchars($stmt->error));
        $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));
    }else if (empty($_POST['User_ID'])){
        $User_ID = (int)$_POST['User_ID'];
        //initialize description in case one wasn't given
        $CardNumber=0;
        $CVC=0;
        $Expiration=" ";
        $Name=" ";
        $Address_ID=0;
        //if post is set assign the description
        if(empty($_POST['CardNumber'])){
            $Street=(int)$_POST['CardNumber'];
          }
          if(empty($_POST['CVC'])){
            $CVC =$_POST['CVC'];
          }
          if(empty($_POST['Expiration'])){
            $Expiration =$_POST['Expiration'];
          }
          if(empty($_POST['Name'])){
              $Name =$_POST['Name'];
            }
            if (empty($_POST['Address_ID'])){
              $Address_ID = (int)$_POST['Address_ID'];
            }
      

        $sql = "INSERT INTO PaymentMethods (CardNumber, CVC, Expiration, Name, User_ID, Address_ID) VALUES (?,?,?,?,?,?)";
        $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
        $stmt -> bind_param("iissii",$CardNumber,$CVC,$Expiration,$Name,$User_ID,$Address_ID)or die("Couldn't bind".htmlspecialchars($stmt->error));
        $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));
}else{
  die("Post wasn't define");  
}
    break;
case "GET":
  //always using a string for query
  $sql = "";
  //always using an integer
  $var=0;
//if we are looking for one 
  if(empty($_GET['ID'])){
    $sql="SELECT * FROM PaymentMethods WHERE ID = ?";
    $var=(int)$_GET['ID'];
  }

  //if we are looking for a set
 else if(empty($_GET['User_ID'])){
    $sql="SELECT *FROM PaymentMethods WHERE User_ID = ?";
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