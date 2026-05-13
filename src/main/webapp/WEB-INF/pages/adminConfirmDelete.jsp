<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Confirm Action - Admin Platform Control</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
  <style>
    :root {
      --bg-dark: #080a10;
      --bg-card: rgba(17, 19, 28, 0.7);
      --border-color: rgba(255, 255, 255, 0.08);
      --primary: #f95738;
      --danger: #ef4444;
      --warning: #f59e0b;
      --text-muted: #9ca3af;
      --text-main: #f3f4f6;
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      background-color: var(--bg-dark);
      font-family: 'Inter', sans-serif;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 20px;
      overflow: hidden;
      position: relative;
    }

    /* Subtle ambient glows for visual depth */
    body::before {
      content: '';
      position: absolute;
      width: 400px;
      height: 400px;
      background: radial-gradient(circle, rgba(249, 87, 56, 0.05) 0%, transparent 70%);
      top: -100px;
      right: -100px;
      z-index: 1;
    }

    body::after {
      content: '';
      position: absolute;
      width: 500px;
      height: 500px;
      background: radial-gradient(circle, ${targetAction == 'hard' ? 'rgba(239, 68, 68, 0.05)' : 'rgba(245, 158, 11, 0.05)'} 0%, transparent 70%);
      bottom: -150px;
      left: -150px;
      z-index: 1;
    }

    .confirm-container {
      position: relative;
      z-index: 2;
      width: 100%;
      max-width: 520px;
      background: var(--bg-card);
      backdrop-filter: blur(16px);
      -webkit-backdrop-filter: blur(16px);
      border: 1px solid var(--border-color);
      border-radius: 20px;
      padding: 40px;
      box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
      text-align: center;
      animation: zoomIn 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
    }

    @keyframes zoomIn {
      from { opacity: 0; transform: scale(0.95); }
      to { opacity: 1; transform: scale(1); }
    }

    .icon-wrapper {
      width: 72px;
      height: 72px;
      border-radius: 50%;
      margin: 0 auto 24px;
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative;
    }

    .icon-wrapper.warning {
      background: rgba(245, 158, 11, 0.1);
      color: var(--warning);
      border: 1px solid rgba(245, 158, 11, 0.2);
    }

    .icon-wrapper.danger {
      background: rgba(239, 68, 68, 0.1);
      color: var(--danger);
      border: 1px solid rgba(239, 68, 68, 0.2);
    }

    .icon-pulse {
      position: absolute;
      width: 100%;
      height: 100%;
      border-radius: 50%;
      animation: pulse 2s infinite;
      z-index: -1;
    }

    .icon-wrapper.warning .icon-pulse {
      background: rgba(245, 158, 11, 0.05);
    }

    .icon-wrapper.danger .icon-pulse {
      background: rgba(239, 68, 68, 0.05);
    }

    @keyframes pulse {
      0% { transform: scale(1); opacity: 1; }
      100% { transform: scale(1.4); opacity: 0; }
    }

    .confirm-title {
      font-size: 22px;
      font-weight: 700;
      color: #ffffff;
      margin-bottom: 12px;
      letter-spacing: -0.3px;
    }

    .confirm-message {
      font-size: 15px;
      color: var(--text-muted);
      line-height: 1.6;
      margin-bottom: 30px;
    }

    .target-highlight {
      color: #ffffff;
      font-weight: 600;
      background: rgba(255, 255, 255, 0.06);
      padding: 2px 8px;
      border-radius: 6px;
      font-family: monospace;
      font-size: 14px;
      display: inline-block;
      margin-top: 6px;
    }

    .warning-callout {
      background: rgba(239, 68, 68, 0.05);
      border-left: 3px solid var(--danger);
      padding: 12px 16px;
      border-radius: 4px 8px 8px 4px;
      text-align: left;
      font-size: 13px;
      color: #fca5a5;
      margin-bottom: 30px;
      display: flex;
      align-items: flex-start;
      gap: 10px;
    }

    .warning-callout svg {
      flex-shrink: 0;
      margin-top: 2px;
    }

    .btn-group {
      display: flex;
      flex-direction: column;
      gap: 12px;
    }

    .btn {
      width: 100%;
      padding: 14px 24px;
      font-size: 14px;
      font-weight: 600;
      border-radius: 10px;
      border: none;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      text-decoration: none;
      transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
    }

    .btn-action-submit {
      color: #ffffff;
    }

    .btn-warning {
      background: var(--warning);
    }

    .btn-warning:hover {
      background: #e08f0a;
      transform: translateY(-1px);
    }

    .btn-danger {
      background: var(--danger);
    }

    .btn-danger:hover {
      background: #dc2626;
      transform: translateY(-1px);
    }

    .btn-cancel {
      background: rgba(255, 255, 255, 0.04);
      color: var(--text-main);
      border: 1px solid var(--border-color);
    }

    .btn-cancel:hover {
      background: rgba(255, 255, 255, 0.08);
      border-color: rgba(255, 255, 255, 0.15);
      color: #ffffff;
    }
  </style>
</head>
<body>

  <div class="confirm-container">
    <c:choose>
      <c:when test="${targetAction == 'hard'}">
        <div class="icon-wrapper danger">
          <div class="icon-pulse"></div>
          <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none"
            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M3 6h18"/><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"/><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"/>
            <line x1="10" x2="10" y1="11" y2="17"/><line x1="14" x2="14" y1="11" y2="17"/>
          </svg>
        </div>

        <h1 class="confirm-title">Permanently Delete Account?</h1>
        <p class="confirm-message">
          You are about to permanently delete the user account:<br/>
          <span class="target-highlight"><c:out value="${targetEmail}"/></span>
        </p>

        <div class="warning-callout">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3Z"/>
            <line x1="12" x2="12" y1="9" y2="13"/><line x1="12" x2="12.01" y1="17" y2="17"/>
          </svg>
          <div>
            <strong>Irreversible Action:</strong> This will permanently remove all booking records, personal details, and active credentials from our system.
          </div>
        </div>

        <div class="btn-group">
          <form action="${pageContext.request.contextPath}/admin/delete-user" method="POST" style="width: 100%;">
            <input type="hidden" name="email" value="${targetEmail}" />
            <input type="hidden" name="action" value="hard" />
            <input type="hidden" name="confirmed" value="true" />
            <button type="submit" class="btn btn-action-submit btn-danger">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                <path d="M20 6 9 17l-5-5"/>
              </svg>
              Yes, Permanently Delete
            </button>
          </form>

          <a href="${pageContext.request.contextPath}/admin" class="btn btn-cancel">
            No, Keep User
          </a>
        </div>
      </c:when>

      <c:otherwise>
        <div class="icon-wrapper warning">
          <div class="icon-pulse"></div>
          <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none"
            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <rect width="18" height="11" x="3" y="11" rx="2" ry="2"/>
            <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
          </svg>
        </div>

        <h1 class="confirm-title">Deactivate Account?</h1>
        <p class="confirm-message">
          You are about to deactivate access for the user:<br/>
          <span class="target-highlight"><c:out value="${targetEmail}"/></span>
        </p>

        <div class="warning-callout" style="background: rgba(245, 158, 11, 0.05); border-left-color: var(--warning); color: #fde047;">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <circle cx="12" cy="12" r="10"/><line x1="12" x2="12" y1="8" y2="12"/><line x1="12" x2="12.01" y1="16" y2="16"/>
          </svg>
          <div>
            <strong>Temporary Lockout:</strong> The user will be unable to log in or book treks. However, their history and data will be preserved for reactivation.
          </div>
        </div>

        <div class="btn-group">
          <form action="${pageContext.request.contextPath}/admin/delete-user" method="POST" style="width: 100%;">
            <input type="hidden" name="email" value="${targetEmail}" />
            <input type="hidden" name="action" value="soft" />
            <input type="hidden" name="confirmed" value="true" />
            <button type="submit" class="btn btn-action-submit btn-warning">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                <path d="M20 6 9 17l-5-5"/>
              </svg>
              Yes, Deactivate User
            </button>
          </form>

          <a href="${pageContext.request.contextPath}/admin" class="btn btn-cancel">
            No, Cancel Deactivation
          </a>
        </div>
      </c:otherwise>
    </c:choose>
  </div>

</body>
</html>
