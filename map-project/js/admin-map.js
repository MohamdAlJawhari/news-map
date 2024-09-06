// Initialize the map for admin
const adminMap = L.map('map').setView([33., 35.2], 9.4);

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
        polygon: true,
        marker: true,
        polyline: true,
        rectangle: false,
        circle: false,
        circlemarker: true
    },
    edit: {
        featureGroup: drawnItems,
        remove: true
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

        // Prompt for details
        const title = prompt("Enter a title for this marker");
        const date = prompt("Enter the date for this marker (YYYY-MM-DD)");
        const imagePath = prompt("Enter the image path for this marker");
        const description = prompt("Enter a description for this marker");
        const markerType = prompt("Enter the marker type");

        // Send marker data to the server
        const markerData = {
            type: 'marker',
            lat: latLng.lat,
            lng: latLng.lng,
            title: title,
            date: date,
            image_path: imagePath,
            description: description,
            marker_type: markerType
        };
        saveLayerToDatabase(markerData);
    }

    if (type === 'polygon') {
        const color = prompt("Enter a color for this polygon (e.g., 'red', '#ff0000')");
        layer.setStyle({
            color: color || '#3388ff',
            weight: 3
        });

        const latLngs = layer.getLatLngs();
        console.log("Polygon added with coordinates", latLngs);

        // Send polygon data to the server
        const polygonData = {
            type: 'polygon',
            coordinates: latLngs,
            color: color || '#3388ff',
            name: prompt("Enter a name for this polygon")
        };
        saveLayerToDatabase(polygonData);
    }
});

// Handle edited layers
adminMap.on('draw:edited', function (event) {
    const layers = event.layers;
    layers.eachLayer(function (layer) {
        // Handle editing logic here
        console.log('Layer edited:', layer);

        if (layer instanceof L.Marker) {
            const latLng = layer.getLatLng();
            console.log("Edited marker at:", latLng);
            updateLayerInDatabase('marker', layer, { lat: latLng.lat, lng: latLng.lng });
        } else if (layer instanceof L.Polygon) {
            const latLngs = layer.getLatLngs();
            console.log("Edited polygon coordinates:", latLngs);
            updateLayerInDatabase('polygon', layer, { coordinates: latLngs });
        }
    });
});

// Handle deleted layers
adminMap.on('draw:deleted', function (event) {
    const layers = event.layers;
    layers.eachLayer(function (layer) {
        console.log('Layer deleted:', layer);
        deleteLayerFromDatabase(layer);
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

// Function to update layer data in the database
function updateLayerInDatabase(type, layer, data) {
    // Add the layer ID or some identifier to update
    const id = layer._leaflet_id; // Example, implement a real way to identify layers

    fetch('php/update-map.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ type, id, ...data })
    })
        .then(response => response.json())
        .then(data => console.log('Layer updated:', data))
        .catch(error => console.error('Error updating layer:', error));
}

// Function to delete layer data from the database
function deleteLayerFromDatabase(layer) {
    const id = layer._leaflet_id; // Example, implement a real way to identify layers

    fetch('php/delete-map.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ id })
    })
        .then(response => response.json())
        .then(data => console.log('Layer deleted:', data))
        .catch(error => console.error('Error deleting layer:', error));
}
