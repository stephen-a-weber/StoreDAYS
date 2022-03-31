<?php
require_once "config.php";
if(isset($_GET['ID'])&isset($_GET['Body']) && isset($_GET['User_ID'])&& isset($_GET['Rate'])&& isset($_GET['Items_ID'])&& isset($_GET['Catagory_ID']) ){
    $ID= $_GET['ID'];
        $Body= $_GET['Body'];
    $User_ID= $_GET['User_ID'];
    $Rate= $_GET['Rate'];
    $Items_ID= $_GET['Items_ID'];
    $Catagory_ID= $_GET['Catagory_ID'];
    echo json_encode(new ReviewModel($ID,$Body,$User_ID,$Rate,$Items_ID,$Catagory_ID));
    
    }
$sql = "SELECT * FROM User";
$result = $_SERVER['dbconnection']->prepare($sql);
$rows = $result->fetch_all(MYSQLI_ASSOC);
echo json_encode($rows);

?>