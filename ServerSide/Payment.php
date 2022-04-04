<?php
require_once "config.php";

$Method=$_SERVER['REQUEST_METHOD'];
switch ($Method){
case "POST":
    if(isset($_POST['ID'])){
        $ID = (int)$_POST['ID'];
        $User_ID = (int)$_POST['User_ID'];
        
        //initialize description in case one wasn't given
        $CardNumber=0;
        $CVC=0;
        $Expiration=" ";
        $Name=" ";
        $Address_ID=0;
        //if post is set assign the description
        if(isset($_GET['CardNumber'])){
          $Street=(int)$_GET['CardNumber'];
        }
        if(isset($_GET['CVC'])){
          $CVC =$_GET['CVC'];
        }
        if(isset($_GET['Expiration'])){
          $Expiration =$_GET['Expiration'];
        }
        if(isset($_GET['Name'])){
            $Name =$_GET['Name'];
          }
          if (isset($_POST['Address_ID'])){
            $Address_ID = (int)$_POST['Address_ID'];
          }
    
        $sql = "UPDATE PayMentMethods set CardNumber = ?, CVC = ?, Expiration = ?, Name = ?, User_ID = ?, Address_ID = ?  WHERE ID = ?        ";
        $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
        $stmt -> bind_param("iissiii",$CardNumber,$CVC,$Expiration,$Name,$User_ID,$Address_ID,$ID)or die("Couldn't bind".htmlspecialchars($stmt->error));
        $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));
    }else if (isset($_POST['User_ID'])){
        $User_ID = (int)$_POST['User_ID'];
        //initialize description in case one wasn't given
        $CardNumber=0;
        $CVC=0;
        $Expiration=" ";
        $Name=" ";
        $Address_ID=0;
        //if post is set assign the description
        if(isset($_GET['CardNumber'])){
            $Street=(int)$_GET['CardNumber'];
          }
          if(isset($_GET['CVC'])){
            $CVC =$_GET['CVC'];
          }
          if(isset($_GET['Expiration'])){
            $Expiration =$_GET['Expiration'];
          }
          if(isset($_GET['Name'])){
              $Name =$_GET['Name'];
            }
            if (isset($_POST['Address_ID'])){
              $Address_ID = (int)$_POST['Address_ID'];
            }
      

        $sql = "INSERT INTO PayMentMethods (CardNumber, CVC, Expiration, Name, User_ID, Address_ID) VALUES (?,?,?,?,?,?)";
        $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
        $stmt -> bind_param("iissii",$CardNumber,$CVC,$Expiration,$Name,$User_ID,$Address_ID)or die("Couldn't bind".htmlspecialchars($stmt->error));
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
    $sql="SELECT * FROM PayMentMethods WHERE ID = ?";
    $var=(int)$_GET['ID'];
  }

  //if we are looking for a set
  if(isset($_GET['User_ID'])){
    $sql="DELETE FROM PayMentMethods WHERE User_ID = ?";
    $var =(int)$_GET['User_ID'];
  }
  $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
  $stmt -> bind_param("i",$var) or die("Couldn't bind".htmlspecialchars($stmt->error));
  $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));;
  $rows=$stmt->get_result()->fetch_all(MYSQLI_ASSOC);
  echo json_encode($rows);

    break;


}
echo"Current:".$sql." MEthod at".$Method;

?>