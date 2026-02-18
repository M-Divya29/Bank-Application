<!DOCTYPE html>
<html>
<head>
    <title>MyBank - Welcome</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            text-align: center;
            max-width: 500px;
        }
        .logo {
            color: #1e3c72;
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .btn {
            display: inline-block;
            padding: 15px 30px;
            margin: 10px;
            background: #1e3c72;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background 0.3s;
        }
        .btn:hover {
            background: #2a5298;
        }
        .btn-signup {
            background: #28a745;
        }
        .btn-signup:hover {
            background: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">🏦 MyBank</div>
        <h2>Welcome to MyBank</h2>
        <p>Your trusted partner for secure internet banking</p>
        <p>Current time: <%= new java.util.Date() %></p>
        
        <div>
            <a href="login.jsp" class="btn">Login</a>
            <a href="signup.jsp" class="btn btn-signup">Sign Up</a>
        </div>
        
        <p><a href="test.jsp">Test Page</a></p>
    </div>
</body>
</html>