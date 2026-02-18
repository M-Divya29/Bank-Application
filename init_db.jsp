<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Database Initialization</title>
</head>
<body>
    <h2>Database Initialization</h2>
    <%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/my_bank?createDatabaseIfNotExist=true&useSSL=false", 
            "root", "Mdivya@2904");
        
        Statement stmt = con.createStatement();
        
        // Create users table
        stmt.execute("CREATE TABLE IF NOT EXISTS users (" +
            "id INT PRIMARY KEY AUTO_INCREMENT, " +
            "email VARCHAR(100) UNIQUE, " +
            "password VARCHAR(100), " +
            "firstname VARCHAR(50), " +
            "lastname VARCHAR(50), " +
            "gender VARCHAR(10), " +
            "address VARCHAR(200), " +
            "image VARCHAR(200), " +
            "age INT, " +
            "phone BIGINT UNIQUE" +
            ")");
        
        // Create bank table
        stmt.execute("CREATE TABLE IF NOT EXISTS bank (" +
            "id INT PRIMARY KEY AUTO_INCREMENT, " +
            "bankName VARCHAR(45), " +
            "pin INT(4), " +
            "balance DOUBLE DEFAULT 0, " +
            "accNum BIGINT(12) UNIQUE, " +
            "ifsc VARCHAR(45), " +
            "phoneNum BIGINT(10), " +
            "accountType VARCHAR(45), " +
            "branch VARCHAR(50), " +
            "city VARCHAR(50), " +
            "state VARCHAR(50), " +
            "email VARCHAR(45)" +
            ")");
        
        out.println("<p style='color:green'>✓ Database and tables created successfully!</p>");
        out.println("<p>Database: my_bank</p>");
        out.println("<p>Tables: users, bank</p>");
        
        con.close();
        
    } catch (Exception e) {
        out.println("<p style='color:red'>Error: " + e.getMessage() + "</p>");
        e.printStackTrace(new java.io.PrintWriter(out));
    }
    %>
    
    <p><a href="index.jsp">Back to Home</a></p>
    <p><a href="test.jsp">Test Page</a></p>
</body>
</html>