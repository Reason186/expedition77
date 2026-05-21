<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Dedicated Himalayan Marketplace. Find your next epic trek and hire certified Sherpa guides directly at Expedition 77.">
    <title>Find Treks & Guides - Expedition 77</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/findTreks.css">
</head>
<body>

    <header>
        <nav class="navbar" id="find-treks-nav">
            <a href="${pageContext.request.contextPath}/" class="logo">Expedition <span>77</span></a>
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/treks">Treks</a></li>
                <li><a href="${pageContext.request.contextPath}/find-treks" class="active">Find Treks</a></li>
                <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
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

    <main id="marketplace-main">
        <section class="marketplace-hero">
            <div class="hero-glass">
                <h1>Himalayan <span class="highlight">Marketplace</span></h1>
                <p>Hire certified Sherpa guides, discover high-altitude base camps, and plan your ultimate Himalayan expedition all in one place.</p>
            </div>
        </section>

        <section class="marketplace-section" id="treks-container">
            <div class="section-title-bar">
                <h2>Available <span>Treks</span></h2>
                <p class="section-subtitle">Discover handcrafted alpine routes curated for explorers and high-altitude adventurers.</p>
            </div>
            <div class="marketplace-grid">
                <c:choose>
                    <c:when test="${not empty trekList}">
                        <c:forEach var="trek" items="${trekList}">
                            <article class="m-card trek-m-card">
                                <div class="card-img-container">
                                    <img src="${pageContext.request.contextPath}/images/${trek.image}" alt="${trek.name}">
                                    <span class="m-badge duration-badge">${trek.duration} Days</span>
                                </div>
                                <div class="card-body">
                                    <div class="m-meta-row">
                                        <span class="diff-badge ${trek.difficulty}">${trek.difficulty}</span>
                                        <span class="alt-badge">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 19V5M5 12l7-7 7 7"/></svg>
                                            ${trek.maxAltitude}m
                                        </span>
                                    </div>
                                    <h3>${trek.name}</h3>
                                    <p>${trek.shortDescription}</p>
                                    <div class="card-footer">
                                        <span class="m-price">Rs. ${trek.price}</span>
                                        <a href="${pageContext.request.contextPath}/trek-detail?id=${trek.trekId}" class="m-btn-primary">View Details</a>
                                    </div>
                                </div>
                            </article>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-state">
                            <p>No treks are available right now. Please check back later.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>

        <section class="marketplace-section" id="guides-container">
            <div class="section-title-bar">
                <h2>Certified Local <span>Guides</span></h2>
                <p class="section-subtitle">Hire verified peak climb specialists and emergency-trained mountain navigators.</p>
            </div>
            <div class="marketplace-grid">
                <c:choose>
                    <c:when test="${not empty guideList}">
                        <c:forEach var="guide" items="${guideList}">
                            <article class="m-card guide-m-card">
                                <div class="guide-header-block">
                                    <div class="guide-avatar-initials">
                                        ${guide.name.substring(0, 2).toUpperCase()}
                                    </div>
                                    <div class="guide-info-box">
                                        <h3>${guide.name}</h3>
                                        <span class="specialty-tag">${guide.specialty}</span>
                                    </div>
                                </div>
                                <div class="guide-stats-row">
                                    <div class="stat-box">
                                        <span class="stat-number">${guide.experienceYears} Years</span>
                                        <span class="stat-label">Exp</span>
                                    </div>
                                    <div class="stat-box">
                                        <span class="stat-number">${guide.treksCompleted}+</span>
                                        <span class="stat-label">Treks</span>
                                    </div>
                                    <div class="stat-box">
                                        <span class="stat-number">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
                                            ${guide.rating}
                                        </span>
                                        <span class="stat-label">(${guide.reviewCount})</span>
                                    </div>
                                </div>
                                <p class="guide-bio-text">${guide.bio}</p>
                                <div class="guide-footer-block">
                                    <a href="${pageContext.request.contextPath}/contact?guide=${guide.name}" class="m-btn-hire">Hire ${guide.name.split(' ')[0]}</a>
                                </div>
                            </article>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-state">
                            <p>No guides are currently online. Please check back later.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>
    </main>

    <footer class="site-footer" id="find-treks-footer">
        <div class="footer-glow"></div>
        <div class="footer-content">
            <div class="footer-brand">
                <h2 class="footer-logo">Expedition <span>77</span></h2>
                <p>Your gateway to the Himalayas. We connect adventurers with certified local guides for unforgettable experiences.</p>
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
