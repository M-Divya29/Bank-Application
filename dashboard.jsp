<%@page import="com.ty.dto.User"%>
<%@page import="com.ty.dao.UserDao"%>
<%@page import="com.ty.dao.BankAccountDao"%>
<%@page import="com.ty.dto.BankAccount"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <title>MyBank - Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #f5f7fa;
        }
        .header {
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            color: white;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logo {
            font-size: 24px;
            font-weight: bold;
        }
        .user-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        .logout-btn {
            background: #dc3545;
            color: white;
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }
        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
        }
        .services {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }
        .services h2 {
            color: #1e3c72;
            margin-bottom: 20px;
            border-bottom: 2px solid #ff6b35;
            padding-bottom: 10px;
        }
        .service-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }
        .service-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            text-decoration: none;
            transition: transform 0.3s;
        }
        .service-card:hover {
            transform: translateY(-5px);
        }
        .service-card h3 {
            margin-bottom: 10px;
        }
        .account-info {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .account-info h2 {
            color: #1e3c72;
            margin-bottom: 20px;
            border-bottom: 2px solid #ff6b35;
            padding-bottom: 10px;
        }
        .info-box {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            border-left: 4px solid #1e3c72;
        }
        .info-box p {
            margin-bottom: 10px;
        }
        .account-details {
            background: #e8f5e8;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
            border-left: 3px solid #28a745;
        }
    </style>
</head>
<body>
    <%
    String email = (String) session.getAttribute("loginEmail");
    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    User user = null;
    try {
        user = new UserDao().fetchProfileByEmail(email);
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    %>
    
    <div class="header">
        <div class="logo">🏦 MyBank</div>
        <div class="user-info">
            <span>Welcome, <%= user.getFirstname() + " " + user.getLastname() %></span>
            <a href="login.jsp" class="logout-btn">Logout</a>
        </div>
    </div>

    <div class="container">
        <div class="services">
            <h2>Banking Services</h2>
            <div class="service-grid">
                <a href="account.jsp" class="service-card">
                    <h3>🏦 Open Account</h3>
                    <p>Create a new bank account</p>
                </a>
                
                <a href="checkBalance.jsp" class="service-card">
                    <h3>💰 Check Balance</h3>
                    <p>View your account balance</p>
                </a>
                
                <a href="moneyTransfer.jsp" class="service-card">
                    <h3>💸 Fund Transfer</h3>
                    <p>Transfer money to other accounts</p>
                </a>
                
                <a href="transactions.jsp" class="service-card">
                    <h3>📊 Transaction History</h3>
                    <p>View your transaction history</p>
                </a>
                
                <a href="profile.jsp" class="service-card">
                    <h3>👤 Profile</h3>
                    <p>Update your profile information</p>
                </a>
                
                <a href="pwdUpdate.jsp" class="service-card">
                    <h3>🔐 Change Password</h3>
                    <p>Update your login password</p>
                </a>
            </div>
        </div>

        <div class="account-info">
            <h2>Account Overview</h2>
            <%
            try {
                List<BankAccount> accounts = new BankAccountDao().fetchBankByEmail(email);
                if (!accounts.isEmpty()) {
                    double totalBalance = 0;
                    for (BankAccount acc : accounts) {
                        totalBalance += acc.getBalance();
                    }
            %>
                <div class="info-box">
                    <p><strong>Total Accounts:</strong> <%= accounts.size() %></p>
                    <p><strong>Total Balance:</strong> ₹<%= String.format("%.2f", totalBalance) %></p>
                    <p><strong>Account Holder:</strong> <%= user.getFirstname() + " " + user.getLastname() %></p>
                    <p><strong>Email:</strong> <%= email %></p>
                    <p><strong>Phone:</strong> <%= user.getPhone() %></p>
                    
                    <h4 style="margin-top: 20px; color: #1e3c72;">Your Accounts:</h4>
                    <% for (BankAccount account : accounts) { %>
                        <div class="account-details">
                            <p><strong>Account Number:</strong> <%= account.getAccountNumber() %></p>
                            <p><strong>Account Type:</strong> <%= account.getAccountType() %></p>
                            <p><strong>Balance:</strong> ₹<%= String.format("%.2f", account.getBalance()) %></p>
                            <p><strong>IFSC:</strong> <%= account.getIfsc() %></p>
                        </div>
                    <% } %>
                </div>
            <%
                } else {
            %>
                <div class="info-box">
                    <p><strong>No bank accounts found.</strong></p>
                    <p>Get started by <a href="account.jsp" style="color: #1e3c72; font-weight: bold;">creating your first account</a></p>
                </div>
            <%
                }
            } catch (Exception e) {
            %>
                <div class="info-box">
                    <p style="color: red;"><strong>Error loading account information:</strong> <%= e.getMessage() %></p>
                </div>
            <%
            }
            %>
        </div>
    </div>
</body>
</html>