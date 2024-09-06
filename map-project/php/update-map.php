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

if (isset($inputData['type']) && isset($inputData['id'])) {
    if ($inputData['type'] === 'marker') {
        $stmt = $pdo->prepare("UPDATE markers SET title = ?, date = ?, image_path = ?, description = ?, lat = ?, lng = ?, marker_type = ? WHERE id = ?");
        $stmt->execute([$inputData['title'], $inputData['date'], $inputData['image_path'], $inputData['description'], $inputData['lat'], $inputData['lng'], $inputData['marker_type'], $inputData['id']]);
        echo json_encode(['status' => 'success', 'message' => 'Marker updated successfully.']);
    } elseif ($inputData['type'] === 'polygon') {
        $coordinates = json_encode($inputData['coordinates']);
        $stmt = $pdo->prepare("UPDATE polygons SET name = ?, color = ?, coordinates = ? WHERE id = ?");
        $stmt->execute([$inputData['name'], $inputData['color'], $coordinates, $inputData['id']]);
        echo json_encode(['status' => 'success', 'message' => 'Polygon updated successfully.']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid data.']);
}
