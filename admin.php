<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Map</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/leaflet-draw@1.0.4/dist/leaflet.draw.css" />
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="../css/form.css">

</head>
<body>
    <div id="admin-container">
        <!-- Map for the admin to edit -->
        <div id="map"></div>

        <!-- Tools for editing the map -->
        <div id="admin-tools">
            <h2>Map Editing Tools</h2>
            <!-- We'll add editing tools here later -->
        </div>
    </div>

    <div id="form-container" style="display: none;">
        <?php include 'php/form.php'; ?>
    </div>

    <button id="toggleFormBtn">Show Form</button>

    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/leaflet-draw@1.0.4/dist/leaflet.draw.js"></script>
    <script src="js/admin-map.js"></script>
</body>
</html>
