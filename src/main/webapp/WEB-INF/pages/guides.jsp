<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Expedition 77 | Our Guides</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/guides.css">
</head>
<body>
<div class="overlay">

    <div class="navbar">
        <h2 class="logo">Expedition <span>77</span></h2>
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/">Home</a>
            <a href="${pageContext.request.contextPath}/login">Login</a>
            <a href="${pageContext.request.contextPath}/register" class="btn">Register</a>
        </div>
    </div>

    <div class="guide-hero">
        <span class="section-tag">Certified Professionals</span>
        <h1>Meet Our <span>Expert</span> Guides</h1>
        <p class="guide-hero-sub">
            Our guides are born and raised in the Himalayas. They know every trail,
            every village, and every sunrise point. Your safety and experience is their life's work.
        </p>
    </div>

    <div class="guide-stats">
        <div class="stat-box">
            <b class="stat-number">25+</b>
            <span class="stat-label">Active Guides</span>
        </div>
        <div class="stat-box">
            <b class="stat-number">1,200+</b>
            <span class="stat-label">Treks Completed</span>
        </div>
        <div class="stat-box">
            <b class="stat-number">15+</b>
            <span class="stat-label">Years Active</span>
        </div>
        <div class="stat-box">
            <b class="stat-number">4.9</b>
            <span class="stat-label">Avg Rating</span>
        </div>
    </div>

    <div class="guides-section">
        <span class="section-tag">Our Team</span>
        <h2 class="section-title">Featured Guides</h2>
        <p class="section-sub">Hand-picked leaders for your Himalayan journey</p>

        <div class="guide-grid">

            <c:forEach var="guide" items="${guideList}">
                <div class="guide-card">
                    <div class="card-glow"></div>
                    <div class="card-body">
                        <div class="guide-photo-wrap">
                            <img src="${guide.photoUrl}"
                                 class="guide-photo" alt="${guide.name}">
                            <div class="photo-ring"></div>
                        </div>
                        <h3>${guide.name}</h3>
                        <span class="guide-specialty specialty-default">${guide.specialty}</span>
                        <p class="guide-bio">${guide.bio}</p>
                        <div class="guide-chips">
                            <span class="chip"><b>${guide.experienceYears}</b> Years</span>
                            <span class="chip"><b>${guide.treksCompleted}+</b> Treks</span>
                        </div>
                        <div class="guide-stars">
                            &#9733;&#9733;&#9733;&#9733;&#9733;
                            <span>${guide.rating} (${guide.reviewCount} reviews)</span>
                        </div>
                        <a href="${pageContext.request.contextPath}/login" class="hire-btn">Book This Guide</a>
                    </div>
                </div>
            </c:forEach>

            <c:if test="${empty guideList}">
                <div class="no-guides">
                    <p>No guides available right now. Check back soon!</p>
                </div>
            </c:if>

        </div>
    </div>

    <div class="why-section">
        <span class="section-tag">Why Us</span>
        <h2 class="section-title">Why Choose Our Guides</h2>
        <p class="section-sub">Every guide is handpicked, trained, and certified</p>

        <div class="why-grid">
            <div class="why-box">
                <span class="why-icon">&#9968;</span>
                <h3>Born in the Mountains</h3>
                <p>Our guides grew up in these valleys. They know the terrain, the weather, and the hidden paths.</p>
            </div>
            <div class="why-box">
                <span class="why-icon">&#9989;</span>
                <h3>Fully Certified</h3>
                <p>Every guide holds NMA certification with wilderness first aid and rescue training.</p>
            </div>
            <div class="why-box">
                <span class="why-icon">&#9889;</span>
                <h3>Safety First</h3>
                <p>Satellite phones, oxygen kits, and emergency evacuation plans on every single trek.</p>
            </div>
            <div class="why-box">
                <span class="why-icon">&#10084;</span>
                <h3>Personal Connection</h3>
                <p>Small group sizes mean your guide becomes a friend, not just a leader on the trail.</p>
            </div>
        </div>
    </div>

    <div class="cta-banner">
        <h2>Ready to Start Your Journey?</h2>
        <p>Register now and book your preferred guide before the trekking season fills up.</p>
        <a href="${pageContext.request.contextPath}/register">Create Free Account</a>
    </div>

</div>

<footer class="footer">
    <div class="footer-glow"></div>
    <div class="footer-content">

        <div class="footer-brand">
            <h2 class="footer-logo">Expedition <span>77</span></h2>
            <p>Your gateway to the Himalayas. We connect adventurers with certified local guides for unforgettable trekking experiences across Nepal.</p>
        </div>

        <div class="footer-col">
            <h4>Quick Links</h4>
            <ul>
                <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
                <li><a href="${pageContext.request.contextPath}/guides">Our Guides</a></li>
            </ul>
        </div>

        <div class="footer-col">
            <h4>Popular Treks</h4>
            <ul>
                <li><a href="#">Everest Base Camp</a></li>
                <li><a href="#">Annapurna Circuit</a></li>
                <li><a href="#">Langtang Valley</a></li>
                <li><a href="#">Upper Mustang</a></li>
            </ul>
        </div>

        <div class="footer-col footer-contact">
            <h4>Contact Us</h4>
            <ul class="contact-list">
                <li>Thamel, Kathmandu, Nepal</li>
                <li>+977-01-4444555</li>
                <li>info@expedition77.com</li>
            </ul>
        </div>

    </div>

    <div class="footer-bottom">
        <p>&copy; 2025 Expedition 77. All rights reserved. Made with &#10084; in Nepal.</p>
    </div>
</footer>

</body>
</html>
