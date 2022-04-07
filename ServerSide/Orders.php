<?php
require_once "config.php";

$Method=$_SERVER['REQUEST_METHOD'];
switch ($Method){
case "POST":
  if(isset($_POST['ID'])){
    $sql="UPDATE Orders set  Cost = ?, Description = ?, Invoice_ID = ? WHERE ID = ?";
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
    $stmt -> bind_param("isii",$Cost,$Description,$Invoice_ID,$ID) or die("Couldn't bind".htmlspecialchars($stmt->error));
    $stmt->execute();
  }
  else if (isset($_POST['Invoice_ID'])&&isset($_POST['Cost'])){
        $Invoice_ID = (int)$_POST['Invoice_ID'];
        $Cost = (int)$_POST['Cost'];
        //initialize description in case one wasn't given
        $Description=" ";
        //if post is set assign the description
        if(isset($_POST['Description'])){
          $Description=$_POST['Description'];}
        $sql = "INSERT INTO Orders (Cost, Description, Invoice_ID) VALUES (?,?,?,?)        ";
        $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
        $stmt -> bind_param("isi",$Cost,$Description,$Invoice_ID)or die("Couldn't bind".htmlspecialchars($stmt->error));
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
  }
  //if we are looking for a set of order for an invoice
  if(isset($_GET['Invoice_ID'])){
    $sql="SELECT * FROM Orders WHERE Invoice_ID = ?";
    $var =(int)$_GET['Invoice_ID'];
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
        $sql="DELETE FROM Orders Where ID = ?";
        $var=(int)$_GET['ID'];
      }

      //if we are looking for a set
     else if(!empty($_GET['User_ID'])){
        $sql="DELETE FROM Orders WHERE User_ID = ?";
        $var =(int)$_GET['User_ID'];
      } else
      die("Get wasn't define");

      $stmt = $_SERVER['dbconnection']->prepare($sql)or die("Couldn't prepare".htmlspecialchars($stmt->error));
      $stmt -> bind_param("i",$var) or die("Couldn't bind".htmlspecialchars($stmt->error));
      $stmt->execute()or die("Couldn't excute".htmlspecialchars($stmt->error));;
      $rows=$stmt->get_result()->fetch_all(MYSQLI_ASSOC);
      echo json_encode($rows);

        break;

}
?>
