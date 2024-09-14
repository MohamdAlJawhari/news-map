<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form</title>
    <link rel="stylesheet" href="../css/form.css">
</head>
<body>
    <form action="admin.php" id="note-form" method="post">
        <h2>Enter Note Information</h2>

        <!-- Report Title -->
        <label for="note-title">General title:</label>
        <input type="text" id="note-title" class="form-input" placeholder="Enter a title..." />

        <!-- Image/Video Upload -->
        <label for="media-upload">Attach Media (Image/Video):</label>
        <input type="file" id="media-upload" class="form-input" accept="image/*,video/*" />

        <!-- Event Date -->
        <label for="date">Date of event:</label>
        <input type="date" id="date" class="form-input" />

        <!-- Note Text -->
        <label for="note-text">Note Text:</label>
        <textarea id="note-text" class="form-input" rows="3" placeholder="Enter your note"></textarea>

        <!-- Dropdown for Icon Selection -->
        <label for="icon-select">Select an Icon:</label>
        <div class="custom-select">
            <div class="select-selected">Select an Icon</div>
            <!-- Icon Preview -->
             <img id="preview-image" src="" alt="Selected Icon" style="width: 24px; height: 24px;" />

            
            <div class="select-items select-hide">
                <div data-value="icon1"><img src="../icons/armor.png" alt="Icon 1"/> armor</div>
                <div data-value="icon2"><img src="../icons/bomb.png" alt="Icon 2"/> bomb</div>
                <div data-value="icon3"><img src="../icons/destroyed.png" alt="Icon 3"/> destroyed</div>
                <div data-value="icon4"><img src="../icons/drone.png" alt="Icon 4"/> drone</div>
                <div data-value="icon5"><img src="../icons/jet.png" alt="Icon 5"/> jet</div>
                <div data-value="icon6"><img src="../icons/missile.png" alt="Icon 6"/> missile</div>
                <div data-value="icon7"><img src="../icons/rocket.png" alt="Icon 7"/> rocket</div>
                <div data-value="icon8"><img src="../icons/tank.png" alt="Icon 8"/> tank</div>


                <!-- Add more items as needed -->
            </div>
        </div>
        
        <!-- Submit button -->
         <div>
            <button type="submit" id="submit-note">Add Note</button>
         </div>
        
    </form>

    <script src="../js/form.js"></script>
</body>
</html>
