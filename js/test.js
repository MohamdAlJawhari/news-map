// if (type === 'marker') {
//     const latLng = layer.getLatLng();
//     console.log("Marker added at", latLng);

//     // Show the form instead of a prompt
//     showMarkerForm(latLng); // This function will handle the form display and population
// }

// // Function to display the marker form and populate it with coordinates
// function showMarkerForm(latLng) {
//     var formContainer = document.getElementById("form-container");

//     // Populate the hidden input fields with marker lat/lng
//     document.getElementById("marker-lat").value = latLng.lat;
//     document.getElementById("marker-lng").value = latLng.lng;

//     // Show the form
//     if (formContainer.style.display === "none") {
//         formContainer.style.display = "block";
//         document.getElementById("toggleFormBtn").innerText = "Hide Form";
//     }
// }

// // Form toggle button listener
// document.getElementById("toggleFormBtn").addEventListener("click", function() {
//     var formContainer = document.getElementById("form-container");
//     if (formContainer.style.display === "none") {
//         formContainer.style.display = "block"; // Show the form
//         this.innerText = "Hide Form"; // Change button text
//     } else {
//         formContainer.style.display = "none"; // Hide the form
//         this.innerText = "Show Form"; // Change button text
//     }
// });
