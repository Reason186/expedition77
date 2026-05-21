<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Your Expedition 77 profile page — manage your personal details, view bookings, and control your account.">
    <title>My Profile - Expedition 77</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/dashboard.css">
</head>
<body>

    <header>
        <nav class="navbar" id="dash-nav">
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

    <main class="profile-container" id="dash-main">
        <section class="welcome-section">
            <h1>My <span class="highlight">Profile</span></h1>
            <p>Manage your account settings, view active high-altitude bookings, and manage account status.</p>
        </section>

        <div class="profile-layout">
            <section class="profile-sidebar-block">
                <article class="p-card info-card">
                    <div class="profile-header-wrap">
                        <div class="profile-avatar-large">
                            ${sessionScope.userName.substring(0, 2).toUpperCase()}
                        </div>
                        <h2>${sessionScope.userName}</h2>
                        <span class="profile-role-tag">${sessionScope.userRole}</span>
                    </div>
                    <div class="profile-fields-list">
                        <div class="profile-field-row">
                            <span class="field-label">Email</span>
                            <span class="field-value">${sessionScope.userEmail}</span>
                        </div>
                        <div class="profile-field-row">
                            <span class="field-label">Phone</span>
                            <span class="field-value">${sessionScope.userPhone}</span>
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/update-profile" class="profile-edit-btn">Edit Profile Details</a>
                </article>
            </section>

            <section class="profile-bookings-block">
                <article class="p-card bookings-list-card">
                    <h2>Active <span>Bookings</span></h2>
                    <div class="bookings-grid-list">
                        <c:choose>
                            <c:when test="${not empty bookings}">
                                <c:forEach var="booking" items="${bookings}">
                                    <div class="booking-item-row">
                                        <div class="b-details">
                                            <div class="b-header-line">
                                                <span class="b-trek-name">${booking.trekName}</span>
                                                <span class="b-status-badge ${booking.status}">${booking.status}</span>
                                            </div>
                                            <div class="b-meta-line">
                                                <span>Booking ID: <strong>${booking.bookingId}</strong></span>
                                                <span>Date: <time>${booking.trekDate}</time></span>
                                                <span>Group Size: ${booking.groupSize}</span>
                                            </div>
                                        </div>
                                        <c:if test="${booking.status == 'Pending'}">
                                            <form action="${pageContext.request.contextPath}/cancel-booking" method="post">
                                                <input type="hidden" name="bookingId" value="${booking.bookingId}">
                                                <button type="submit" class="b-cancel-action-btn">Cancel</button>
                                            </form>
                                        </c:if>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="bookings-empty-state">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><rect width="18" height="18" x="3" y="4" rx="2" ry="2"/><line x1="16" x2="16" y1="2" y2="6"/><line x1="8" x2="8" y1="2" y2="6"/><line x1="3" x2="21" y1="10" y2="10"/></svg>
                                    <p>You have no active bookings yet.</p>
                                    <a href="${pageContext.request.contextPath}/find-treks" class="book-first-trek-btn">Explore Treks</a>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </article>
            </section>
        </div>
    </main>

    <footer class="site-footer" id="dash-footer">
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
