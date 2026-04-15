<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Expedition 77 | Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/home.css">
</head>
<body>
<body style="background-image: url('${pageContext.request.contextPath}/images/bg.png');">

<div class="overlay">

    <div class="navbar">
        <h2>Expedition 77</h2>
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/login">Login</a>
            <a href="${pageContext.request.contextPath}/register" class="btn">Register</a>
        </div>
    </div>

    <div class="hero">

        <h1>Its A Big World Out There.</h1>
        <h2>Go Explore</h2>

        <p class="tagline">
            Discover trekking routes, hire expert guides, and begin your adventure journey.
        </p>

        <div class="buttons">
            <a href="${pageContext.request.contextPath}/register" class="primary">Get Started</a>
            <a href="${pageContext.request.contextPath}/login" class="secondary">Login</a>
        </div>

    </div>

</div>

</body>
</html>