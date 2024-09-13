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
$sql = "SELECT id, name, color, coordinates FROM polygons";
$result = $conn->query($sql);

$polygons = array();
if ($result->num_rows > 0) {
    // Output data of each row
    while($row = $result->fetch_assoc()) {
        // Decode the JSON coordinates into a PHP array
        $row['coordinates'] = json_decode($row['coordinates']);
        $polygons[] = $row;
    }
}

// Return the polygons as JSON
echo json_encode($polygons);

$conn->close();
?>
