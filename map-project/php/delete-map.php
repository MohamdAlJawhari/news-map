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

if (isset($inputData['id'])) {
    $id = $inputData['id'];

    // Delete marker
    $stmt = $pdo->prepare("DELETE FROM markers WHERE id = ?");
    $stmt->execute([$id]);

    // Delete polygon
    $stmt = $pdo->prepare("DELETE FROM polygons WHERE id = ?");
    $stmt->execute([$id]);

    echo json_encode(['status' => 'success', 'message' => 'Layer deleted successfully.']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid data.']);
}
