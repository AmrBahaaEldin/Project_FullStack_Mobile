<?php
$servername = "localhost";
$username = "root";
$password = "1234";

$db = "expensetracker";

// Create connection
$conn =new mysqli($servername, $username, $password,$db);

// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

?>  