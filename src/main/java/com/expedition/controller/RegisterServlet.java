package com.expedition.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.expedition.dao.GuideDAO;
import com.expedition.service.RegisterService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet(asyncSupported = true, name = "register", urlPatterns = { "/register" })
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            String role = request.getParameter("role");
            String name = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            
            String passwordPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=!]).{8,}$";
            
            if (!password.matches(passwordPattern)) {
                request.setAttribute("message", 
                    "Password must be at least 8 characters and include uppercase, lowercase, number, and special character.");
                request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
                return;
            }
            
            if (!password.equals(confirmPassword)) {
                request.setAttribute("message", "Passwords do not match.");
                request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
                return;
            }
            
            if ("guide".equals(role)) {
                String specialty = request.getParameter("specialty");
                String bio = request.getParameter("bio");
                int experience = Integer.parseInt(request.getParameter("experience"));
                
                GuideDAO guideDao = new GuideDAO();
                guideDao.insertGuide(name, email, password, phone, specialty, bio, experience);
                
                request.setAttribute("message", "Guide Registered Successfully.");
            } else {
                RegisterService service = new RegisterService();
                service.addUser(name, email, password, phone);
                
                request.setAttribute("message", "Registered Successfully.");
            }
            
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
