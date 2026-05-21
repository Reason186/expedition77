package com.expedition.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(asyncSupported = true, name = "updateProfile", urlPatterns = { "/update-profile" })
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateProfileServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userName") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.getRequestDispatcher("/WEB-INF/pages/updateProfile.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userName") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String profilePic = request.getParameter("profilePic");

            if (name == null || name.trim().isEmpty()) {
                request.setAttribute("profileMessage", "Name cannot be empty.");
                request.setAttribute("profileStatus", "error");
                request.getRequestDispatcher("/WEB-INF/pages/updateProfile.jsp").forward(request, response);
                return;
            }

            String role = (String) session.getAttribute("userRole");
            if ("guide".equals(role)) {
                if (profilePic == null || profilePic.trim().isEmpty()) {
                    request.setAttribute("profileMessage", "Profile picture is compulsory for guides.");
                    request.setAttribute("profileStatus", "error");
                    request.getRequestDispatcher("/WEB-INF/pages/updateProfile.jsp").forward(request, response);
                    return;
                }
            }

            String email = (String) session.getAttribute("userEmail");
            com.expedition.dao.UserDAO userDao = new com.expedition.dao.UserDAO();
            userDao.updateUser(email, name, phone, profilePic);

            session.setAttribute("userName", name);
            session.setAttribute("userPhone", phone);
            session.setAttribute("userProfilePic", profilePic);

            request.setAttribute("profileMessage", "Profile updated successfully.");
            request.setAttribute("profileStatus", "success");
            request.getRequestDispatcher("/WEB-INF/pages/updateProfile.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("profileMessage", "Something went wrong. Please try again. Error: " + e.getMessage());
            request.setAttribute("profileStatus", "error");
            request.getRequestDispatcher("/WEB-INF/pages/updateProfile.jsp").forward(request, response);
        }
    }
}
