// Initialize the map for admin
const adminMap = L.map('map').setView([33.1, 35.5], 9);

// Add OpenStreetMap tile layer                                                     muraba3at z8ar btsha2ef el map 27san lal load
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
}).addTo(adminMap);

// Create a layer group to store the drawn items (markers, polygons, etc.)          3ashen el polygons 
const drawnItems = new L.FeatureGroup();
adminMap.addLayer(drawnItems);

// Add drawing controls for markers, polygons, and editing/deleting                 el controls taba3 el edit hyde lezem tet8ayar w tser el da2era ylle bl nus 
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

// Handle created layers (markers, polygons, etc.)                                    hun shu na2yna beser mtl ma na2yna polygon or marker y3ne nafsa bs mnzeda 3la kabset el da2era w mnzed 3laya el eshya el tenye 
adminMap.on(L.Draw.Event.CREATED, function (event) {
    const layer = event.layer;                                                                      
    const type = event.layerType;

    // Add the new layer to the drawnItems group
    drawnItems.addLayer(layer);

    if (type === 'marker') {
        const latLng = layer.getLatLng();
        console.log("Marker added at", latLng);
        const date = prompt("Enter the date (YYYY-MM-DD)", new Date().toISOString().split('T')[0]);                 // Default to today's date bdna nzed el murabba3 taba3 el calendar 2shal 
        const image_path = prompt("Enter the image path (optional)");
        const description = prompt("Enter a description (optional)");                                               // fe mshkle bl description check 
                                                                                                    //
        // Send marker data to the server (optional)
        const markerData = {
            type: 'marker',
            lat: latLng.lat,
            lng: latLng.lng,
            title: prompt("Enter a title for this marker"),
            date: date,
            image_path: image_path,
            description: description

        };
        saveLayerToDatabase(markerData);
    }
                                                                                                    
    if (type === 'polygon') {
        const name = prompt("Enter the name for this polygon (optional)");
        const color = prompt("Enter a color for this polygon (e.g., 'red', '#ff0000')");
                                                                                                                 // be lawen el polygon 7asab ma na22a el user w eza ma na22a by default be na2e '#3388ff'
        layer.setStyle({
            color: color || '#3388ff', 
            weight: 3
        });

        const latLngs = layer.getLatLngs();
        console.log("Polygon added with coordinates", latLngs);
                                                                                                    //
        // Send polygon data to the server (optional)
        const polygonData = {
            name:'name',
            type: 'polygon',
            coordinates: latLngs,
            color: color || '#3388ff'  // Fallback color if no color is entered
        };
        saveLayerToDatabase(polygonData);
    }
});
                                                                                                                    // 3la 2ases btsayef bl database bs b3dun el coordinates ma 3m ytsayafu 2asean
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

// Handle deleted layers                                                                                                        // nafs el she b5sus el delete 
adminMap.on('draw:deleted', function (event) {
    const layers = event.layers;
    layers.eachLayer(function (layer) {
        console.log('Layer deleted:', layer);
    });
});

// Function to send layer data to the server to be saved in the database                                                 // el method ylle 3m tb3at el data to the database mtl el marker wl polygon wl events ... 
function saveLayerToDatabase(data) {
    fetch('../php/save-map.php', {
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

// visibility of the form when the button is clicked.                                                       bt8ayyer el hide wl show button lal form 
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