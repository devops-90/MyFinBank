<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.myfinbank.customer.model.Transaction"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Transactions - MyFinBank</title>
    <link rel="stylesheet" href="/css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            color: #495057;
            margin: 0;
            padding: 0;
        }

        nav {
            background-color: #004d99;
            color: white;
            padding: 15px 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        nav img {
            height: 40px; /* Adjust as needed */
            margin-right: 15px;
        }

        nav ul {
            list-style: none;
            padding: 0;
            display: flex;
        }

        nav ul li {
            margin-right: 20px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        nav ul li a:hover {
            background-color: #003366;
        }

        .container {
            max-width: 800px;
            margin: auto;
            padding: 30px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }

        h2 {
            text-align: center;
            color: #004d99;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f8f9fa;
        }

        .link {
            text-align: center;
            margin-top: 20px;
        }

        .link a {
            color: #0066cc;
            text-decoration: none;
            font-weight: bold;
        }

        .link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <nav>
        <div>
       		 <h2 style="margin: 0;">MyFinBank</h2>
   	    </div>
        <ul>
            <li><a href="/api/customer/dashboard" aria-label="Dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="/api/customer/account/details" aria-label="Account Details"><i class="fas fa-wallet"></i> Account Details</a></li>
        </ul>
    </nav>
    <div class="container">
        <h2>Transaction History for Account ID: <%=request.getAttribute("accountId")%></h2>

        <table>
            <tr>
                <th>Account ID</th>           	
                <th>Transaction ID</th>
                <th>Amount</th>
                <th>Type</th>
                <th>Date</th>
            </tr>
            <%
            List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            if (transactions != null && !transactions.isEmpty()) {
                for (Transaction transaction : transactions) {
            %>
            <tr>
                <td><%=request.getAttribute("accountId")%></td>
                <td><%=transaction.getTransactionId()%></td>
                <td><%=transaction.getAmount()%></td>
                <td><%=transaction.getType()%></td>
                <td><%=transaction.getDate().format(formatter) %></td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="4" style="text-align: center;">No transactions found.</td>
            </tr>
            <%
            }
            %>
        </table>

        <div class="link">
            <a href="/api/customer/transactions">Back to Transaction Form</a>
        </div>
        
        <div class="link">
            Back to <a href="/api/customer/dashboard">Dashboard</a>
        </div>
    </div>
</body>
</html>
