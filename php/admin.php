<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header('Location: ../login.php');
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
    <link rel="stylesheet" href="../css/style.css">
    <style>
    .leaflet-container .leaflet-control-attribution {
    display:none
	}</style>

</head>
<body>
    <div id="admin-containesr">
        <!-- Map for the admin to edit -->
        <div id="map"></div>

    </div>
     <button id="toggleFormBtn">Show Form</button>                        <!-- Kbaset el form 3m tet8ayar using js yalle be adminmap.js-->
     <div id="form-container" style="display: none;">                     <!-- el main div ylle 5assa bl form 3m t3ayyet la form.php be2aleb el admin.php-->
                                                                          <!--  hyde be admin.php msh lezem el 3alam y3mlula access ? or bs el admins ?-->
        <?php include 'form.php'; ?>
    </div>

    

    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <script src="../js/leaflet-draw.js"></script>
    <script src="../js/admin-map.js"></script>
</body>
</html>
