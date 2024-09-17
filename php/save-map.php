    <?php
    header('Content-Type: application/json');
    

    $servername = "localhost";
    $username = "root"; 
    $password = ""; 
    $dbname = "map_project";
    
    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    
    // Get the data from the POST request    
    $data = json_decode(file_get_contents('php://input'), true);
    if (json_last_error() !== JSON_ERROR_NONE) {
        die("Invalid JSON data");
    }
    $type = $data['type'];          // el type huwe nu3 el she ylle 3m yn7at bl 5areta example : polygon - marker ... 



    if ($type === 'marker') {

        $title = isset($data['title']) ? $data['title'] : '';
        $date = isset($data['date']) ? $data['date'] : date('Y-m-d'); // Default to current date if not provided
        $image_path = isset($data['image_path']) ? $data['image_path'] : null;
        $description = isset($data['description']) ? $data['description'] : null;
        $lat = $data['lat'];
        $lng = $data['lng'];
        $marker_type = "marker";
        
        // Insert the marker into the database
        $stmt = $conn->prepare("INSERT INTO markers (title, date, image_path, description, lat, lng, marker_type) VALUES (?, ?, ?, ?, ?, ?,?)");
        if ($stmt === false) {
            die(json_encode(["status" => "error", "message" => "Prepare failed: " . $conn->error]));
        }
        $stmt->bind_param("ssssdds", $title, $date, $image_path, $description, $lat, $lng, $marker_type);
        $stmt->execute();
        if ($stmt->error) {
            die(json_encode(["status" => "error", "message" => "Execute failed: " . $stmt->error]));
        }
        $stmt->close();    
        

    }


    if ($type === 'polygon') {
        $name = $data['name'];
        $coordinates = json_encode($data['coordinates']);
        $color = $data['color']; // You can allow admin to choose a color
        $marker_type="polygon";
        // Insert the polygon into the database
        $stmt = $conn->prepare("INSERT INTO polygons (name,coordinates, color,marker_type) VALUES (?, ?, ?,?)");
        $stmt->bind_param("ssss", $name, $coordinates, $color , $marker_type);
        $stmt->execute();
        $stmt->close();   

    }

    $conn->close();
    echo json_encode(["status" => "success"]);
    ?>
