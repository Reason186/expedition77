<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Browse all available Himalayan treks — filter by difficulty, search by name, and find your perfect adventure with Expedition 77.">
    <title>Treks - Expedition 77</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/treks.css">
</head>
<body>

    <header>
        <nav class="navbar" id="treks-nav">
            <a href="${pageContext.request.contextPath}/" class="logo">Expedition <span>77</span></a>
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/treks" class="active">Treks</a></li>
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

    <main id="treks-main">
        <section class="page-hero" id="treks-hero">
            <h1>Our <span class="highlight">Treks</span></h1>
            <p>Explore our carefully curated trekking routes across the Himalayas</p>
        </section>

        <section class="filter-bar" id="treks-filter">
            <form action="${pageContext.request.contextPath}/treks" method="get" class="filter-form">
                <fieldset class="filter-fields">
                    <div class="filter-group">
                        <label for="difficulty">Difficulty</label>
                        <select id="difficulty" name="difficulty">
                            <option value="">All</option>
                            <option value="Easy" ${param.difficulty == 'Easy' ? 'selected' : ''}>Easy</option>
                            <option value="Moderate" ${param.difficulty == 'Moderate' ? 'selected' : ''}>Moderate</option>
                            <option value="Hard" ${param.difficulty == 'Hard' ? 'selected' : ''}>Hard</option>
                        </select>
                    </div>
                    <div class="filter-group">
                        <label for="searchQuery">Search</label>
                        <input type="text" id="searchQuery" name="search" placeholder="Search treks..." value="${param.search}">
                    </div>
                    <button type="submit" class="filter-btn" id="filter-submit">Filter</button>
                </fieldset>
            </form>
        </section>

        <section class="treks-grid" id="treks-results">
            <c:choose>
                <c:when test="${not empty trekList}">
                    <c:forEach var="trek" items="${trekList}">
                        <article class="trek-card">
                            <figure>
                                <img src="${pageContext.request.contextPath}/images/${trek.image}" alt="${trek.name}" class="trek-img">
                            </figure>
                            <div class="trek-overlay"></div>
                            <span class="trek-badge">${trek.duration} Days</span>
                            <div class="trek-details">
                                <div class="trek-meta">
                                    <span class="difficulty ${trek.difficulty}">${trek.difficulty}</span>
                                    <span class="altitude">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 19V5M5 12l7-7 7 7"/></svg>
                                        ${trek.maxAltitude}m
                                    </span>
                                </div>
                                <h3>${trek.name}</h3>
                                <p>${trek.shortDescription}</p>
                                <div class="trek-price">Rs. ${trek.price}</div>
                                <a href="${pageContext.request.contextPath}/trek-detail?id=${trek.trekId}" class="view-btn" id="trek-${trek.trekId}">View Details</a>
                            </div>
                        </article>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="no-results">
                        <h3>No treks found</h3>
                        <p>Try adjusting your filters or check back later.</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </section>
    </main>

    <footer class="site-footer" id="treks-footer">
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
