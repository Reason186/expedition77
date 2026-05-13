<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Portal - Expedition77</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <style>
    :root {
      --primary: #f95738;
      --primary-hover: #e04a2d;
      --bg-dark: #080a10;
      --bg-card: #11131c;
      --border-color: rgba(255, 255, 255, 0.15);
      --text-main: #ffffff;
      --text-muted: #9ca3af;
    }
    body {
      margin: 0;
      padding: 0;
      background-color: var(--bg-dark);
      color: var(--text-main);
      font-family: 'Inter', sans-serif;
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      background-image: radial-gradient(circle at top right, rgba(249, 87, 56, 0.05), transparent 40%),
                        radial-gradient(circle at bottom left, rgba(139, 92, 246, 0.05), transparent 40%);
    }
    .auth-card {
      background: var(--bg-card);
      border: 1px solid var(--border-color);
      border-radius: 20px;
      padding: 40px;
      width: 100%;
      max-width: 420px;
      box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
      text-align: center;
    }
    .logo-container {
      margin-bottom: 30px;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 12px;
    }
    .logo-icon {
      width: 36px;
      height: 36px;
      color: var(--primary);
    }
    .logo-text {
      font-size: 24px;
      font-weight: 800;
      letter-spacing: -0.5px;
    }
    h2 {
      margin: 0 0 8px 0;
      font-size: 20px;
      font-weight: 600;
    }
    p.subtitle {
      color: var(--text-muted);
      margin: 0 0 30px 0;
      font-size: 14px;
    }
    .form-group {
      text-align: left;
      margin-bottom: 20px;
    }
    label {
      display: block;
      margin-bottom: 8px;
      font-size: 13px;
      font-weight: 500;
      color: var(--text-muted);
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }
    input {
      width: 100%;
      padding: 12px 16px;
      background: rgba(255, 255, 255, 0.03);
      border: 1px solid var(--border-color);
      border-radius: 10px;
      color: var(--text-main);
      font-size: 15px;
      font-family: inherit;
      transition: all 0.2s ease;
      box-sizing: border-box;
    }
    input:focus {
      outline: none;
      border-color: var(--primary);
      background: rgba(249, 87, 56, 0.05);
      box-shadow: 0 0 0 4px rgba(249, 87, 56, 0.1);
    }
    .btn-submit {
      width: 100%;
      padding: 14px;
      background: var(--primary);
      color: #fff;
      border: none;
      border-radius: 10px;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      font-family: inherit;
      transition: all 0.2s ease;
      margin-top: 10px;
    }
    .btn-submit:hover {
      background: var(--primary-hover);
      transform: translateY(-2px);
    }
    .alert {
      padding: 12px;
      border-radius: 8px;
      margin-bottom: 24px;
      font-size: 14px;
      text-align: left;
    }
    .alert-error {
      background: rgba(239, 68, 68, 0.1);
      border: 1px solid rgba(239, 68, 68, 0.2);
      color: #ef4444;
    }
    .alert-warning {
      background: rgba(245, 158, 11, 0.1);
      border: 1px solid rgba(245, 158, 11, 0.2);
      color: #f59e0b;
    }
  </style>
</head>
<body>

  <div class="auth-card">
    <div class="logo-container">
      <svg class="logo-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="m8 3 4 8 5-5 5 15H2L8 3z"/>
      </svg>
      <span class="logo-text">Admin Portal</span>
    </div>
    
    <h2>Secure Login</h2>
    <p class="subtitle">Authorized personnel only</p>

    <c:if test="${not empty errorMessage}">
      <div class="alert alert-error">
        <c:out value="${errorMessage}" />
      </div>
    </c:if>

    <c:if test="${param.error == 'UnauthorizedAccess'}">
      <div class="alert alert-warning">
        Please log in as an administrator to access the dashboard.
      </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/admin-login" method="POST">
      <div class="form-group">
        <label for="email">Admin Email Address</label>
        <input type="email" id="email" name="email" required autocomplete="username" />
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" required autocomplete="current-password" />
      </div>

      <button type="submit" class="btn-submit">Authenticate &rarr;</button>
    </form>
  </div>

</body>
</html>
