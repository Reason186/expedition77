package com.expedition.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.io.IOException;
import com.expedition.service.RegisterService;

@WebServlet(asyncSupported = true, name = "register", urlPatterns = { "/register" })
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RegisterServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            String name = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String role = request.getParameter("role");

            if (role == null || role.trim().isEmpty()) {
                role = "customer";
            }

            // Extract and save uploaded profile picture if present
            Part filePart = request.getPart("profilePic");
            String profilePic = null;
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String uniqueFileName = System.currentTimeMillis() + "_" + fileName;
                
                String uploadPath = request.getServletContext().getRealPath("/") + "uploads";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                
                filePart.write(uploadPath + File.separator + uniqueFileName);
                profilePic = "uploads/" + uniqueFileName;
            }

            if ("guide".equals(role)) {
                if (profilePic == null || profilePic.trim().isEmpty()) {
                    request.setAttribute("errorMessage", "Profile picture is compulsory for guides.");
                    request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
                    return;
                }
            }

            RegisterService service = new RegisterService();

            if (service.emailExists(email)) {
                request.setAttribute("errorMessage", "Email already exists.");
                request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
                return;
            }

            String passwordPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=!]).{8,}$";
            if (!password.matches(passwordPattern)) {
                request.setAttribute("errorMessage", "Password must be at least 8 characters and include uppercase, lowercase, number, and special character.");
                request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
                return;
            }

            service.addUser(name, email, password, phone, role, profilePic);

            if ("guide".equals(role)) {
                String specialty = request.getParameter("specialty");
                String bio = request.getParameter("bio");
                String expStr = request.getParameter("experienceYears");
                int expYears = 0;
                if (expStr != null && !expStr.trim().isEmpty()) {
                    try {
                        expYears = Integer.parseInt(expStr);
                    } catch (NumberFormatException e) {
                        expYears = 0;
                    }
                }
                service.addGuide(name, specialty, bio, expYears);
            }

            request.setAttribute("successMessage", "Registered Successfully.");
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
        }
    }
}
