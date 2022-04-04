<?php
require_once "config.php";

$Method=$_SERVER['REQUEST_METHOD'];
switch ($Method){
case "POST":
  if(isset($_POST['ID'])){
    $sql="UPDATE Review set (Body = ?, User_ID = ?, Rate = ?, Items_ID = ?, Catagory_ID  = ? WHERE ID = ?";
    $ID=$_POST['ID'];
    //set parameters
    $Description=" ";
    $Invoice_ID =0;
    $Cost = 0;
    //assign parameters
    if(isset($_POST['Invoice_ID'])){
      $Invoice_ID = (int)$_POST['Invoice_ID'];
    }
    if(isset($_POST['Cost'])){
     $Cost = (int)$_POST['Cost'];}
  
    if(isset($_POST['Description'])){
      $Description=$_POST['Description'];}
  
    $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
    $stmt -> bind_param("siiii",$Body,$User_ID,$Rate,$Items_ID,$Catagory_ID,$ID)or die("Couldn't bind".htmlspecialchars($stmt->error));
    $stmt->execute();
  }
  else if (isset($_POST['Rate'])&&isset($_POST['User_ID'])){
        $User_ID = (int)$_POST['User_ID'];
        $Rate = (int)$_POST['Rate'];
        //initialize description in case one wasn't given
        $Body=" ";
        $Catagory_ID=0;
        $Items_ID =0;
        //if post is set assign the description
        if(isset($_GET['Body'])){
          $Body=$_GET['Body'];
        }
        $Items_ID=0;
        if(isset($_GET['Items_ID'])){
          $Items_ID =(int)$_GET['Items_ID'];
        }
        //if we are looking for a set of order for an invoice
        if(isset($_GET['Catagory_ID'])){
          $Catagory_ID =(int)$_GET['Catagory_ID'];
        }

        $sql = "INSERT INTO Review (Body, User_ID, Rate, Items_ID, Catagory_ID) VALUES (?,?,?,?,?)";
        $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
        $stmt -> bind_param("siiii",$Body,$User_ID,$Rate,$Items_ID,$Catagory_ID)or die("Couldn't bind".htmlspecialchars($stmt->error));
        $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));
}
    break;
case "GET":
  //always using a string for query
  $sql = "";
  //always using an integer
  $var=0;
//if we are looking for one order
  if(isset($_GET['ID'])){
    $sql="SELECT * FROM Orders WHERE ID = ?";
    $var=(int)$_GET['ID'];
  }else
  if(isset($_GET['Items_ID'])){
    $sql="SELECT * FROM Review WHERE Items_ID = ?    ";
    $var =(int)$_GET['Items_ID'];
  }else
  //if we are looking for a set of order for an invoice
  if(isset($_GET['Catagory_ID'])){
    $sql="SELECT * FROM Review WHERE Catagory_ID = ?    ";
    $var =(int)$_GET['Catagory_ID'];
  }else
  if(isset($_GET['User_ID'])){
    $sql="SELECT * FROM Review WHERE User_ID = ?    ";
    $var =(int)$_GET['User_ID'];
  }
  else  $sql="SELECT * FROM Review    ";
  
  $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
  
  if($var!=0)
  $stmt -> bind_param("i",$var) or die("Couldn't bind".htmlspecialchars($stmt->error));

  $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));;
  $rows=$stmt->get_result()->fetch_all(MYSQLI_ASSOC);
  echo json_encode($rows);

    break;


}
?>