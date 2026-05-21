<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Server Error - Expedition 77</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/error.css">
</head>
<body>

    <div class="error-container">
        <div class="error-code">500</div>
        <h1>Something Went Wrong</h1>
        <p>We encountered an unexpected error. Please try again later or contact our support team.</p>
        <div class="error-actions">
            <a href="${pageContext.request.contextPath}/" class="btn-primary">Go to Home</a>
            <a href="${pageContext.request.contextPath}/contact" class="btn-secondary">Contact Support</a>
        </div>
    </div>

</body>
</html>
