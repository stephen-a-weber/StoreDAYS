<?php

$_SERVER["dbconnection"] = getConnection();

// We wrap this in a function so that we do not expose the credentials
function getConnection() {
    // CHANGE TO YOUR LOCAL DB CONFIGURATION //
    $hostname = "localhost";
    $username = "user12";
    $password = "123";
    $database = "StoreDAYS";
    $conn = mysqli_connect($hostname, $username, $password, $database);
    if(!$conn) die("Connection Failed: " . mysqli_connect_error());
    return $conn;
}
