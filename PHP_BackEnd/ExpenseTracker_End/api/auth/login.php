<?php

require_once '..\..\config\db.php';

// تعيين نوع الاستجابة JSON
header("Content-Type: application/json");

if (isset($_POST['email']) && isset($_POST['password'])) {

    $email = $_POST['email'];
    $password =md5($_POST['password']);  // لازم تكون نفس القيمة الموجودة بدون تشفير لو مش عامل md5 أو hash
    $stmt = $conn->prepare("SELECT id FROM users WHERE email = ? AND password = ?");
    $stmt->bind_param("ss", $email, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->fetch_assoc()) {
        $token = bin2hex(random_bytes(16));
        
        http_response_code(200); // ✅ نجاح
        echo json_encode([
            
            "message" => "Login successful",
            "token" => $token
        ]);
    } else {
        http_response_code(401); // ✅ غير مصرح
        echo json_encode([
            "status" => "error",
            "message" => "Invalid email or password"
        ]);
    }

} else {
    http_response_code(400); // ✅ خطأ في الطلب
    echo json_encode([
        
        "message" => "Missing email or password"
    ]);
}
