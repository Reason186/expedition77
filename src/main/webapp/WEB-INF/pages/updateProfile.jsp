<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Update your Expedition 77 profile — change your name, phone, or password.">
    <title>Update Profile - Expedition 77</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/updateProfile.css">
</head>
<body>
    <header>
        <nav class="navbar" id="profile-nav">
            <a href="${pageContext.request.contextPath}/" class="logo">Expedition <span>77</span></a>
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/treks">Treks</a></li>
                <li><a href="${pageContext.request.contextPath}/find-treks">Find Treks</a></li>
                <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
                <li><a href="${pageContext.request.contextPath}/dashboard" class="active">Profile</a></li>
                <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main class="profile-container" id="profile-main">
        <section class="profile-header">
            <mark class="profile-badge">Account Settings</mark>
            <h1>Update <span class="highlight">Profile</span></h1>
            <p>Edit your personal information below</p>
        </section>

        <c:if test="${not empty profileMessage}">
            <div class="toast ${profileStatus}">${profileMessage}</div>
        </c:if>

        <section class="profile-card" id="profile-form-card">
            <form action="${pageContext.request.contextPath}/update-profile" method="post" class="profile-form" id="profile-form">

                <fieldset>
                    <legend>Personal Information</legend>
                    <div class="input-group">
                        <label for="name">Full Name</label>
                        <input type="text" id="name" name="name" value="${sessionScope.userName}" required>
                    </div>
                    <div class="input-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" value="${sessionScope.userEmail}" readonly>
                    </div>
                    <div class="input-group">
                        <label for="phone">Phone Number</label>
                        <input type="text" id="phone" name="phone" value="${sessionScope.userPhone}" required>
                    </div>
                    <div class="input-group">
                        <label for="profilePic">Profile Picture URL <c:if test="${sessionScope.userRole == 'guide'}"><span style="color: #8b5cf6;">*</span></c:if></label>
                        <input type="url" id="profilePic" name="profilePic" value="${sessionScope.userProfilePic}" <c:if test="${sessionScope.userRole == 'guide'}">required</c:if> placeholder="https://example.com/avatar.jpg">
                    </div>
                </fieldset>

                <fieldset>
                    <legend>Change Password</legend>
                    <div class="input-group">
                        <label for="currentPassword">Current Password</label>
                        <input type="password" id="currentPassword" name="currentPassword" placeholder="Enter current password">
                    </div>
                    <div class="form-row">
                        <div class="input-group">
                            <label for="newPassword">New Password</label>
                            <input type="password" id="newPassword" name="newPassword" placeholder="Leave blank to keep current">
                        </div>
                        <div class="input-group">
                            <label for="confirmPassword">Confirm New Password</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm new password">
                        </div>
                    </div>
                </fieldset>

                <button type="submit" class="submit-btn" id="save-changes">Save Changes</button>
            </form>
        </section>
    </main>

    <footer class="site-footer" id="profile-footer">
        <div class="footer-glow"></div>
        <div class="footer-content">
            <div class="footer-brand">
                <h2 class="footer-logo">Expedition <span>77</span></h2>
                <p>Your gateway to the Himalayas.</p>
            </div>
            <div class="footer-col">
                <h4>Quick Links</h4>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/treks">All Treks</a></li>
                    <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2026 Expedition 77. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
