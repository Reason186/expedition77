package com.expedition.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import com.expedition.dao.UserDAO;

@WebServlet(asyncSupported = true, name = "adminDeleteUser", urlPatterns = { "/admin/delete-user" })
public class AdminDeleteUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/admin");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || !"admin".equals(session.getAttribute("userRole"))) {
            response.sendRedirect(request.getContextPath() + "/admin-login");
            return;
        }

        try {
            String email = request.getParameter("email");
            String action = request.getParameter("action");
            String confirmed = request.getParameter("confirmed");
            String adminEmail = (String) session.getAttribute("userEmail");

            if (email != null && !email.trim().isEmpty() && !email.equalsIgnoreCase(adminEmail)) {
                if (!"true".equalsIgnoreCase(confirmed)) {
                    request.setAttribute("targetEmail", email);
                    request.setAttribute("targetAction", action);
                    request.getRequestDispatcher("/WEB-INF/pages/adminConfirmDelete.jsp").forward(request, response);
                    return;
                }

                UserDAO userDao = new UserDAO();
                if ("soft".equalsIgnoreCase(action)) {
                    userDao.softDeleteUser(email);
                } else if ("hard".equalsIgnoreCase(action)) {
                    userDao.hardDeleteUser(email);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/admin");
    }
}
