<?php
$servername = "localhost";
$username = "root";
$password = "1234";

$db = "zalada";
// Create connection
$conn= new mysqli($servername,$username,$password,$db);
if (!$conn){
    return die("Connection failed: " . mysqli_connect_error());
}

?>