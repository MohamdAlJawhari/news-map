<?php
// Database connection
$host = 'localhost';
$dbname = 'map_project';
$username = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}

// Get the input data
$inputData = json_decode(file_get_contents("php://input"), true);

if (isset($inputData['type'])) {
    if ($inputData['type'] === 'marker') {
        $stmt = $pdo->prepare("INSERT INTO markers (title, date, image_path, description, lat, lng, marker_type) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->execute([$inputData['title'], $inputData['date'], $inputData['image_path'], $inputData['description'], $inputData['lat'], $inputData['lng'], $inputData['marker_type']]);
        echo json_encode(['status' => 'success', 'message' => 'Marker saved successfully.']);
    } elseif ($inputData['type'] === 'polygon') {
        $stmt = $pdo->prepare("INSERT INTO polygons (name, color, coordinates) VALUES (?, ?, ?)");
        $coordinates = json_encode($inputData['coordinates']); // Convert coordinates to JSON format
        $stmt->execute([$inputData['name'], $inputData['color'], $coordinates]);
        echo json_encode(['status' => 'success', 'message' => 'Polygon saved successfully.']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid data.']);
}
