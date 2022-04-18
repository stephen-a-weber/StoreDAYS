<?php
require_once "config.php";

if (!empty($_GET['Email'])) {
    $Email = $_GET["Email"];
    $sql = "SELECT ID FROM User WHERE Email=?";
    $stmt = $_SERVER['dbconnection']->prepare($sql) or die("Couldn't prepare" . htmlspecialchars($stmt->error));
    $stmt->bind_param("s", $Email) or die("Couldn't bind" . htmlspecialchars($stmt->error));
    $stmt->execute() or die("Couldn't excute" . htmlspecialchars($stmt->error));
    $rows = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
    $Empty['ID']=0;
    if (empty($rows))
        echo json_encode($Empty);
    else
        echo json_encode($rows[0]);
} else {
    die("Post was not met");
}
?>