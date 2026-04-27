<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Contact Expedition 77 — reach out for trek inquiries, booking help, or general questions.">
    <title>Contact Us - Expedition 77</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/contact.css">
</head>
<body>
    <header>
        <nav class="navbar" id="contact-nav">
            <a href="${pageContext.request.contextPath}/" class="logo">Expedition <span>77</span></a>
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/treks">Treks</a></li>
                <li><a href="${pageContext.request.contextPath}/find-treks">Find Treks</a></li>
                <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/contact" class="active">Contact</a></li>
                <c:choose>
                    <c:when test="${not empty sessionScope.userName}">
                        <li><a href="${pageContext.request.contextPath}/dashboard">Profile</a></li>
                        <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                        <li><a href="${pageContext.request.contextPath}/register" class="btn">Register</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
    </header>

    <main id="contact-main">
        <section class="page-hero" id="contact-hero">
            <h1>Contact <span class="highlight">Us</span></h1>
            <p>Have a question or need help planning your trek? Reach out to us.</p>
        </section>

        <section class="contact-wrapper" id="contact-content">
            <aside class="contact-info-section" id="contact-info">
                <article class="info-card">
                    <div class="info-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
                    </div>
                    <h3>Email Us</h3>
                    <p>info@expedition77.com</p>
                </article>
                <article class="info-card">
                    <div class="info-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path></svg>
                    </div>
                    <h3>Call Us</h3>
                    <p>+977-01-4444555</p>
                </article>
                <article class="info-card">
                    <div class="info-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
                    </div>
                    <h3>Visit Us</h3>
                    <address>Thamel, Kathmandu, Nepal</address>
                </article>
                <article class="info-card">
                    <div class="info-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                    </div>
                    <h3>Working Hours</h3>
                    <p>Mon - Sat: 9:00 AM - 6:00 PM</p>
                </article>
            </aside>

            <section class="contact-form-section" id="contact-form-section">
                <h2>Send Us a Message</h2>

                <c:if test="${not empty contactMessage}">
                    <div class="toast ${contactStatus}">${contactMessage}</div>
                </c:if>

                <form action="${pageContext.request.contextPath}/contact" method="post" class="contact-form" id="contact-form">
                    <fieldset>
                        <legend>Your Details</legend>
                        <div class="form-row">
                            <div class="input-group">
                                <label for="contactName">Full Name</label>
                                <input type="text" id="contactName" name="name" placeholder="Your name" required>
                            </div>
                            <div class="input-group">
                                <label for="contactEmail">Email</label>
                                <input type="email" id="contactEmail" name="email" placeholder="you@example.com" required>
                            </div>
                        </div>
                    </fieldset>

                    <fieldset>
                        <legend>Your Message</legend>
                        <div class="input-group">
                            <label for="contactSubject">Subject</label>
                            <input type="text" id="contactSubject" name="subject" placeholder="What is this about?" required>
                        </div>
                        <div class="input-group">
                            <label for="contactMessage">Message</label>
                            <textarea id="contactMessage" name="message" rows="5" placeholder="Write your message here..." required></textarea>
                        </div>
                    </fieldset>

                    <button type="submit" class="submit-btn" id="send-message">Send Message</button>
                </form>
            </section>
        </section>
    </main>

    <footer class="site-footer" id="contact-footer">
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
