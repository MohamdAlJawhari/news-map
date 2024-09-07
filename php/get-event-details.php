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

$lat = $_GET['lat'];
$lng = $_GET['lng'];

// Query to get event details based on coordinates
$sql = "SELECT title, date, image_path, description FROM markers WHERE lat = ? AND lng = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("dd", $lat, $lng);
$stmt->execute();
$stmt->store_result();
$stmt->bind_result($title, $date, $image_path, $description);
$stmt->fetch();

$event = array(
    'title' => $title,
    'date' => $date,
    'image_path' => $image_path,
    'description' => $description
);

echo json_encode($event);

$stmt->close();
$conn->close();
?>
