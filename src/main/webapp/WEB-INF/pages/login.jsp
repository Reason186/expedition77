<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <!-- Link external CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/styles/login.css">
</head>

<body>

    <div class="container">

        <div class="card">

            <!-- Title -->
            <h2 class="title">
                Welcome to Expedition77
            </h2>

            <!-- Form -->
            <form class= "form" action="${pageContext.request.contextPath }/login" method="post">

                <!-- Email -->
                <div class="input-group">
                    <label>Email</label>
                    <input type="email" placeholder="you@example.com">
                </div>

                <!-- Password -->
                <div class="input-group">
                    <label>Password</label>
                    <input type="password" placeholder="••••••••">
                </div>

                <!-- Forgot Password -->
                <div class="forgot">
                    <a href="#">Forgot password?</a>
                </div>

                <!-- Submit -->
                <button type="submit" class="btn">
                    Login
                </button>

            </form>

            <!-- Divider -->
            <div class="divider">
                <div></div>
                <span>OR</span>
                <div></div>
            </div>

            <!-- Create Account -->
            <p class="footer-text">
                Don’t have an account?
                <a href="${pageContext.request.contextPath }/register">Create one</a>
            </p>

        </div>

    </div>

</body>
</html>