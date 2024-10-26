<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Account Detail</title>
</head>
<body>
<h1>Account Detail</h1>

<p><strong>Account ID:</strong> ${account.id}</p>
<p><strong>Account Number:</strong> ${account.accountNumber}</p>
<p><strong>Balance:</strong> ${account.balance}</p>

<a href="/api/admin/accounts">Back to Account List</a>
</body>
</html>
