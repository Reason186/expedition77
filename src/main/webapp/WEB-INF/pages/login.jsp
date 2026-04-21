<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Login to your Expedition 77 account to manage bookings and explore Himalayan treks.">
    <title>Login - Expedition 77</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/login.css">
</head>
<body>
    <header>
        <nav class="navbar" id="login-nav">
            <a href="${pageContext.request.contextPath}/" class="logo">Expedition <span>77</span></a>
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/treks">Treks</a></li>
                <li><a href="${pageContext.request.contextPath}/find-treks">Find Treks</a></li>
                <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
                <c:choose>
                    <c:when test="${not empty sessionScope.userName}">
                        <li><a href="${pageContext.request.contextPath}/dashboard">Profile</a></li>
                        <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="${pageContext.request.contextPath}/login" class="active">Login</a></li>
                        <li><a href="${pageContext.request.contextPath}/register" class="btn">Register</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
    </header>

    <main class="auth-container" id="login-main">
        <section class="auth-box">
            <div class="auth-glow"></div>
            <div class="auth-content">
                <mark class="auth-badge">Welcome Back</mark>
                <h1>Sign In to <span class="highlight">Expedition 77</span></h1>
                <p>Enter your credentials to access your account</p>

                <c:if test="${not empty errorMessage}">
                    <div class="message error" style="color: #ff3333; font-weight: bold; background-color: rgba(239, 68, 68, 0.1); border: 1px solid rgba(239, 68, 68, 0.2); padding: 14px 20px; border-radius: 8px; margin-bottom: 24px;">${errorMessage}</div>
                </c:if>
                <c:if test="${not empty successMessage}">
                    <div class="message success" style="color: #00cc44; font-weight: bold; background-color: rgba(34, 197, 94, 0.1); border: 1px solid rgba(34, 197, 94, 0.2); padding: 14px 20px; border-radius: 8px; margin-bottom: 24px;">${successMessage}</div>
                </c:if>

                <form action="${pageContext.request.contextPath}/login" method="post" id="login-form">
                    <fieldset>
                        <legend>Account Details</legend>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" placeholder="you@example.com" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" placeholder="Enter your password" required>
                        </div>
                    </fieldset>
                    <button type="submit" class="submit-btn" id="login-btn">Login</button>
                </form>

                <div class="auth-links">
                    Don't have an account? <a href="${pageContext.request.contextPath}/register">Create one</a>
                </div>
            </div>
        </section>
    </main>

    <footer class="site-footer" id="login-footer">
        <div class="footer-glow"></div>
        <div class="footer-content">
            <div class="footer-brand">
                <h2 class="footer-logo">Expedition <span>77</span></h2>
                <p>Your gateway to the Himalayas. We connect adventurers with certified local guides for unforgettable trekking experiences across Nepal.</p>
            </div>
            <div class="footer-col">
                <h4>Quick Links</h4>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/treks">All Treks</a></li>
                    <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h4>Popular Treks</h4>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/trek-detail?id=1">Everest Base Camp</a></li>
                    <li><a href="${pageContext.request.contextPath}/trek-detail?id=2">Annapurna Circuit</a></li>
                    <li><a href="${pageContext.request.contextPath}/trek-detail?id=3">Langtang Valley</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h4>Contact</h4>
                <address>
                    <ul class="footer-contact-list">
                        <li>
                            <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="20" height="16" x="2" y="4" rx="2"/><path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/></svg>
                            info@expedition77.com
                        </li>
                        <li>
                            <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"/><circle cx="12" cy="10" r="3"/></svg>
                            Thamel, Kathmandu, Nepal
                        </li>
                    </ul>
                </address>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2026 Expedition 77. All rights reserved.</p>
            <div class="footer-bottom-links">
                <a href="${pageContext.request.contextPath}/about">Privacy Policy</a>
                <a href="${pageContext.request.contextPath}/about">Terms of Service</a>
            </div>
        </div>
    </footer>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const emailInput = document.getElementById("email");
            const loginForm = document.getElementById("login-form");
            
            // Restore saved email from localStorage if available
            const savedEmail = localStorage.getItem("savedEmail");
            if (savedEmail) {
                emailInput.value = savedEmail;
            }
            
            // Save email on typing
            emailInput.addEventListener("input", function() {
                localStorage.setItem("savedEmail", emailInput.value);
            });
            
            // Clear saved email on successful form submit
            loginForm.addEventListener("submit", function() {
                // We can either clear or keep it. Let's keep it saved for typing but clear it to allow other log-ins after a real submit if needed,
                // or just keep it so it doesn't get lost. The user wants "save when i type and refresh".
                // Let's keep it so it persists. We don't delete on submit so they don't lose it if submit fails due to invalid password.
            });
        });
    </script>
</body>
</html>