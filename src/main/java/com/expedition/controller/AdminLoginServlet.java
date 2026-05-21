package com.expedition.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import com.expedition.service.LoginService;
import com.expedition.dao.UserDAO;

@WebServlet(asyncSupported = true, name = "adminLogin", urlPatterns = { "/admin-login" })
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminLoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// If already logged in as admin, redirect to admin dashboard
		HttpSession session = request.getSession(false);
		if (session != null && "admin".equals(session.getAttribute("userRole"))) {
			response.sendRedirect(request.getContextPath() + "/admin");
			return;
		}
		
		request.getRequestDispatcher("/WEB-INF/pages/adminLogin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            LoginService service = new LoginService();
            String status = service.verifyLogin(email, password);
            
            if ("SUCCESS".equals(status)) {
                UserDAO dao = new UserDAO();
                String role = dao.getUserRole(email);
                
                // CRITICAL: Ensure ONLY admins can login through this portal
                if (!"admin".equals(role)) {
                	request.setAttribute("errorMessage", "Access Denied: Administrator privileges required.");
                    request.getRequestDispatcher("/WEB-INF/pages/adminLogin.jsp").forward(request, response);
                    return;
                }
                
                String name = dao.getUserName(email);
                String phone = dao.getUserPhone(email);
                String profilePic = dao.getUserProfilePic(email);
                
                HttpSession session = request.getSession();
                session.setAttribute("userName", name);
                session.setAttribute("userEmail", email);
                session.setAttribute("userRole", role);
                session.setAttribute("role", role);
                session.setAttribute("userPhone", phone);
                session.setAttribute("userProfilePic", profilePic);
                
                response.sendRedirect(request.getContextPath() + "/admin");
            } else if ("WRONG_PASSWORD".equals(status)) {
                request.setAttribute("errorMessage", "Invalid password");
                request.getRequestDispatcher("/WEB-INF/pages/adminLogin.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Administrator not found");
                request.getRequestDispatcher("/WEB-INF/pages/adminLogin.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/pages/adminLogin.jsp").forward(request, response);
        }
	}
}
