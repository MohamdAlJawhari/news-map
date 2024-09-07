<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interactive Map</title>
    <link rel="stylesheet" href="css/style.css">
    <!-- Leaflet CSS -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
</head>
<body>
    <div id="container">
        <!-- Map container -->
        <div id="map"></div>

        <!-- Sidebar for event details -->
        <div id="sidebar">
            <h2>Event Details</h2>
            <div id="event-info">
                <!-- Event details will be dynamically inserted here -->
            </div>
        </div>
    </div>

    <!-- Leaflet JS -->
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <script src="js/map.js"></script> <!-- Your custom JavaScript for the map -->
</body>
</html>
