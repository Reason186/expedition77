<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Guide Dashboard | Expedition 77</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/base.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/dashboard.css">
  <style>
    /* Premium Guide styles */
    .guide-badge {
      display: inline-block;
      padding: 4px 12px;
      font-size: 11px;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 1px;
      background: linear-gradient(135deg, #8b5cf6, #d946ef);
      color: #ffffff;
      border-radius: 20px;
      margin-top: 8px;
    }
    .form-group {
      margin-bottom: 16px;
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      width: 100%;
    }
    .form-group label {
      font-size: 13px;
      font-weight: 600;
      color: #94a3b8;
      margin-bottom: 6px;
    }
    .form-group input, .form-group select, .form-group textarea {
      width: 100%;
      padding: 10px 14px;
      background: rgba(255, 255, 255, 0.03);
      border: 1px solid rgba(255, 255, 255, 0.08);
      border-radius: 8px;
      color: #ffffff;
      font-family: inherit;
      font-size: 14px;
      transition: all 0.2s ease;
    }
    .form-group input:focus, .form-group select:focus, .form-group textarea:focus {
      outline: none;
      border-color: #8b5cf6;
      background: rgba(255, 255, 255, 0.06);
      box-shadow: 0 0 10px rgba(139, 92, 246, 0.25);
    }
    .form-row {
      display: flex;
      gap: 16px;
      width: 100%;
    }
    .form-row .form-group {
      flex: 1;
    }
    .btn-submit-gig {
      width: 100%;
      padding: 12px;
      font-size: 14px;
      font-weight: 700;
      color: #ffffff;
      background: linear-gradient(135deg, #8b5cf6, #6d28d9);
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: all 0.3s ease;
      box-shadow: 0 4px 15px rgba(139, 92, 246, 0.3);
    }
    .btn-submit-gig:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 20px rgba(139, 92, 246, 0.5);
    }
    .alert {
      padding: 12px 16px;
      border-radius: 8px;
      font-size: 13px;
      font-weight: 500;
      margin-bottom: 20px;
      width: 100%;
      text-align: left;
    }
    .alert-success {
      background: rgba(16, 185, 129, 0.1);
      color: #10b981;
      border: 1px solid rgba(16, 185, 129, 0.2);
    }
    .alert-error {
      background: rgba(239, 68, 68, 0.1);
      color: #ef4444;
      border: 1px solid rgba(239, 68, 68, 0.2);
    }
  </style>
</head>
<body>
  <div class="app-container">
    <!-- Navbar Header -->
    <header class="header">
      <div class="header-container">
        <a href="${pageContext.request.contextPath}/" class="logo">Expedition <span>77</span></a>
        
        <nav class="nav-menu">
          <a href="${pageContext.request.contextPath}/">Home</a>
          <a href="${pageContext.request.contextPath}/treks">Treks</a>
          <a href="${pageContext.request.contextPath}/find-treks">Find Treks</a>
          <a href="${pageContext.request.contextPath}/about">About Us</a>
          <a href="${pageContext.request.contextPath}/contact">Contact</a>
        </nav>

        <div class="nav-right">
          <span class="user-greeting">Hello, <strong><c:out value="${sessionScope.userName}" /></strong></span>
          <a href="${pageContext.request.contextPath}/logout" class="btn-primary" style="background: rgba(239, 68, 68, 0.1); color: #ef4444; border: 1px solid rgba(239, 68, 68, 0.2);">Logout</a>
        </div>
      </div>
    </header>

    <div class="dashboard-wrapper">
      <div class="dashboard-container">
        
        <!-- Left Column: Guide Details & Post a Trek -->
        <div class="profile-sidebar">
          <div class="card profile-card">
            <div class="profile-header">
              <c:choose>
                <c:when test="${not empty sessionScope.userProfilePic}">
                  <img src="<c:out value='${sessionScope.userProfilePic}' />" alt="Profile Picture" class="avatar-img" style="width: 90px; height: 90px; border-radius: 50%; object-fit: cover; border: 3px solid #8b5cf6; margin-bottom: 16px;">
                </c:when>
                <c:otherwise>
                  <div class="avatar-large" style="width: 90px; height: 90px; border-radius: 50%; background: linear-gradient(135deg, #8b5cf6, #d946ef); display: flex; align-items: center; justify-content: center; color: #ffffff; font-size: 32px; font-weight: 800; border: 3px solid rgba(255,255,255,0.1); margin-bottom: 16px;"><c:out value="${sessionScope.userName.substring(0, 1).toUpperCase()}" /></div>
                </c:otherwise>
              </c:choose>
              <h2><c:out value="${sessionScope.userName}" /></h2>
              <p class="email"><c:out value="${sessionScope.userEmail}" /></p>
              <span class="guide-badge">Certified Guide</span>
            </div>
            <div class="profile-info-list">
              <div class="info-item">
                <span class="label">Phone:</span>
                <span class="value"><c:out value="${sessionScope.userPhone != null ? sessionScope.userPhone : 'Not Provided'}" /></span>
              </div>
              <div class="info-item">
                <span class="label">Total Gigs:</span>
                <span class="value"><c:out value="${not empty gigs ? gigs.size() : 0}" /> Gigs Posted</span>
              </div>
            </div>
            <div style="margin-top: 20px;">
              <a href="${pageContext.request.contextPath}/update-profile" class="btn-secondary" style="display: block; text-align: center; text-decoration: none;">Edit Profile</a>
            </div>
          </div>

          <!-- Post a Trek Gig form -->
          <div class="card" style="margin-top: 30px; text-align: left;">
            <h3 style="margin-top: 0; margin-bottom: 16px; font-size: 18px; color: #ffffff; border-bottom: 1px solid rgba(255,255,255,0.06); padding-bottom: 10px;">Post a Trek Gig</h3>
            
            <c:if test="${not empty sessionScope.postSuccess}">
              <div class="alert alert-success">
                <c:out value="${sessionScope.postSuccess}" />
              </div>
              <% session.removeAttribute("postSuccess"); %>
            </c:if>
            <c:if test="${not empty sessionScope.postError}">
              <div class="alert alert-error">
                <c:out value="${sessionScope.postError}" />
              </div>
              <% session.removeAttribute("postError"); %>
            </c:if>

            <form action="${pageContext.request.contextPath}/post-trek" method="POST">
              <div class="form-group">
                <label for="trekName">Trek / Gig Name</label>
                <input type="text" id="trekName" name="trekName" placeholder="e.g. Annapurna Base Camp Guidance" required>
              </div>

              <div class="form-row">
                <div class="form-group">
                  <label for="duration">Duration (Days)</label>
                  <input type="number" id="duration" name="duration" min="1" placeholder="e.g. 10" required>
                </div>
                <div class="form-group">
                  <label for="difficulty">Difficulty</label>
                  <select id="difficulty" name="difficulty">
                    <option value="Easy">Easy</option>
                    <option value="Moderate" selected>Moderate</option>
                    <option value="Hard">Hard</option>
                  </select>
                </div>
              </div>

              <div class="form-row">
                <div class="form-group">
                  <label for="maxAltitude">Max Altitude (m)</label>
                  <input type="number" id="maxAltitude" name="maxAltitude" min="0" placeholder="e.g. 4130">
                </div>
                <div class="form-group">
                  <label for="price">Price (NPR)</label>
                  <input type="number" id="price" name="price" min="0" placeholder="e.g. 30000" required>
                </div>
              </div>

              <div class="form-group">
                <label for="groupSize">Group Size</label>
                <input type="text" id="groupSize" name="groupSize" placeholder="e.g. 1 - 8 People" value="1 - 10 People">
              </div>

              <div class="form-group">
                <label for="shortDesc">Short Description</label>
                <input type="text" id="shortDesc" name="shortDesc" placeholder="e.g. Complete personalized guidance for Annapurna Sanctuary." required>
              </div>

              <div class="form-group">
                <label for="longDesc">Detailed Gig Description</label>
                <textarea id="longDesc" name="longDesc" rows="4" placeholder="Describe your route, experience, highlights, and what you include..." required></textarea>
              </div>

              <div class="form-group">
                <label for="image1">Trek Main Image URL <span style="color: #8b5cf6;">*</span></label>
                <input type="url" id="image1" name="image1" placeholder="https://example.com/main-image.jpg" required>
              </div>

              <div class="form-row">
                <div class="form-group">
                  <label for="image2">Trek Detail Image 2 URL <span style="color: #8b5cf6;">*</span></label>
                  <input type="url" id="image2" name="image2" placeholder="https://example.com/detail2.jpg" required>
                </div>
                <div class="form-group">
                  <label for="image3">Trek Detail Image 3 URL <span style="color: #8b5cf6;">*</span></label>
                  <input type="url" id="image3" name="image3" placeholder="https://example.com/detail3.jpg" required>
                </div>
              </div>

              <button type="submit" class="btn-submit-gig" style="margin-top: 10px;">Publish Trek Gig</button>
            </form>
          </div>
        </div>

        <!-- Right Column: Client Bookings & My Gigs List -->
        <div class="bookings-section" style="text-align: left;">
          <h2 style="margin-top: 0;">Client Bookings on My Gigs</h2>
          <p class="section-subtitle" style="margin-bottom: 20px;">Manage bookings travelers have made on your customized tour packages.</p>

          <c:choose>
            <c:when test="${not empty guideBookings}">
              <div style="overflow-x: auto; margin-bottom: 40px; background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.06); border-radius: 8px; padding: 12px;">
                <table style="width: 100%; border-collapse: collapse; text-align: left; font-size: 14px;">
                  <thead>
                    <tr style="border-bottom: 2px solid rgba(255,255,255,0.08); color: #94a3b8;">
                      <th style="padding: 12px 8px;">Trek Gig</th>
                      <th style="padding: 12px 8px;">Client Details</th>
                      <th style="padding: 12px 8px;">Trek Date</th>
                      <th style="padding: 12px 8px;">Group Size</th>
                      <th style="padding: 12px 8px;">Total Price</th>
                      <th style="padding: 12px 8px;">Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="booking" items="${guideBookings}">
                      <tr style="border-bottom: 1px solid rgba(255,255,255,0.04); color: #ffffff;">
                        <td style="padding: 12px 8px; font-weight: 700;"><c:out value="${booking.trekName}" /></td>
                        <td style="padding: 12px 8px;">
                          <div style="font-weight: 600;"><c:out value="${booking.customerName}" /></div>
                          <div style="font-size: 12px; color: #94a3b8;"><c:out value="${booking.customerEmail}" /></div>
                          <div style="font-size: 12px; color: #94a3b8;"><c:out value="${booking.customerPhone}" /></div>
                        </td>
                        <td style="padding: 12px 8px;"><c:out value="${booking.trekDate}" /></td>
                        <td style="padding: 12px 8px;"><c:out value="${booking.groupSize}" /> travelers</td>
                        <td style="padding: 12px 8px; font-weight: 700; color: #8b5cf6;">Rs. <c:out value="${booking.totalPrice}" /></td>
                        <td style="padding: 12px 8px;">
                          <span style="display: inline-block; padding: 4px 10px; border-radius: 4px; font-size: 11px; font-weight: 700; text-transform: uppercase;
                            <c:choose>
                              <c:when test="${booking.status == 'Confirmed'}">background: rgba(16,185,129,0.15); color: #10b981;</c:when>
                              <c:when test="${booking.status == 'Cancelled'}">background: rgba(239,68,68,0.15); color: #ef4444;</c:when>
                              <c:otherwise>background: rgba(245,158,11,0.15); color: #f59e0b;</c:otherwise>
                            </c:choose>"><c:out value="${booking.status}" /></span>
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </c:when>
            <c:otherwise>
              <div class="card empty-state" style="text-align: center; padding: 30px; border: 1px dashed rgba(255,255,255,0.08); margin-bottom: 40px;">
                <div class="empty-icon" style="font-size: 32px; color: rgba(139, 92, 246, 0.4); margin-bottom: 8px;">📅</div>
                <h4 style="margin: 0 0 4px; color: #ffffff;">No Bookings Yet</h4>
                <p style="margin: 0; color: #64748b; font-size: 13px;">When customers book your published treks, they will appear here.</p>
              </div>
            </c:otherwise>
          </c:choose>

          <h2>My Published Trek Gigs</h2>
          <p class="section-subtitle">Manage and track your active guiding packages listed on the customer marketplace.</p>

          <c:choose>
            <c:when test="${not empty gigs}">
              <div class="bookings-grid">
                <c:forEach var="gig" items="${gigs}">
                  <div class="card booking-card" style="border-left: 4px solid #8b5cf6;">
                    <div class="booking-header">
                      <div>
                        <h3><c:out value="${gig.name}" /></h3>
                        <span class="difficulty-badge" style="background: rgba(139,92,246,0.1); color: #8b5cf6; padding: 2px 8px; border-radius: 4px; font-size: 11px; font-weight: 600; text-transform: uppercase;"><c:out value="${gig.difficulty}" /></span>
                      </div>
                      <div class="booking-price" style="font-size: 20px; font-weight: 800; color: #8b5cf6;">
                        Rs. <c:out value="${gig.price}" />
                      </div>
                    </div>
                    
                    <div class="booking-details" style="display: grid; grid-template-columns: 1fr 1fr; gap: 12px; margin-top: 14px; border-top: 1px solid rgba(255,255,255,0.04); padding-top: 12px;">
                      <div>
                        <p style="margin: 0; font-size: 11px; color: #64748b; text-transform: uppercase;">Duration</p>
                        <p style="margin: 4px 0 0; font-size: 14px; font-weight: 600; color: #ffffff;"><c:out value="${gig.duration}" /> Days</p>
                      </div>
                      <div>
                        <p style="margin: 0; font-size: 11px; color: #64748b; text-transform: uppercase;">Max Altitude</p>
                        <p style="margin: 4px 0 0; font-size: 14px; font-weight: 600; color: #ffffff;"><c:out value="${gig.max_altitude}" /> m</p>
                      </div>
                      <div>
                        <p style="margin: 0; font-size: 11px; color: #64748b; text-transform: uppercase;">Group Size</p>
                        <p style="margin: 4px 0 0; font-size: 14px; font-weight: 600; color: #ffffff;"><c:out value="${gig.group_size}" /></p>
                      </div>
                      <div>
                        <p style="margin: 0; font-size: 11px; color: #64748b; text-transform: uppercase;">Created On</p>
                        <p style="margin: 4px 0 0; font-size: 13px; font-weight: 500; color: #94a3b8;"><c:out value="${gig.created_at}" /></p>
                      </div>
                    </div>

                    <div style="margin-top: 14px; border-top: 1px solid rgba(255,255,255,0.04); padding-top: 12px;">
                      <p style="margin: 0; font-size: 11px; color: #64748b; text-transform: uppercase;">Short Summary</p>
                      <p style="margin: 4px 0 0; font-size: 13px; color: #94a3b8;"><c:out value="${gig.short_description}" /></p>
                    </div>
                  </div>
                </c:forEach>
              </div>
            </c:when>
            <c:otherwise>
              <div class="card empty-state" style="text-align: center; padding: 40px; border: 1px dashed rgba(255,255,255,0.08);">
                <div class="empty-icon" style="font-size: 48px; color: rgba(139, 92, 246, 0.4); margin-bottom: 16px;">🗺️</div>
                <h3 style="margin: 0 0 8px; color: #ffffff;">No Gigs Published Yet</h3>
                <p style="margin: 0 0 20px; color: #64748b; font-size: 14px;">Post your first guide trek gig using the form on the left to start receiving bookings from travelers!</p>
              </div>
            </c:otherwise>
          </c:choose>
        </div>

      </div>
    </div>
  </div>
</body>
</html>
