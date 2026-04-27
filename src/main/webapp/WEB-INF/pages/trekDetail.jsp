<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="${trek.name} — ${trek.shortDescription}. Book your Himalayan adventure with Expedition 77.">
    <title>${trek.name} - Expedition 77</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/trekDetail.css">
    <style>
        .trek-gallery-section {
            position: relative;
            height: 60vh;
            min-height: 450px;
            overflow: hidden;
            background: #080a10;
        }
        .trek-gallery-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 8px;
            height: 100%;
            width: 100%;
            padding: 4px;
        }
        .gallery-item {
            position: relative;
            overflow: hidden;
            height: 100%;
        }
        .gallery-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.6s cubic-bezier(0.16, 1, 0.3, 1);
        }
        .gallery-item:hover img {
            transform: scale(1.03);
        }
        .gallery-side-column {
            display: grid;
            grid-template-rows: 1fr 1fr;
            gap: 8px;
            height: 100%;
        }
        .gallery-overlay-gradient {
            position: absolute;
            inset: 0;
            background: linear-gradient(to bottom, rgba(8, 10, 16, 0.1) 0%, rgba(8, 10, 16, 0.4) 50%, rgba(8, 10, 16, 0.95) 100%);
            pointer-events: none;
            z-index: 1;
        }
        .hero-content-overlay {
            position: absolute;
            bottom: 40px;
            left: 0;
            right: 0;
            z-index: 2;
            pointer-events: none;
        }
        .hero-content-inner {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 48px;
            pointer-events: auto;
        }
        @media (max-width: 768px) {
            .trek-gallery-grid {
                grid-template-columns: 1fr;
            }
            .gallery-side-column {
                display: none;
            }
            .trek-gallery-section {
                height: 40vh;
                min-height: 300px;
            }
            .hero-content-inner {
                padding: 0 24px;
            }
        }
    </style>
</head>
<body>

    <header>
        <nav class="navbar" id="detail-nav">
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
                        <li><a href="${pageContext.request.contextPath}/register" class="btn">Register</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
    </header>

    <c:if test="${not empty trek}">

    <main id="trek-detail-main">
        <section class="trek-hero" id="trek-hero">
            <figure class="hero-figure">
                <img src="${pageContext.request.contextPath}/images/${trek.image}" alt="${trek.name}" class="hero-bg">
            </figure>
            <div class="hero-overlay"></div>
            <div class="hero-content">
                <mark class="difficulty-badge ${trek.difficulty}">${trek.difficulty}</mark>
                <h1>${trek.name}</h1>
                <p>${trek.shortDescription}</p>
            </div>
        </section>

        <section class="detail-container" id="trek-info">
            <div class="detail-main">
                <article class="detail-section">
                    <h2>About This Trek</h2>
                    <p>${trek.longDescription}</p>
                </article>

                <article class="detail-section">
                    <h2>Highlights</h2>
                    <ul class="highlights-list">
                        <c:forEach var="highlight" items="${trek.highlights}">
                            <li>${highlight}</li>
                        </c:forEach>
                    </ul>
                </article>

                <article class="detail-section">
                    <h2>Itinerary</h2>
                    <div class="itinerary">
                        <c:forEach var="day" items="${trek.itinerary}" varStatus="status">
                            <details class="itinerary-item" open>
                                <summary>
                                    <time class="day-number">Day ${status.index + 1}</time>
                                </summary>
                                <div class="day-info">
                                    <h4>${day}</h4>
                                </div>
                            </details>
                        </c:forEach>
                    </div>
                </article>
            </div>

            <aside class="detail-sidebar" id="trek-sidebar">
                <div class="price-card">
                    <h3>Trek Details</h3>
                    <div class="info-row">
                        <span class="info-label">Duration</span>
                        <span class="info-value">${trek.duration} Days</span>
                    </div>
                    <div class="info-row">
                        <span class="info-label">Max Altitude</span>
                        <span class="info-value">${trek.maxAltitude}m</span>
                    </div>
                    <div class="info-row">
                        <span class="info-label">Difficulty</span>
                        <span class="info-value">${trek.difficulty}</span>
                    </div>
                    <div class="info-row">
                        <span class="info-label">Group Size</span>
                        <span class="info-value">${trek.groupSize}</span>
                    </div>
                    <div class="price-display">
                        <span class="price-label">Price Per Person</span>
                        <span class="price-amount">Rs. ${trek.price}</span>
                    </div>
                    <c:choose>
                        <c:when test="${not empty sessionScope.userName}">
                            <a href="${pageContext.request.contextPath}/booking?trekId=${trek.trekId}" class="book-btn" id="book-now">Book Now</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/login" class="book-btn" id="login-to-book">Login to Book</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </aside>
        </section>
    </main>

    </c:if>

    <c:if test="${empty trek}">
        <main class="not-found" id="trek-not-found">
            <h2>Trek Not Found</h2>
            <p>The trek you are looking for does not exist.</p>
            <a href="${pageContext.request.contextPath}/treks" class="back-link">Browse All Treks</a>
        </main>
    </c:if>

    <footer class="site-footer" id="detail-footer">
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
            <div class="footer-col">
                <h4>Contact</h4>
                <address>
                    <ul class="footer-contact-list">
                        <li>
                            <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="20" height="16" x="2" y="4" rx="2"/><path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/></svg>
                            info@expedition77.com
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

</body>
</html>
