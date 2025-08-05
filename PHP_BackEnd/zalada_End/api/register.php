l
<?php
require_once '../config/db.php';
header("Content-Type: application/json");
if (isset($_POST['email']) && isset($_POST['password'])) {
$email=$_POST['email'];
$pass=$_POST['password'];
;
if(strlen($pass)<6){
     http_response_code(400);
     echo json_encode([
        "message" => "Password must be at least 6 characters"
 ]);
 exit;
    }

   if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        http_response_code(400);
        echo json_encode([
            "message" => "Invalid email format"
        ]);
        exit;
    }
    $checkStmt=$conn->prepare("SELECT id FROM users WHERE email = ?");
$checkStmt->bind_param("s", $email);
    $checkStmt->execute();
    $checkResult = $checkStmt->get_result();
    if ($checkResult->num_rows > 0) {
        http_response_code(409); // Conflict
        echo json_encode([
            "message" => "Email already exists"
        ]);
        exit;
    }
    // تشفير الباسورد
    $hashedPassword = md5($pass);

    // تسجيل المستخدم
    $stmt = $conn->prepare("INSERT INTO users ( email, password) VALUES (?, ?)");
    $stmt->bind_param("ss",$email, $hashedPassword);
    if ($stmt->execute()) {
        $token = bin2hex(random_bytes(16));
        http_response_code(201);
        echo json_encode([
            "message" => "Registration successful",
            "token" => $token
        ]);
    } 
    else {
        http_response_code(500);
        echo json_encode([
            "message" => "Registration failed"
        ]);
    }
}

    else {
    http_response_code(400);
    echo json_encode([
        "message" => "All fields are required"
    ]);
}

?>