<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.List" %>
<%@ page import="com.myfinbank.customer.model.Account" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account List - MyFinBank</title>
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

        nav h2 {
            margin: 0;
            font-size: 24px;
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
            transition: background-color 0.3s, transform 0.2s;
        }

        nav ul li a:hover {
            background-color: #003366;
            transform: translateY(-2px);
        }

        h1 {
            text-align: center;
            margin-top: 30px;
            color: #004d99;
        }

        table {
            width: 70%;
            max-width: 800px;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #0066cc;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .action-button {
            background-color: #0066cc;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        .action-button:hover {
            background-color: #005bb5;
            transform: translateY(-2px);
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 16px;
            color: #004d99;
            text-decoration: none;
            transition: color 0.3s;
        }

        .back-link:hover {
            color: #003366;
        }

        @media (max-width: 768px) {
            nav ul {
                flex-direction: column;
                align-items: flex-start;
            }

            nav ul li {
                margin: 10px 0;
            }

            table {
                width: 90%;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <nav>
        <h2>MyFinBank</h2>
        <ul>
            <li><a href="/api/customer/dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="/api/customer/deposit"><i class="fas fa-plus"></i> Deposit</a></li>
            <li><a href="/api/customer/withdraw"><i class="fas fa-minus"></i> Withdraw</a></li>
            <li><a href="/api/customer/applyloan"><i class="fas fa-paper-plane"></i> Apply For Loans</a></li>
        </ul>
    </nav>

    <h1>Accounts for Customers:</h1>
    <table>
        <thead>
            <tr>
                <th>Account ID</th>
                <th>Account Number</th>
                <th>Balance</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Account> accounts = (List<Account>) request.getAttribute("accounts");
                if (accounts != null) {
                    for (Account account : accounts) {
            %>
            <tr>
                <td><%= account.getId() %></td>
                <td><%= account.getAccountNumber() %></td>
                <td><%= account.getBalance() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="3">No accounts found.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <a href="/api/customer/dashboard" class="back-link">Back to Dashboard</a>
</body>
</html>
