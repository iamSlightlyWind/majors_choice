<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Email Verification</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .verification-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 400px;
        }
        .verification-container h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .verification-container p {
            margin-bottom: 30px;
            color: #666;
        }
        .verification-container input[type="text"] {
            padding: 10px;
            width: calc(100% - 22px);
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        .verification-container input[type="submit"] {
            padding: 10px 20px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .verification-container input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="verification-container">
        <h2>Email Verification</h2>
        <p>Please enter the verification code sent to your email address.</p>
        <form action="verifyEmail" method="post">
            <input type="text" name="verificationCode" placeholder="Enter your verification code" required>
            <input type="submit" value="Verify">
        </form>
    </div>
</body>
</html>
