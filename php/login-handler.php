<?php
session_start();

$servername = "localhost"; // or your database server address
$username = "root"; // your database username
$password = ""; // your database password
$dbname = "map_project";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$user = $_POST['username'];
$pass = $_POST['password'];

// Prepare and bind
$stmt = $conn->prepare("SELECT id, password FROM users WHERE username = ?");
$stmt->bind_param("s", $user);
$stmt->execute();
$stmt->store_result();

// Check if user exists
if ($stmt->num_rows > 0) {
    $stmt->bind_result($user_id, $hashed_password);
    $stmt->fetch();

    // Verify password
    if (password_verify($pass, $hashed_password)) {
        // Start session and redirect to admin page
        $_SESSION['user_id'] = $user_id;
        header("Location: admin.php");
        exit();
    } else {
        echo "Invalid credentials";
    }
} else {
    echo "Invalid credentials";
}

$stmt->close();
$conn->close();
?>
