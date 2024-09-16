<?php
// Enable error reporting
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$servername = "localhost"; 
$username = "amka";
$password = "securus";
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
// Replace 'events' with your actual table name
$sql = "SELECT title, date, image_path, description FROM events WHERE lat = ? AND lng = ?";
$stmt = $conn->prepare($sql);

if ($stmt === false) {
    die("Prepare failed: " . $conn->error);
}

$stmt->bind_param("dd", $lat, $lng);
$stmt->execute();
$stmt->store_result();

// Check if the query returned any results
if ($stmt->num_rows === 0) {
    // Return an empty response or an error message if no results found
    echo json_encode([
        'title' => null,
        'date' => null,
        'image_path' => null,
        'description' => null
    ]);
    $stmt->close();
    $conn->close();
    exit;
}

$stmt->bind_result($title, $date, $image_path, $description);
$stmt->fetch();

// Create an associative array to send as JSON response
$event = array(
    'title' => $title,
    'date' => $date,
    'image_path' => $image_path,
    'description' => $description
);

// Send the JSON response
header('Content-Type: application/json');
echo json_encode($event);

$stmt->close();
$conn->close();
?>
