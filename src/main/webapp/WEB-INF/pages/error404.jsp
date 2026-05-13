<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Not Found - Expedition 77</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/error.css">
</head>
<body>

    <div class="error-container">
        <div class="error-code">404</div>
        <h1>Page Not Found</h1>
        <p>Sorry, the page you are looking for does not exist or has been moved.</p>
        <div class="error-actions">
            <a href="${pageContext.request.contextPath}/" class="btn-primary">Go to Home</a>
            <a href="${pageContext.request.contextPath}/contact" class="btn-secondary">Contact Support</a>
        </div>
    </div>

</body>
</html>
