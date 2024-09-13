// Initialize the map for admin
const adminMap = L.map('map').setView([33.1, 35.5], 9);

// Add OpenStreetMap tile layer
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(adminMap);

// Create a layer group to store the drawn items (markers, polygons, etc.)
const drawnItems = new L.FeatureGroup();
adminMap.addLayer(drawnItems);

// Add drawing controls for markers, polygons, and editing/deleting
const drawControl = new L.Control.Draw({
    draw: {
        polygon: true,   // Enable drawing polygons
        marker: true,    // Enable adding markers
        polyline: false,  // Enable polylines
        rectangle: false, // Enable rectangles
        circle: false,    // Enable circles
        circlemarker: false // Enable circle markers
    },
    edit: {
        featureGroup: drawnItems,  // This is the group that contains all drawn layers
        remove: true               // Enable the ability to delete layers
    }
});
adminMap.addControl(drawControl);

// Handle created layers (markers, polygons, etc.)
adminMap.on(L.Draw.Event.CREATED, function (event) {
    const layer = event.layer;
    const type = event.layerType;

    // Add the new layer to the drawnItems group
    drawnItems.addLayer(layer);

    if (type === 'marker') {
        const latLng = layer.getLatLng();
        console.log("Marker added at", latLng);

        // Send marker data to the server (optional)
        const markerData = {
            type: 'marker',
            lat: latLng.lat,
            lng: latLng.lng,
            title: prompt("Enter a title for this marker")
        };
        saveLayerToDatabase(markerData);
    }

    if (type === 'polygon') {
        // Prompt for color input
        const color = prompt("Enter a color for this polygon (e.g., 'red', '#ff0000')");

        // Set the style for the polygon with the selected color
        layer.setStyle({
            color: color || '#3388ff', // Fallback color if no color is entered
            weight: 3
        });

        const latLngs = layer.getLatLngs();
        console.log("Polygon added with coordinates", latLngs);

        // Send polygon data to the server (optional)
        const polygonData = {
            type: 'polygon',
            coordinates: latLngs,
            color: color || '#3388ff'  // Fallback color if no color is entered
        };
        saveLayerToDatabase(polygonData);
    }
});

// visibility of the form when the button is clicked.
document.getElementById("toggleFormBtn").addEventListener("click", function() {
    var formContainer = document.getElementById("form-container");
    if (formContainer.style.display === "none") {
        formContainer.style.display = "block"; // Show the form
        this.innerText = "Hide Form"; // Change button text
    } else {
        formContainer.style.display = "none"; // Hide the form
        this.innerText = "Show Form"; // Change button text
    }
});

// Handle edited layers
adminMap.on('draw:edited', function (event) {
    const layers = event.layers;
    layers.eachLayer(function (layer) {
        // Handle editing logic here (e.g., updating the coordinates in the database)
        console.log('Layer edited:', layer);

        if (layer instanceof L.Marker) {
            const latLng = layer.getLatLng();
            console.log("Edited marker at:", latLng);
            // Update marker data in the database (optional)
        } else if (layer instanceof L.Polygon) {
            const latLngs = layer.getLatLngs();
            console.log("Edited polygon coordinates:", latLngs);
            // Update polygon data in the database (optional)
        }
    });
});

// Handle deleted layers
adminMap.on('draw:deleted', function (event) {
    const layers = event.layers;
    layers.eachLayer(function (layer) {
        // Handle deletion logic here (e.g., removing the layer from the database)
        console.log('Layer deleted:', layer);
        // Optional: Send layer ID to the server to delete from the database
    });
});

// Function to send layer data to the server to be saved in the database
function saveLayerToDatabase(data) {
    fetch('php/save-map.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => console.log('Layer saved:', data))
    .catch(error => console.error('Error saving layer:', error));
}
