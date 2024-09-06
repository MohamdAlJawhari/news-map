<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interactive Map</title>
    <link rel="stylesheet" href="css/style.css"><!-- Leaflet CSS -->
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
    <script>
    // Fetch saved markers and polygons from the database
    fetch('php/load-map.php')
    .then(response => response.json())
    .then(data => {
        // Load markers
        data.markers.forEach(marker => {
            L.marker([marker.lat, marker.lng])
                .bindPopup(`<b>${marker.title}</b>`)
                .addTo(map);
        });

        // Load polygons
        data.polygons.forEach(polygon => {
            const coordinates = JSON.parse(polygon.coordinates);
            const polygonLayer = L.polygon(coordinates, {
                color: polygon.color
            }).addTo(map);
        });
    })
    .catch(error => console.error('Error loading map data:', error));
</script>
</body>
</html>

<!-- [33., 35.2], 9.4 -->