<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f4f6f9;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .container {
        background: #fff;
        padding: 30px;
        border-radius: 10px;
        width: 320px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    input {
        width: 100%;
        padding: 10px;
        margin: 8px 0;
        border: 1px solid #ccc;
        border-radius: 6px;
        box-sizing: border-box;
    }

    button {
        width: 100%;
        padding: 10px;
        background: #2d89ef;
        color: white;
        border: none;
        border-radius: 6px;
        cursor: pointer;
    }

    button:hover {
        background: #1b5fbd;
    }

    .link {
        text-align: center;
        margin-top: 10px;
    }

    a {
        text-decoration: none;
        color: #2d89ef;
    }

    .message {
        text-align: center;
        color: green;
        margin-bottom: 15px;
        font-size: 14px;
    }
</style>
</head>

<body>

<div class="container">
    <h2>Register</h2>
    
    <c:if test="${not empty message}">
        <p style="color: red; text-align: center;">
            ${message}
        </p>
    </c:if>

    <form action="${pageContext.request.contextPath }/register" method="post">
        <input type="text" name="fullName" placeholder="Full Name" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="text" name="phone" placeholder="Phone" required>
        <input type="password" name="password" placeholder="Password" required>

        <button type="submit">Register</button>
    </form>

    <div class="link">
        Already have an account? <a href="${pageContext.request.contextPath }/login">Login</a>
    </div>
</div>

</body>
</html>