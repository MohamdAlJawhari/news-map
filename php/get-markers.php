<?php
header('Content-Type: application/json');
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

// Query to get all markers
$sql = "SELECT title, date, image_path, description, lat, lng, marker_type FROM markers";
$result = $conn->query($sql);

$markers = [];
if ($result->num_rows > 0) {
    // Output data of each row
    while($row = $result->fetch_assoc()) {
        $markers[] = $row;
    }
}

echo json_encode($markers);

$conn->close();
?>