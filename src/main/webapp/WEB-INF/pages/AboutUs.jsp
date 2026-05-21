<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Learn about Expedition 77 — our mission, vision, and the team behind Nepal's premier trekking platform.">
    <title>About Us - Expedition 77</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/AboutUs.css">
</head>
<body>

    <header>
        <nav class="navbar" id="about-nav">
            <a href="${pageContext.request.contextPath}/" class="logo">Expedition <span>77</span></a>
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/treks">Treks</a></li>
                <li><a href="${pageContext.request.contextPath}/find-treks">Find Treks</a></li>
                <li><a href="${pageContext.request.contextPath}/about" class="active">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
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

    <main id="about-main">
        <section class="page-hero" id="about-hero">
            <h1>About <span class="highlight">Expedition 77</span></h1>
            <p>Connecting customers with experiences that matter. Built with passion, driven by purpose.</p>
        </section>

        <section class="about-section" id="who-we-are">
            <div class="container">
                <h2 class="section-title">Who We Are</h2>
                <article class="card description-card">
                    <p>
                        Expedition is a full-stack web application designed to streamline customer management
                        and deliver a seamless experience for both administrators and users. Built on a robust
                        Java backend with JSP front-end pages, our platform provides a secure, fast, and
                        intuitive interface for managing expeditions and customer interactions.
                    </p>
                    <p>
                        From user registration and login to admin panel controls, every feature is crafted
                        to ensure reliability and ease of use.
                    </p>
                </article>
            </div>
        </section>

        <section class="about-section" id="mission-vision">
            <div class="container">
                <h2 class="section-title">Mission &amp; Vision</h2>
                <div class="mv-grid">
                    <article class="card mv-card">
                        <div class="mv-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><circle cx="12" cy="12" r="6"></circle><circle cx="12" cy="12" r="2"></circle></svg>
                        </div>
                        <h3>Our Mission</h3>
                        <p>To provide a reliable and efficient platform that connects people with meaningful expedition experiences, backed by clean technology and great user experience.</p>
                    </article>
                    <article class="card mv-card">
                        <div class="mv-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                        </div>
                        <h3>Our Vision</h3>
                        <p>To become the go-to platform for expedition management — scalable, secure, and user-centric — serving customers and administrators with equal excellence.</p>
                    </article>
                </div>
            </div>
        </section>

        <section class="about-section" id="our-team">
            <div class="container">
                <h2 class="section-title">Meet the Team</h2>
                <div class="team-grid">
                    <article class="card team-card">
                        <div class="avatar">R</div>
                        <h3>Reason Pokhrel</h3>
                        <mark class="role">Lead Developer</mark>
                        <p>Architected the backend, database layer, and full project structure using Java, JSP and MVC patterns.</p>
                    </article>
                    <article class="card team-card">
                        <div class="avatar">K</div>
                        <h3>Kaushubh Kr. Chaudhary</h3>
                        <mark class="role">Frontend Developer</mark>
                        <p>Designed and implemented the UI/UX across all pages, ensuring a consistent and clean user experience.</p>
                    </article>
                    <article class="card team-card">
                        <div class="avatar">M</div>
                        <h3>Maulik Joshi</h3>
                        <mark class="role">Database Admin</mark>
                        <p>Managed the database schema, queries, and DAO layer to ensure efficient and secure data operations.</p>
                    </article>
                    <article class="card team-card">
                        <div class="avatar">B</div>
                        <h3>Bheshraj Upreti</h3>
                        <mark class="role">Database Admin</mark>
                        <p>Managed the database schema, queries, and DAO layer to ensure efficient and secure data operations.</p>
                    </article>
                    <article class="card team-card">
                        <div class="avatar">S</div>
                        <h3>Sudam Tiruwa</h3>
                        <mark class="role">Database Admin</mark>
                        <p>Managed the database schema, queries, and DAO layer to ensure efficient and secure data operations.</p>
                    </article>
                </div>
            </div>
        </section>

        <section class="about-section" id="get-in-touch">
            <div class="container">
                <h2 class="section-title">Get In Touch</h2>
                <article class="card contact-card">
                    <address class="contact-grid">
                        <div class="contact-item">
                            <span class="contact-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
                            </span>
                            <div>
                                <strong>Email</strong>
                                <p>contact@expedition.com</p>
                            </div>
                        </div>
                        <div class="contact-item">
                            <span class="contact-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
                            </span>
                            <div>
                                <strong>Location</strong>
                                <p>Kathmandu, Nepal</p>
                            </div>
                        </div>
                        <div class="contact-item">
                            <span class="contact-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path></svg>
                            </span>
                            <div>
                                <strong>Phone</strong>
                                <p>+977 9862310987</p>
                            </div>
                        </div>
                    </address>
                </article>
            </div>
        </section>
    </main>

    <footer class="site-footer" id="about-footer">
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