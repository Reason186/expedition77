<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Expedition</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/aboutUs.css">
</head>
<body>

    <nav class="navbar">
        <div class="nav-brand">&#9650; Expedition</div>
        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/home.jsp">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/pages/AboutUs.jsp" class="active">About Us</a></li>
            <li><a href="${pageContext.request.contextPath}/pages/login.jsp">Login</a></li>
            <li><a href="${pageContext.request.contextPath}/pages/register.jsp">Register</a></li>
        </ul>
    </nav>

    <section class="hero">
        <div class="hero-content">
            <h1>About <span class="highlight">Expedition</span></h1>
            <p>Connecting customers with experiences that matter. Built with passion, driven by purpose.</p>
        </div>
    </section>

    <section class="section" id="about">
        <div class="container">
            <h2 class="section-title">Who We Are</h2>
            <div class="card description-card">
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
            </div>
        </div>
    </section>

    <section class="section" id="mission">
        <div class="container">
            <h2 class="section-title">Mission &amp; Vision</h2>
            <div class="mv-grid">
                <div class="card mv-card">
                    <div class="mv-icon">&#127919;</div>
                    <h3>Our Mission</h3>
                    <p>To provide a reliable and efficient platform that connects people with meaningful expedition experiences, backed by clean technology and great user experience.</p>
                </div>
                <div class="card mv-card">
                    <div class="mv-icon">&#128301;</div>
                    <h3>Our Vision</h3>
                    <p>To become the go-to platform for expedition management â€” scalable, secure, and user-centric â€” serving customers and administrators with equal excellence.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- TEAM MEMBERS -->
    <section class="section" id="team">
        <div class="container">
            <h2 class="section-title">Meet the Team</h2>
            <div class="team-grid">

                <div class="card team-card">
                    <div class="avatar">S</div>
                    <h3>Reason Pokhrel</h3>
                    <span class="role">Lead Developer</span>
                    <p>Architected the backend, database layer, and full project structure using Java, JSP and MVC patterns.</p>
                </div>

                <div class="card team-card">
                    <div class="avatar">T</div>
                    <h3>Kaushubh Kr. Chaudhary</h3>
                    <span class="role">Frontend Developer</span>
                    <p>Designed and implemented the UI/UX across all pages, ensuring a consistent and clean user experience.</p>
                </div>

                <div class="card team-card">
                    <div class="avatar">T</div>
                    <h3>Maulik Joshi</h3>
                    <span class="role">Database Admin</span>
                    <p>Managed the database schema, queries, and DAO layer to ensure efficient and secure data operations.</p>
                </div>
                
                <div class="card team-card">
                    <div class="avatar">T</div>
                    <h3>Bheshraj Upreti</h3>
                    <span class="role">Database Admin</span>
                    <p>Managed the database schema, queries, and DAO layer to ensure efficient and secure data operations.</p>
                </div>
                
                <div class="card team-card">
                    <div class="avatar">T</div>
                    <h3>Sudam Tiruwa</h3>
                    <span class="role">Database Admin</span>
                    <p>Managed the database schema, queries, and DAO layer to ensure efficient and secure data operations.</p>
                </div>

            </div>
        </div>
    </section>

    <section class="section" id="contact">
        <div class="container">
            <h2 class="section-title">Get In Touch</h2>
            <div class="card contact-card">
                <div class="contact-grid">
                    <div class="contact-item">
                        <span class="contact-icon">&#128231;</span>
                        <div>
                            <strong>Email</strong>
                            <p>contact@expedition.com</p>
                        </div>
                    </div>
                    <div class="contact-item">
                        <span class="contact-icon">&#128205;</span>
                        <div>
                            <strong>Location</strong>
                            <p>Kathmandu, Nepal</p>
                        </div>
                    </div>
                    <div class="contact-item">
                        <span class="contact-icon">&#128222;</span>
                        <div>
                            <strong>Phone</strong>
                            <p>+977 9862310987</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="footer">
        <p>&copy; 2026 Expedition. All rights reserved.</p>
    </footer>

</body>
</html>