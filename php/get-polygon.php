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

// Query to get all polygons
$sql = "SELECT name, coordinates, color, marker_type FROM polygons";
$result = $conn->query($sql);

$polygons = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $row['coordinates'] = json_decode($row['coordinates'], true);
        $polygons[] = $row;
    }
}

$conn->close();
echo json_encode($polygons);
?>
