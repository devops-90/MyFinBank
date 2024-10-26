<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ page import="com.myfinbank.customer.dto.AccountDTO" %> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard - MyFinBank</title>
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

        .logout-button {
            background: none;
            border: none;
            color: white;
            cursor: pointer;
            font-size: 16px;
        }

        h1 {
            text-align: center;
            margin-top: 30px;
            color: #004d99;
        }

        .action-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
            gap: 20px;
            padding: 20px;
            max-width: 800px;
            margin: auto;
        }

        .action-list a {
            background-color: #0066cc;
            color: white;
            padding: 20px;
            border-radius: 8px;
            text-decoration: none;
            text-align: center;
            transition: background-color 0.3s, transform 0.3s;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            font-size: 16px;
        }

        .action-list a:hover {
            background-color: #005bb5;
            transform: translateY(-3px);
        }

        .action-list i {
            display: block;
            font-size: 24px;
            margin-bottom: 10px;
        }

        /* Modal Styles */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; 
            z-index: 1; 
            left: 0;
            top: 0;
            width: 100%; 
            height: 100%; 
            overflow: auto; 
            background-color: rgba(0,0,0,0.4); 
            padding-top: 60px; 
        }

        .modal-content {
            background-color: #fff;
            margin: 5% auto; 
            padding: 20px;
            border: 1px solid #888;
            width: 80%; 
            max-width: 600px; 
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .support-form label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .support-form input[type="text"], 
        .support-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            transition: border-color 0.3s;
        }

        .support-form input[type="text"]:focus, 
        .support-form textarea:focus {
            border-color: #004d99;
            outline: none;
        }

        .support-form button {
            width: 100%;
            padding: 10px;
            background-color: #0066cc;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .support-form button:hover {
            background-color: #005bb5;
        }

        @media (max-width: 600px) {
            nav ul {
                flex-direction: column;
                align-items: center;
            }
            nav ul li {
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
    <nav>
        <div>
            <h2 style="margin: 0;">MyFinBank</h2>
        </div>
        <ul>
            <li><a href="/api/customer/dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="/api/customer/accounts"><i class="fas fa-wallet"></i> Account Details</a></li>
            <li>
                <form action="/api/customer/logout" method="POST" style="display: inline;">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    <button type="submit" class="logout-button">Logout</button>
                </form>
            </li>
        </ul>
    </nav>

    <h1>Welcome to Your Dashboard</h1>
    <div class="action-list">
        <a href="/api/customer/accounts"><i class="fas fa-eye"></i> View Account Details</a>
        <a href="/api/customer/deposit"><i class="fas fa-plus"></i> Deposit Funds</a>
        <a href="/api/customer/withdraw"><i class="fas fa-minus"></i> Withdraw Funds</a>
        <a href="/api/customer/transfer"><i class="fas fa-exchange-alt"></i> Transfer Funds</a>
        <a href="/api/customer/transactions"><i class="fas fa-history"></i> View Transactions</a>
        <a href="/api/customer/calculate-emi"><i class="fas fa-calculator"></i> Calculate Loan EMI</a>
        <a href="/api/customer/applyLoan"><i class="fas fa-paper-plane"></i> Apply for Loan</a>
        <a href="/api/customer/investments/invest"><i class="fas fa-dollar-sign"></i> Invest</a>
        <a href="/api/customer/investments/investment"><i class="fas fa-list"></i> View Investments</a>
        <a href="#" id="supportLink"><i class="fas fa-headset"></i> Customer Support</a>
    </div>

    <!-- Customer Support Modal -->
    <div id="supportModal" class="modal">
        <div class="modal-content">
            <span class="close" id="closeModal">&times;</span>
            <h2>Customer Support</h2>
            <form action="/api/customer/support" method="POST" class="support-form">
                <label for="name">Your Name:</label>
                <input type="text" id="name" name="name" required>

                <label for="email">Your Email:</label>
                <input type="text" id="email" name="email" required>

                <label for="message">Your Message:</label>
                <textarea id="message" name="message" rows="4" required></textarea>

                <button type="submit">Submit</button>
            </form>
        </div>
    </div>

    <script>
        // Get the modal
        var modal = document.getElementById("supportModal");

        // Get the button that opens the modal
        var btn = document.getElementById("supportLink");

        // Get the <span> element that closes the modal
        var span = document.getElementById("closeModal");

        // When the user clicks on the button, open the modal
        btn.onclick = function() {
            modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
</body>
</html>
