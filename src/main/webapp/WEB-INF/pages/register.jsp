<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Create your Expedition 77 account to book Himalayan treks and start your adventure.">
    <title>Register - Expedition 77</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/register.css">
</head>
<body>
    <header>
        <nav class="navbar" id="register-nav">
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
                        <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                        <li><a href="${pageContext.request.contextPath}/register" class="btn active">Register</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
    </header>

    <main class="auth-container" id="register-main">
        <section class="auth-box">
            <div class="auth-glow"></div>
            <div class="auth-content">
                <mark class="auth-badge">Join Us</mark>
                <h1>Create Your <span class="highlight">Account</span></h1>
                <p>Start your Himalayan adventure today</p>

                <c:if test="${not empty errorMessage}">
                    <div class="message error" style="color: #ff3333; font-weight: bold; background-color: rgba(239, 68, 68, 0.1); border: 1px solid rgba(239, 68, 68, 0.2); padding: 14px 20px; border-radius: 8px; margin-bottom: 24px;">${errorMessage}</div>
                </c:if>
                <c:if test="${not empty successMessage}">
                    <div class="message success" style="color: #00cc44; font-weight: bold; background-color: rgba(34, 197, 94, 0.1); border: 1px solid rgba(34, 197, 94, 0.2); padding: 14px 20px; border-radius: 8px; margin-bottom: 24px;">${successMessage}</div>
                </c:if>

                <div class="tab-container" style="display: flex; gap: 10px; margin-bottom: 24px; border-bottom: 1px solid var(--border-color); padding-bottom: 12px;">
                    <button type="button" id="tab-trekker" class="tab-btn active" style="flex: 1; padding: 12px; border-radius: var(--radius-sm); font-weight: 700; font-size: 14px; text-align: center; border: 1px solid var(--primary); background: var(--bg-card); color: var(--text-main); cursor: pointer; transition: var(--transition);">Trekker</button>
                    <button type="button" id="tab-guide" class="tab-btn" style="flex: 1; padding: 12px; border-radius: var(--radius-sm); font-weight: 700; font-size: 14px; text-align: center; border: 1px solid var(--border-color); background: transparent; color: var(--text-muted); cursor: pointer; transition: var(--transition);">Guide</button>
                </div>

                <form action="${pageContext.request.contextPath}/register" method="post" id="register-form">
                    <input type="hidden" name="role" id="register-role" value="customer">
                    <fieldset>
                        <legend>Personal Information</legend>
                        <div class="form-group">
                            <label for="fullName">Full Name</label>
                            <input type="text" id="fullName" name="fullName" placeholder="John Doe" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" placeholder="you@example.com" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone Number</label>
                            <input type="text" id="phone" name="phone" placeholder="+977-9800000000" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" placeholder="Create a password" required>
                        </div>
                        <div class="form-group">
                            <label for="profilePic">Profile Picture URL <span id="pic-req-indicator" style="color: #8b5cf6; display: none;">*</span></label>
                            <input type="url" id="profilePic" name="profilePic" placeholder="https://example.com/avatar.jpg">
                        </div>
                    </fieldset>

                    <fieldset id="guide-fields" style="display: none; margin-top: 20px;">
                        <legend>Guide Profile</legend>
                        <div class="form-group">
                            <label for="specialty">Specialty / Preferred Routes</label>
                            <input type="text" id="specialty" name="specialty" placeholder="e.g. Everest Base Camp, Annapurna Circuit">
                        </div>
                        <div class="form-group">
                            <label for="experienceYears">Years of Experience</label>
                            <input type="number" id="experienceYears" name="experienceYears" placeholder="e.g. 5" min="0">
                        </div>
                        <div class="form-group">
                            <label for="bio">Short Biography</label>
                            <textarea id="bio" name="bio" placeholder="Tell trekkers about your experience, languages spoken, and safety training..." rows="3"></textarea>
                        </div>
                    </fieldset>

                    <button type="submit" class="submit-btn" id="register-btn" style="margin-top: 20px;">Register</button>
                </form>

                <div class="auth-links">
                    Already have an account? <a href="${pageContext.request.contextPath}/login">Login here</a>
                </div>
            </div>
        </section>
    </main>

    <footer class="site-footer" id="register-footer">
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
            const tabTrekker = document.getElementById("tab-trekker");
            const tabGuide = document.getElementById("tab-guide");
            const registerRole = document.getElementById("register-role");
            const guideFields = document.getElementById("guide-fields");
            const profilePicInput = document.getElementById("profilePic");
            const picReqIndicator = document.getElementById("pic-req-indicator");
            const emailInput = document.getElementById("email");

            // Restore saved email from localStorage if available
            const savedRegisterEmail = localStorage.getItem("savedRegisterEmail");
            if (savedRegisterEmail) {
                emailInput.value = savedRegisterEmail;
            }

            // Save email on typing
            emailInput.addEventListener("input", function() {
                localStorage.setItem("savedRegisterEmail", emailInput.value);
            });

            tabTrekker.addEventListener("click", function() {
                registerRole.value = "customer";
                tabTrekker.style.background = "var(--bg-card)";
                tabTrekker.style.color = "var(--text-main)";
                tabTrekker.style.borderColor = "var(--primary)";
                tabGuide.style.background = "transparent";
                tabGuide.style.color = "var(--text-muted)";
                tabGuide.style.borderColor = "var(--border-color)";
                guideFields.style.display = "none";
                
                document.getElementById("specialty").removeAttribute("required");
                document.getElementById("experienceYears").removeAttribute("required");
                document.getElementById("bio").removeAttribute("required");
                
                // Profile pic is optional for trekkers
                profilePicInput.removeAttribute("required");
                picReqIndicator.style.display = "none";
            });

            tabGuide.addEventListener("click", function() {
                registerRole.value = "guide";
                tabGuide.style.background = "var(--bg-card)";
                tabGuide.style.color = "var(--text-main)";
                tabGuide.style.borderColor = "var(--primary)";
                tabTrekker.style.background = "transparent";
                tabTrekker.style.color = "var(--text-muted)";
                tabTrekker.style.borderColor = "var(--border-color)";
                guideFields.style.display = "block";
                
                document.getElementById("specialty").setAttribute("required", "required");
                document.getElementById("experienceYears").setAttribute("required", "required");
                document.getElementById("bio").setAttribute("required", "required");
                
                // Profile pic is compulsory for guides
                profilePicInput.setAttribute("required", "required");
                picReqIndicator.style.display = "inline";
            });
        });
    </script>
</body>
</html>