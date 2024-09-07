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

// Get the data from the POST request
$data = json_decode(file_get_contents('php://input'), true);
$type = $data['type']; // marker or polygon

if ($type === 'marker') {
    $lat = $data['lat'];
    $lng = $data['lng'];
    $title = $data['title'];
    
    // Insert the marker into the database
    $stmt = $conn->prepare("INSERT INTO markers (title, lat, lng) VALUES (?, ?, ?)");
    $stmt->bind_param("sdd", $title, $lat, $lng);
    $stmt->execute();
    $stmt->close();
}

if ($type === 'polygon') {
    $coordinates = json_encode($data['coordinates']);
    $color = $data['color']; // You can allow admin to choose a color
    
    // Insert the polygon into the database
    $stmt = $conn->prepare("INSERT INTO polygons (coordinates, color) VALUES (?, ?)");
    $stmt->bind_param("ss", $coordinates, $color);
    $stmt->execute();
    $stmt->close();
}

$conn->close();
echo json_encode(["status" => "success"]);
?>
