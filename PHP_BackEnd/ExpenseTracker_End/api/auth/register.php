<?php
require_once '../../config/db.php';
header("Content-Type: application/json");

if (isset($_POST['email']) && isset($_POST['password']) && isset($_POST['name'])) {

    $email = $_POST['email'];
    $name = $_POST['name'];
    $password = $_POST['password'];

    // التحقق من الطول
    if (strlen($password) < 6) {
        http_response_code(400);
        echo json_encode([
            "message" => "Password must be at least 6 characters"
        ]);
        exit;
    }

    // التحقق من الإيميل بصيغة صحيحة
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        http_response_code(400);
        echo json_encode([
            "message" => "Invalid email format"
        ]);
        exit;
    }

    // التحقق هل الإيميل موجود قبل كدا
    $checkStmt = $conn->prepare("SELECT id FROM users WHERE email = ?");
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
    $hashedPassword = md5($password); // أو password_hash($password, PASSWORD_DEFAULT)

    // تسجيل المستخدم
    $stmt = $conn->prepare("INSERT INTO users (name, email, password) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $name, $email, $hashedPassword);

    if ($stmt->execute()) {
        $token = bin2hex(random_bytes(16));
        http_response_code(201);
        echo json_encode([
            "message" => "Registration successful",
            "token" => $token
        ]);
    } else {
        http_response_code(500);
        echo json_encode([
            "message" => "Registration failed"
        ]);
    }

} else {
    http_response_code(400);
    echo json_encode([
        "message" => "All fields are required"
    ]);
}
