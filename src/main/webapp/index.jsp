<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>

<%
    String role = (String) session.getAttribute("role");
    boolean loggedIn = (role != null);
    String ctaText = loggedIn ? "Go to Dashboard" : "Get Started";
    String ctaLink = loggedIn ? "dashboard.jsp" : "registration.jsp";
%>

<!DOCTYPE html>
<html>
<head>
    <title>Expedition 77 | Home</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/home.css">
</head>

<body>

<div class="overlay">

    <!-- NAVBAR -->
    <div class="navbar">
        <h2 class="logo">Expedition <span>77</span></h2>
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/login">Login</a>
            <a href="${pageContext.request.contextPath}/register" class="btn">Register</a>
        </div>
    </div>

    <!-- SEARCH BOX -->
    <div class="search-box">
        <div class="search-wrapper">
            <svg class="search-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/></svg>
            <input type="text" placeholder="Search trekking routes...">
        </div>
    </div>

    <!-- HERO -->
    <div class="hero">
        <div class="hero-badge">&#9650; Explore Nepal</div>
        <h1 class="title">Its A Big World<br>Out There.</h1>
        <h2 class="subtitle">Go Explore</h2>
        <p class="tagline">
            Discover trekking routes, hire expert guides, and begin your adventure journey.
        </p>
        <div class="buttons">
            <a href="<%=ctaLink%>" class="primary"><%=ctaText%></a>
            <a href="${pageContext.request.contextPath}/login" class="secondary">Login</a>
        </div>
    </div>

    <!-- FEATURED TREKS -->
    <div class="featured">
        <div class="section-header">
            <span class="section-tag">Top Routes</span>
            <h2 class="section-title">Featured Treks</h2>
            <p class="section-sub">Hand-picked adventures for every level of explorer</p>
        </div>

        <div class="trek-container">

            <div class="trek-card">
                <div class="card-shine"></div>
                <img src="${pageContext.request.contextPath}/images/mounteverest.jpg" class="trek-img" alt="Everest Base Camp">
                <div class="card-overlay"></div>
                <div class="trek-badge">16 Days</div>
                <div class="trek-info">
                    <div class="trek-meta">
                        <span class="trek-difficulty hard">Hard</span>
                        <span class="trek-altitude">&#9650; 5,364m</span>
                    </div>
                    <h3>Everest Base Camp</h3>
                    <p>Experience the world's highest peak up close.</p>
                    <a href="${pageContext.request.contextPath}/login" class="explore-btn">
                        Explore
                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14"/><path d="m12 5 7 7-7 7"/></svg>
                    </a>
                </div>
            </div>

            <div class="trek-card">
                <div class="card-shine"></div>
                <img src="${pageContext.request.contextPath}/images/annapurna.jpg" class="trek-img" alt="Annapurna Circuit">
                <div class="card-overlay"></div>
                <div class="trek-badge">21 Days</div>
                <div class="trek-info">
                    <div class="trek-meta">
                        <span class="trek-difficulty moderate">Moderate</span>
                        <span class="trek-altitude">&#9650; 5,416m</span>
                    </div>
                    <h3>Annapurna Circuit</h3>
                    <p>Nepal's most diverse and beautiful trekking route.</p>
                    <a href="${pageContext.request.contextPath}/login" class="explore-btn">
                        Explore
                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14"/><path d="m12 5 7 7-7 7"/></svg>
                    </a>
                </div>
            </div>

            <div class="trek-card">
                <div class="card-shine"></div>
                <img src="${pageContext.request.contextPath}/images/langtang.jpg" class="trek-img" alt="Langtang Valley">
                <div class="card-overlay"></div>
                <div class="trek-badge">10 Days</div>
                <div class="trek-info">
                    <div class="trek-meta">
                        <span class="trek-difficulty easy">Easy</span>
                        <span class="trek-altitude">&#9650; 3,870m</span>
                    </div>
                    <h3>Langtang Valley</h3>
                    <p>Scenic valley trek just a day's drive from Kathmandu.</p>
                    <a href="${pageContext.request.contextPath}/login" class="explore-btn">
                        Explore
                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14"/><path d="m12 5 7 7-7 7"/></svg>
                    </a>
                </div>
            </div>

        </div>
    </div>

    <!-- ═══ REVIEWS SECTION ═══ -->
    <div class="reviews-section">
        <div class="reviews-header">
            <span class="section-tag">Testimonials</span>
            <h2 class="section-title">What Trekkers Say</h2>
            <p class="section-sub">Real stories from real adventurers who explored with us</p>
        </div>

        <div class="reviews-track-wrapper">

            <!-- ROW 1 — scrolls left -->
            <div class="reviews-track track-left">

                <div class="review-card">
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="review-text">"The Everest Base Camp trek was the most transformative experience of my life. Our guide Pemba was exceptional — knowledgeable, patient, and always encouraging."</p>
                    <div class="reviewer">
                        <div class="reviewer-avatar">JM</div>
                        <div class="reviewer-info">
                            <strong>James Mitchell</strong>
                            <span>United Kingdom</span>
                        </div>
                    </div>
                </div>

                <div class="review-card">
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="review-text">"Annapurna Circuit in 21 days was simply breathtaking. Expedition 77 handled everything flawlessly — accommodation, permits, and a wonderful local guide."</p>
                    <div class="reviewer">
                        <div class="reviewer-avatar">SL</div>
                        <div class="reviewer-info">
                            <strong>Sophie Laurent</strong>
                            <span>France</span>
                        </div>
                    </div>
                </div>

                <div class="review-card">
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9734;</div>
                    <p class="review-text">"Langtang Valley was perfect for my first Himalayan trek. The team was incredibly supportive and made me feel safe throughout the entire journey."</p>
                    <div class="reviewer">
                        <div class="reviewer-avatar">RK</div>
                        <div class="reviewer-info">
                            <strong>Ravi Kumar</strong>
                            <span>India</span>
                        </div>
                    </div>
                </div>

                <div class="review-card">
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="review-text">"From booking to the final descent, everything was seamless. The porters, the food, the campsites — all top-notch. I'll definitely be back for Manaslu!"</p>
                    <div class="reviewer">
                        <div class="reviewer-avatar">AW</div>
                        <div class="reviewer-info">
                            <strong>Anna Weber</strong>
                            <span>Germany</span>
                        </div>
                    </div>
                </div>

                <div class="review-card">
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="review-text">"Our guide Dawa shared so much about Sherpa culture and history. It wasn't just a trek — it was a cultural immersion. Absolutely recommended!"</p>
                    <div class="reviewer">
                        <div class="reviewer-avatar">TC</div>
                        <div class="reviewer-info">
                            <strong>Thomas Chen</strong>
                            <span>United States</span>
                        </div>
                    </div>
                </div>

                <!-- DUPLICATES for seamless loop -->
                <div class="review-card">
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="review-text">"The Everest Base Camp trek was the most transformative experience of my life. Our guide Pemba was exceptional — knowledgeable, patient, and always encouraging."</p>
                    <div class="reviewer">
                        <div class="reviewer-avatar">JM</div>
                        <div class="reviewer-info">
                            <strong>James Mitchell</strong>
                            <span>United Kingdom</span>
                        </div>
                    </div>
                </div>

                <div class="review-card">
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="review-text">"Annapurna Circuit in 21 days was simply breathtaking. Expedition 77 handled everything flawlessly — accommodation, permits, and a wonderful local guide."</p>
                    <div class="reviewer">
                        <div class="reviewer-avatar">SL</div>
                        <div class="reviewer-info">
                            <strong>Sophie Laurent</strong>
                            <span>France</span>
                        </div>
                    </div>
                </div>

                <div class="review-card">
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9734;</div>
                    <p class="review-text">"Langtang Valley was perfect for my first Himalayan trek. The team was incredibly supportive and made me feel safe throughout the entire journey."</p>
                    <div class="reviewer">
                        <div class="reviewer-avatar">RK</div>
                        <div class="reviewer-info">
                            <strong>Ravi Kumar</strong>
                            <span>India</span>
                        </div>
                    </div>
                </div>

                <div class="review-card">
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="review-text">"From booking to the final descent, everything was seamless. The porters, the food, the campsites — all top-notch. I'll definitely be back for Manaslu!"</p>
                    <div class="reviewer">
                        <div class="reviewer-avatar">AW</div>
                        <div class="reviewer-info">
                            <strong>Anna Weber</strong>
                            <span>Germany</span>
                        </div>
                    </div>
                </div>

                <div class="review-card">
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="review-text">"Our guide Dawa shared so much about Sherpa culture and history. It wasn't just a trek — it was a cultural immersion. Absolutely recommended!"</p>
                    <div class="reviewer">
                        <div class="reviewer-avatar">TC</div>
                        <div class="reviewer-info">
                            <strong>Thomas Chen</strong>
                            <span>United States</span>
                        </div>
                    </div>
                </div>

            </div><!-- end track-left -->

            <!-- ROW 2 — scrolls right -->
            <div class="reviews-track track-right">

                <div class="review-card">
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="review-text">"Upper Mustang felt like stepping into another world. The landscape is surreal and our guide's knowledge of the forbidden kingdom's history was incredible."</p>
                    <div class="reviewer">
                        <div class="reviewer-avatar">LB</div>
                        <div class="reviewer-info">
                            <strong>Lena Bergström</strong>
                            <span>Sweden</span>
                        </div>
                    </div>
                </div>

                <div class="review-card">
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="review-text">"I came alone and left with lifelong friends. Expedition 77 created the perfect group dynamic and the safety protocols made my family worry a lot less!"</p>
                    <div class="reviewer">
                        <div class="reviewer-avatar">MO</div>
                        <div class="reviewer-info">
                            <strong>Marco Oliveira</strong>
                            <span>Brazil</span>
                        </div>
                    </div>
                </div>

                <div class="review-card">
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9734;</div>
                    <p class="review-text">"The Manaslu Circuit was tough but the views were worth every step. Our guide pushed us just enough while always prioritising our wellbeing."</p>
                    <div class="reviewer">
                        <div class="reviewer-avatar">HN</div>
                        <div class="reviewer-info">
                            <strong>Hana Nakamura</strong>
                            <span>Japan</span>
                        </div>
                    </div>
                </div>

                <div class="review-card">
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="review-text">"Truly a bucket-list experience. The team went above and beyond when one of us had altitude sickness — professional, calm, and incredibly caring."</p>
                    <div class="reviewer">
                        <div class="reviewer-avatar">EP</div>
                        <div class="reviewer-info">
                            <strong>Elena Petrov</strong>
                            <span>Russia</span>
                        </div>
                    </div>
                </div>

                <div class="review-card">
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="review-text">"The sunrise from Poon Hill alone was worth the entire trip. Expedition 77 made sure we arrived at the perfect time. I cannot recommend them enough."</p>
                    <div class="reviewer">
                        <div class="reviewer-avatar">KA</div>
                        <div class="reviewer-info">
                            <strong>Kofi Asante</strong>
                            <span>Ghana</span>
                        </div>
                    </div>
                </div>

                <!-- DUPLICATES for seamless loop -->
                <div class="review-card">
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="review-text">"Upper Mustang felt like stepping into another world. The landscape is surreal and our guide's knowledge of the forbidden kingdom's history was incredible."</p>
                    <div class="reviewer">
                        <div class="reviewer-avatar">LB</div>
                        <div class="reviewer-info">
                            <strong>Lena Bergström</strong>
                            <span>Sweden</span>
                        </div>
                    </div>
                </div>

                <div class="review-card">
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="review-text">"I came alone and left with lifelong friends. Expedition 77 created the perfect group dynamic and the safety protocols made my family worry a lot less!"</p>
                    <div class="reviewer">
                        <div class="reviewer-avatar">MO</div>
                        <div class="reviewer-info">
                            <strong>Marco Oliveira</strong>
                            <span>Brazil</span>
                        </div>
                    </div>
                </div>

                <div class="review-card">
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9734;</div>
                    <p class="review-text">"The Manaslu Circuit was tough but the views were worth every step. Our guide pushed us just enough while always prioritising our wellbeing."</p>
                    <div class="reviewer">
                        <div class="reviewer-avatar">HN</div>
                        <div class="reviewer-info">
                            <strong>Hana Nakamura</strong>
                            <span>Japan</span>
                        </div>
                    </div>
                </div>

                <div class="review-card">
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="review-text">"Truly a bucket-list experience. The team went above and beyond when one of us had altitude sickness — professional, calm, and incredibly caring."</p>
                    <div class="reviewer">
                        <div class="reviewer-avatar">EP</div>
                        <div class="reviewer-info">
                            <strong>Elena Petrov</strong>
                            <span>Russia</span>
                        </div>
                    </div>
                </div>

                <div class="review-card">
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="review-text">"The sunrise from Poon Hill alone was worth the entire trip. Expedition 77 made sure we arrived at the perfect time. I cannot recommend them enough."</p>
                    <div class="reviewer">
                        <div class="reviewer-avatar">KA</div>
                        <div class="reviewer-info">
                            <strong>Kofi Asante</strong>
                            <span>Ghana</span>
                        </div>
                    </div>
                </div>

            </div><!-- end track-right -->

        </div><!-- end reviews-track-wrapper -->
    </div><!-- end reviews-section -->

</div><!-- end overlay -->


<!-- FOOTER -->
<footer class="footer">
    <div class="footer-glow"></div>
    <div class="footer-content">

        <div class="footer-brand">
            <h2 class="footer-logo">Expedition <span>77</span></h2>
            <p>Your gateway to the Himalayas. We connect adventurers with certified local guides for unforgettable trekking experiences across Nepal.</p>
            <div class="social-links">
                <a href="#" class="social-btn" title="Facebook">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"/></svg>
                </a>
                <a href="#" class="social-btn" title="Instagram">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="20" height="20" x="2" y="2" rx="5" ry="5"/><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"/><line x1="17.5" x2="17.51" y1="6.5" y2="6.5"/></svg>
                </a>
                <a href="#" class="social-btn" title="YouTube">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path d="M22.54 6.42a2.78 2.78 0 0 0-1.95-1.96C18.88 4 12 4 12 4s-6.88 0-8.59.46a2.78 2.78 0 0 0-1.95 1.96A29 29 0 0 0 1 12a29 29 0 0 0 .46 5.58A2.78 2.78 0 0 0 3.41 19.6C5.12 20 12 20 12 20s6.88 0 8.59-.46a2.78 2.78 0 0 0 1.95-1.95A29 29 0 0 0 23 12a29 29 0 0 0-.46-5.58z"/><polygon fill="white" points="9.75 15.02 15.5 12 9.75 8.98 9.75 15.02"/></svg>
                </a>
            </div>
        </div>

        <div class="footer-col">
            <h4>Quick Links</h4>
            <ul>
                <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
                <li><a href="#">All Treks</a></li>
                <li><a href="${pageContext.request.contextPath}/guides">Our Guides</a></li>
                <li><a href="#">Gallery</a></li>
            </ul>
        </div>

        <div class="footer-col">
            <h4>Popular Treks</h4>
            <ul>
                <li><a href="#">Everest Base Camp</a></li>
                <li><a href="#">Annapurna Circuit</a></li>
                <li><a href="#">Langtang Valley</a></li>
                <li><a href="#">Manaslu Circuit</a></li>
                <li><a href="#">Upper Mustang</a></li>
            </ul>
        </div>

        <div class="footer-col footer-contact">
            <h4>Contact Us</h4>
            <ul class="contact-list">
                <li>
                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"/><circle cx="12" cy="10" r="3"/></svg>
                    Thamel, Kathmandu, Nepal
                </li>
                <li>
                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07A19.5 19.5 0 0 1 4.69 12a19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 3.6 1.28h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L7.91 8.82a16 16 0 0 0 6.29 6.29l.94-.94a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0 1 22 16.92z"/></svg>
                    +977-01-4444555
                </li>
                <li>
                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="20" height="16" x="2" y="4" rx="2"/><path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/></svg>
                    info@expedition77.com
                </li>
                <li>
                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
                    Mon–Sat: 9:00 AM – 6:00 PM
                </li>
            </ul>
        </div>

    </div>

    <div class="footer-bottom">
        <p>&copy; 2025 Expedition 77. All rights reserved. Made with &#10084; in Nepal.</p>
        <div class="footer-bottom-links">
            <a href="#">Privacy Policy</a>
            <a href="#">Terms of Service</a>
        </div>
    </div>
</footer>

</body>
</html>
