// Initialize the map
const map = L.map('map').setView([33.1, 35.5], 9);

// Add OpenStreetMap tile layer
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);

console.log('map.js is loaded');

// Fetch markers from the server
fetch('php/get-markers.php')
    .then(response => response.json())
    .then(data => {
        data.forEach(marker => {
            // Add marker to the map
            const leafletMarker = L.marker([marker.lat, marker.lng])
                .addTo(map)
                .on('click', function () {
                    // Fetch event details when marker is clicked
                    fetch(`php/get-event-details.php?lat=${marker.lat}&lng=${marker.lng}`)
                        .then(response => response.json())
                        .then(eventData => {
                            // Update the sidebar with event details
                            document.getElementById('event-info').innerHTML = `
                                <h2>${eventData.title}</h2>
                                <p>Date: ${eventData.date}</p>
                                <img src="${eventData.image_path}" alt="${eventData.title}" style="width: 100%;" />
                                <p>${eventData.description}</p>
                            `;
                        })
                        .catch(error => console.error('Error fetching event details:', error));
                });
        });
    })
    .catch(error => console.error('Error fetching markers:', error));

// Fetch polygons from the server
fetch('php/get-polygon.php')
    .then(response => response.json())
    .then(data => {
        console.log('Polygons fetched:', data); // Add this line
        data.forEach(polygon => {
            // Extract the coordinates and convert them into Leaflet-friendly format
            const latLngs = polygon.coordinates.map(coord => [coord.lat, coord.lng]);
            console.log('LatLngs for polygon:', latLngs); // Add this line

            // Add polygon to the map
            const leafletPolygon = L.polygon(latLngs, { color: polygon.color })
                .addTo(map)
                .on('click', function () {
                    alert(`Polygon: ${polygon.name}`);
                });
        });
    })
    .catch(error => console.error('Error fetching polygons:', error));
