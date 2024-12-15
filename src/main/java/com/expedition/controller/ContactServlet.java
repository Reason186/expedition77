package com.expedition.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(asyncSupported = true, name = "contact", urlPatterns = { "/contact" })
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ContactServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String subject = request.getParameter("subject");
            String message = request.getParameter("message");

            if (name == null || name.trim().isEmpty() || email == null || email.trim().isEmpty() || message == null || message.trim().isEmpty()) {
                request.setAttribute("contactMessage", "Please fill in all required fields.");
                request.setAttribute("contactStatus", "error");
                request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
                return;
            }

            com.expedition.dao.ContactDAO contactDao = new com.expedition.dao.ContactDAO();
            contactDao.insertContactMessage(name, email, subject, message);

            request.setAttribute("contactMessage", "Thank you for reaching out! We will get back to you soon.");
            request.setAttribute("contactStatus", "success");
            request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("contactMessage", "Something went wrong. Please try again. Error: " + e.getMessage());
            request.setAttribute("contactStatus", "error");
            request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
        }
    }
}
