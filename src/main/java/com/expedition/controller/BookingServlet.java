package com.expedition.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(asyncSupported = true, name = "booking", urlPatterns = { "/booking" })
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public BookingServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userName") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String trekId = request.getParameter("trekId");
        if (trekId != null && !trekId.trim().isEmpty()) {
            com.expedition.service.TrekService trekService = new com.expedition.service.TrekService();
            com.expedition.model.Trek trek = trekService.getTrekById(trekId);
            request.setAttribute("trek", trek);
        }

        request.getRequestDispatcher("/WEB-INF/pages/booking.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userName") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            String trekId = request.getParameter("trekId");
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String trekDateStr = request.getParameter("trekDate");
            String groupSizeStr = request.getParameter("groupSize");
            String specialRequests = request.getParameter("specialRequests");

            if (fullName == null || fullName.trim().isEmpty() ||
                trekDateStr == null || trekDateStr.trim().isEmpty() ||
                trekId == null || trekId.trim().isEmpty()) {
                request.setAttribute("bookingMessage", "Please fill in all required fields.");
                request.setAttribute("bookingStatus", "error");
                request.getRequestDispatcher("/WEB-INF/pages/booking.jsp").forward(request, response);
                return;
            }

            com.expedition.service.TrekService trekService = new com.expedition.service.TrekService();
            com.expedition.model.Trek trek = trekService.getTrekById(trekId);
            if (trek == null) {
                request.setAttribute("bookingMessage", "Invalid trek selected.");
                request.setAttribute("bookingStatus", "error");
                request.getRequestDispatcher("/WEB-INF/pages/booking.jsp").forward(request, response);
                return;
            }

            request.setAttribute("trek", trek);

            int groupSize = 1;
            try {
                groupSize = Integer.parseInt(groupSizeStr);
            } catch (Exception e) {}

            double totalPrice = trek.getPrice() * groupSize;
            java.sql.Date trekDate = java.sql.Date.valueOf(trekDateStr);

            com.expedition.dao.UserDAO userDao = new com.expedition.dao.UserDAO();
            int customerId = userDao.getUserIdByEmail(email);
            if (customerId == -1) {
                String sessionEmail = (String) session.getAttribute("userEmail");
                customerId = userDao.getUserIdByEmail(sessionEmail);
            }

            if (customerId == -1) {
                request.setAttribute("bookingMessage", "User account not found. Please log in again.");
                request.setAttribute("bookingStatus", "error");
                request.getRequestDispatcher("/WEB-INF/pages/booking.jsp").forward(request, response);
                return;
            }

            com.expedition.dao.BookingDAO bookingDao = new com.expedition.dao.BookingDAO();
            bookingDao.insertBooking(customerId, trekId, trek.getName(), trekDate, groupSize, totalPrice, specialRequests);

            request.setAttribute("bookingMessage", "Booking submitted successfully! We will confirm shortly.");
            request.setAttribute("bookingStatus", "success");
            request.getRequestDispatcher("/WEB-INF/pages/booking.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("bookingMessage", "Something went wrong. Please try again. Error: " + e.getMessage());
            request.setAttribute("bookingStatus", "error");
            request.getRequestDispatcher("/WEB-INF/pages/booking.jsp").forward(request, response);
        }
    }
}
