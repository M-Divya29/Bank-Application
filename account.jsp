<!DOCTYPE html>
<html>
<head>
    <title>MyBank - Create Account</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            margin: 0;
            padding: 20px;
            min-height: 100vh;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            max-width: 600px;
            margin: 0 auto;
        }
        .header {
            text-align: center;
            color: #1e3c72;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }
        input, select {
            width: 100%;
            padding: 12px;
            border: 2px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }
        input:focus, select:focus {
            border-color: #1e3c72;
            outline: none;
        }
        .btn {
            width: 100%;
            padding: 15px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s;
        }
        .btn:hover {
            background: #218838;
        }
        .error {
            color: red;
            margin-bottom: 15px;
            padding: 10px;
            background: #ffe6e6;
            border-radius: 5px;
        }
        .success {
            color: green;
            margin-bottom: 15px;
            padding: 10px;
            background: #e6ffe6;
            border-radius: 5px;
        }
        .back-btn {
            display: inline-block;
            margin-bottom: 20px;
            padding: 8px 16px;
            background: #6c757d;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .form-row {
            display: flex;
            gap: 15px;
        }
        .form-row .form-group {
            flex: 1;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="dashboard.jsp" class="back-btn">← Back to Dashboard</a>
        
        <div class="header">🏦 Create Bank Account</div>
        
        <% String msg = (String) request.getAttribute("msg"); %>
        <% if (msg != null) { %>
            <div class="<%= msg.contains("success") ? "success" : "error" %>"><%= msg %></div>
        <% } %>
        
        <form action="createAccount" method="post">
            <div class="form-group">
                <label for="accountNumber">Account Number:</label>
                <input type="number" id="accountNumber" name="accountNumber" 
                       placeholder="Enter 10-digit account number" required>
            </div>
            
            <div class="form-group">
                <label for="accountType">Account Type:</label>
                <select id="accountType" name="accountType" required>
                    <option value="">Select Account Type</option>
                    <option value="Savings">Savings Account</option>
                    <option value="Current">Current Account</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="ifsc">IFSC Code:</label>
                <input type="text" id="ifsc" name="ifsc" value="MB00001122" 
                       placeholder="IFSC Code" required onblur="fillBankDetails()">
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="bankName">Bank Name:</label>
                    <input type="text" id="bankName" name="bankName" value="MyBank" required>
                </div>
                
                <div class="form-group">
                    <label for="branch">Branch:</label>
                    <input type="text" id="branch" name="branch" value="Main Branch" required>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="city">City:</label>
                    <input type="text" id="city" name="city" value="Bangalore" required>
                </div>
                
                <div class="form-group">
                    <label for="state">State:</label>
                    <input type="text" id="state" name="state" value="Karnataka" required>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="pin">Account PIN:</label>
                    <input type="password" id="pin" name="pin" 
                           placeholder="4-digit PIN" pattern="[0-9]{4}" required>
                </div>
                
                <div class="form-group">
                    <label for="confirmPin">Confirm PIN:</label>
                    <input type="password" id="confirmPin" name="confirmPin" 
                           placeholder="Confirm PIN" pattern="[0-9]{4}" required>
                </div>
            </div>
            
            <button type="submit" class="btn" onclick="return validateForm()">Create Account</button>
        </form>
    </div>

    <script>
        function fillBankDetails() {
            var ifsc = document.getElementById("ifsc").value.trim().toUpperCase();
            if (ifsc === "MB00001122") {
                document.getElementById("bankName").value = "MyBank";
                document.getElementById("branch").value = "Main Branch";
                document.getElementById("city").value = "Bangalore";
                document.getElementById("state").value = "Karnataka";
            }
        }
        
        function validateForm() {
            var pin = document.getElementById("pin").value;
            var confirmPin = document.getElementById("confirmPin").value;
            
            if (pin !== confirmPin) {
                alert("PIN and Confirm PIN do not match!");
                return false;
            }
            
            if (pin.length !== 4) {
                alert("PIN must be exactly 4 digits!");
                return false;
            }
            
            return true;
        }
        
        // Auto-fill on page load
        window.onload = function() {
            fillBankDetails();
        };
    </script>
</body>
</html>