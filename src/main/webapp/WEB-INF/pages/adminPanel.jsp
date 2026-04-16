<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Admin Dashboard</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/adminPanel.css" />
</head>
<body>
  <div class="dashboard-layout">

    <aside class="sidebar">
      <div class="logo-section">
        <svg class="logo-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
          stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <path d="m8 3 4 8 5-5 5 15H2L8 3z"/>
        </svg>
        <span class="logo-text">Admin Dashboard</span>
      </div>

      <nav class="sidebar-nav">
        <p class="nav-heading">Main</p>

        <a href="#" class="nav-item active">
          <svg class="nav-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <rect width="7" height="9" x="3" y="3" rx="1"/><rect width="7" height="5" x="14" y="3" rx="1"/>
            <rect width="7" height="9" x="14" y="12" rx="1"/><rect width="7" height="5" x="3" y="16" rx="1"/>
          </svg>
          Dashboard
        </a>

        <a href="#" class="nav-item">
          <svg class="nav-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/>
            <path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/>
          </svg>
          Guides
        </a>

        <a href="#" class="nav-item">
          <svg class="nav-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/>
            <path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/>
          </svg>
          Customers
        </a>

        <a href="#" class="nav-item">
          <svg class="nav-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <rect width="18" height="18" x="3" y="4" rx="2" ry="2"/>
            <line x1="16" x2="16" y1="2" y2="6"/><line x1="8" x2="8" y1="2" y2="6"/>
            <line x1="3" x2="21" y1="10" y2="10"/>
          </svg>
          Bookings
        </a>

        <a href="#" class="nav-item">
          <svg class="nav-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/>
          </svg>
          Contact Queries
        </a>

        <p class="nav-heading content-heading">Content</p>

        <a href="#" class="nav-item">
          <svg class="nav-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/>
          </svg>
          About Us
        </a>

        <a href="#" class="nav-item">
          <svg class="nav-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <circle cx="12" cy="12" r="10"/>
            <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"/><path d="M12 17h.01"/>
          </svg>
          FAQs
        </a>

        <a href="#" class="nav-item">
          <svg class="nav-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
            <polyline points="14 2 14 8 20 8"/><line x1="16" x2="8" y1="13" y2="13"/>
            <line x1="16" x2="8" y1="17" y2="17"/><polyline points="10 9 9 9 8 9"/>
          </svg>
          Policies
        </a>
      </nav>

      <div class="sidebar-user">
        <div class="user-info">
          <div class="avatar primary-avatar">A</div>
          <div class="user-text">
            <p class="user-name">Admin</p>
            <p class="user-email">admin@expedition.com</p>
          </div>
        </div>
      </div>
    </aside>

    <div class="main-panel">
      <header class="topbar">
        <div>
          <h1 class="page-title">Dashboard</h1>
          <p class="page-subtitle">Welcome back, Admin</p>
        </div>

        <div class="profile-dropdown">
          <button class="profile-button" type="button">
            <div class="avatar violet-avatar small-avatar">A</div>
            Admin
            <svg class="dropdown-arrow" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
              stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <polyline points="6 9 12 15 18 9"/>
            </svg>
          </button>

          <div class="dropdown-menu">
            <a href="#" class="dropdown-item">
              <svg class="dropdown-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/>
                <circle cx="12" cy="7" r="4"/>
              </svg>
              Update Profile
            </a>
            <a href="#" class="dropdown-item logout-item">
              <svg class="dropdown-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/>
                <polyline points="16 17 21 12 16 7"/><line x1="21" x2="9" y1="12" y2="12"/>
              </svg>
              Logout
            </a>
          </div>
        </div>
      </header>

      <main class="main-content">
        <div class="stats-grid">
          <div class="stat-card">
            <div class="stat-card-header">
              <div>
                <p class="stat-label">Guides</p>
                <h2 class="stat-number">120</h2>
              </div>
              <div class="stat-icon-box violet-light">
                <svg class="stat-icon violet-text" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
                  stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                  <circle cx="9" cy="7" r="4"/>
                  <path d="M23 21v-2a4 4 0 0 0-3-3.87"/>
                  <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                </svg>
              </div>
            </div>
          </div>

          <div class="stat-card">
            <div class="stat-card-header">
              <div>
                <p class="stat-label">Customers</p>
                <h2 class="stat-number">450</h2>
              </div>
              <div class="stat-icon-box blue-light">
                <svg class="stat-icon blue-text" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
                  stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/>
                  <circle cx="9" cy="7" r="4"/>
                  <path d="M22 21v-2a4 4 0 0 0-3-3.87"/>
                  <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                </svg>
              </div>
            </div>
          </div>

          <div class="stat-card">
            <div class="stat-card-header">
              <div>
                <p class="stat-label">Contact Queries</p>
                <h2 class="stat-number">32</h2>
              </div>
              <div class="stat-icon-box amber-light">
                <svg class="stat-icon amber-text" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
                  stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/>
                </svg>
              </div>
            </div>
          </div>

          <div class="stat-card">
            <div class="stat-card-header">
              <div>
                <p class="stat-label">Bookings</p>
                <h2 class="stat-number">89</h2>
              </div>
              <div class="stat-icon-box emerald-light">
                <svg class="stat-icon emerald-text" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
                  stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <rect width="18" height="18" x="3" y="4" rx="2" ry="2"/>
                  <line x1="16" x2="16" y1="2" y2="6"/>
                  <line x1="8" x2="8" y1="2" y2="6"/>
                  <line x1="3" x2="21" y1="10" y2="10"/>
                </svg>
              </div>
            </div>
          </div>
        </div>

        <div class="table-card">
          <div class="table-header">
            <div>
              <h2 class="table-title">Recent Contact Queries</h2>
              <p class="table-subtitle">Latest messages from visitors</p>
            </div>
            <a href="#" class="view-all-link">
              View all
              <svg class="view-all-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                <path d="M5 12h14"/><path d="m12 5 7 7-7 7"/>
              </svg>
            </a>
          </div>

          <div class="table-wrapper">
            <table class="queries-table">
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Email</th>
                  <th>Message</th>
                  <th>Date</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>
                    <div class="table-name-cell">
                      <div class="mini-avatar violet-light violet-text">J</div>
                      <span class="table-person-name">John Doe</span>
                    </div>
                  </td>
                  <td class="muted-text">john@example.com</td>
                  <td class="message-text">Need help with booking</td>
                  <td class="muted-text">Apr 15, 2026</td>
                </tr>
                <tr>
                  <td>
                    <div class="table-name-cell">
                      <div class="mini-avatar blue-light blue-text">J</div>
                      <span class="table-person-name">Jane Smith</span>
                    </div>
                  </td>
                  <td class="muted-text">jane@example.com</td>
                  <td class="message-text">Guide inquiry</td>
                  <td class="muted-text">Apr 14, 2026</td>
                </tr>
                <tr>
                  <td>
                    <div class="table-name-cell">
                      <div class="mini-avatar emerald-light emerald-text">A</div>
                      <span class="table-person-name">Alex</span>
                    </div>
                  </td>
                  <td class="muted-text">alex@example.com</td>
                  <td class="message-text">Pricing question</td>
                  <td class="muted-text">Apr 13, 2026</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </main>
    </div>
  </div>
</body>
</html>