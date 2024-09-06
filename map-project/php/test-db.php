<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "map_project";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$admin_username = "admin";
$admin_password = "adminpassword"; // Change this to a secure password
$hashed_password = password_hash($admin_password, PASSWORD_DEFAULT);

// Prepare and execute
$stmt = $conn->prepare("INSERT INTO users (username, password) VALUES (?, ?)");
$stmt->bind_param("ss", $admin_username, $hashed_password);
$stmt->execute();

echo "Admin user added successfully";

$stmt->close();
$conn->close();
?>
