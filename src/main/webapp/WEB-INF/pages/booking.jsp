<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Book your trek with Expedition 77 — fill in your details and reserve your Himalayan adventure.">
    <title>Book Trek - Expedition 77</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/booking.css">
</head>
<body>
    <header>
        <nav class="navbar" id="booking-nav">
            <a href="${pageContext.request.contextPath}/" class="logo">Expedition <span>77</span></a>
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/treks">Treks</a></li>
                <li><a href="${pageContext.request.contextPath}/find-treks">Find Treks</a></li>
                <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
                <li><a href="${pageContext.request.contextPath}/dashboard">Profile</a></li>
                <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main class="booking-container" id="booking-main">
        <section class="booking-header">
            <mark class="booking-badge">Reserve Your Spot</mark>
            <h1>Book Your <span class="highlight">Trek</span></h1>
            <p>Fill in the details below to reserve your spot</p>
        </section>

        <c:if test="${not empty bookingMessage}">
            <div class="toast ${bookingStatus}">${bookingMessage}</div>
        </c:if>

        <section class="booking-layout" id="booking-content">
            <div class="booking-form-section">
                <form action="${pageContext.request.contextPath}/booking" method="post" class="booking-form" id="booking-form">
                    <input type="hidden" name="trekId" value="${trek.trekId}">

                    <fieldset>
                        <legend>Personal Details</legend>
                        <div class="input-group">
                            <label for="fullName">Full Name</label>
                            <input type="text" id="fullName" name="fullName" value="${sessionScope.userName}" required>
                        </div>
                        <div class="input-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" value="${sessionScope.userEmail}" required>
                        </div>
                        <div class="input-group">
                            <label for="phone">Phone Number</label>
                            <input type="text" id="phone" name="phone" value="${sessionScope.userPhone}" required>
                        </div>
                    </fieldset>

                    <fieldset>
                        <legend>Trek Preferences</legend>
                        <div class="form-row">
                            <div class="input-group">
                                <label for="trekDate">Preferred Date</label>
                                <input type="date" id="trekDate" name="trekDate" required>
                            </div>
                            <div class="input-group">
                                <label for="groupSize">Group Size</label>
                                <input type="number" id="groupSize" name="groupSize" min="1" max="15" value="1" required>
                            </div>
                        </div>
                        <div class="input-group">
                            <label for="specialRequests">Special Requests</label>
                            <textarea id="specialRequests" name="specialRequests" rows="3" placeholder="Any dietary needs, medical conditions, etc."></textarea>
                        </div>
                    </fieldset>

                    <button type="submit" class="submit-btn" id="confirm-booking">Confirm Booking</button>
                </form>
            </div>

            <aside class="booking-summary" id="booking-sidebar">
                <c:if test="${not empty trek}">
                    <div class="summary-card">
                        <figure>
                            <img src="${pageContext.request.contextPath}/images/${trek.image}" alt="${trek.name}" class="summary-img">
                        </figure>
                        <h3>${trek.name}</h3>
                        <div class="summary-row">
                            <span>Duration</span>
                            <span>${trek.duration} Days</span>
                        </div>
                        <div class="summary-row">
                            <span>Difficulty</span>
                            <span>${trek.difficulty}</span>
                        </div>
                        <div class="summary-row">
                            <span>Max Altitude</span>
                            <span>${trek.maxAltitude}m</span>
                        </div>
                        <div class="summary-total">
                            <span>Price Per Person</span>
                            <span class="total-price">Rs. ${trek.price}</span>
                        </div>
                    </div>
                </c:if>
            </aside>
        </section>
    </main>

    <footer class="site-footer" id="booking-footer">
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
