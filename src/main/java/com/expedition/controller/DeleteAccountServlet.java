package com.expedition.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import com.expedition.dao.UserDAO;

@WebServlet(asyncSupported = true, name = "deleteAccount", urlPatterns = { "/delete-account" })
public class DeleteAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteAccountServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/dashboard");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String email = (String) session.getAttribute("userEmail");
        String action = request.getParameter("action");

        try {
            UserDAO dao = new UserDAO();
            if ("soft".equals(action)) {
                dao.softDeleteUser(email);
                session.invalidate();
                request.getSession(true).setAttribute("errorMessage", "Your account has been deactivated successfully.");
                response.sendRedirect(request.getContextPath() + "/login");
            } else if ("hard".equals(action)) {
                dao.hardDeleteUser(email);
                session.invalidate();
                request.getSession(true).setAttribute("errorMessage", "Your account has been permanently deleted.");
                response.sendRedirect(request.getContextPath() + "/register");
            } else {
                response.sendRedirect(request.getContextPath() + "/dashboard");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/dashboard");
        }
    }
}
