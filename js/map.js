const map = L.map('map').setView([33.1, 35.5], 9);

// Add OpenStreetMap tile layer
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
}).addTo(map);

console.log('map.js is loaded');

// Fetch markers from the server
fetch('php/get-markers.php')
    .then(response => response.json())
    .then(data => {
        data.forEach(marker => {
            if (marker.lat && marker.lng) {
                const leafletMarker = L.marker([marker.lat, marker.lng])
                    .addTo(map)
                    .on('click', function () {
                        fetch(`php/get-event-details.php?lat=${marker.lat}&lng=${marker.lng}`)
                            .then(response => response.json())
                            .then(eventData => {
                                console.log('Event data received:', eventData);

                                document.getElementById('event-info').innerHTML = `
                                    <h2>${eventData.title || 'No Title'}</h2>
                                    <p>Date: ${eventData.date || 'No Date'}</p>
                                    <img src="${eventData.image_path || 'placeholder.jpg'}" alt="${eventData.title || 'No Title'}" style="width: 100%;" />
                                    <p>${eventData.description || 'No Description'}</p>
                                `;
                            })
                            .catch(error => console.error('Error fetching event details:', error));
                    });
            } else {
                console.error('Marker data is missing lat or lng:', marker);
            }
        });
    })
    .catch(error => console.error('Error fetching markers:', error));



    fetch('php/get-polygon.php')
        .then(response => response.json())
        .then(polygons => {
            console.log('Fetched polygons:', polygons); 
            polygons.forEach(polygonData => {
                L.polygon(polygonData.coordinates, { color: polygonData.color })
                    .addTo(map)
                    .bindPopup(`<b>${polygonData.name}</b>`);
            });
        })
        .catch(error => console.error('Error loading polygons:', error));
