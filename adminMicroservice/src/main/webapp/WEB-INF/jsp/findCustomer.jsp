<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Find Customer</title>
</head>
<body>
    <h1>Find Customer</h1>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>
    <form action="${pageContext.request.contextPath}/api/admin/customers/details" method="get">
        <label for="customerId">Customer ID:</label>
        <input type="text" id="customerId" name="id" required>
        <button type="submit">Find</button>
    </form>
</body>
</html>