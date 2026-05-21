package com.expedition.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import com.expedition.dao.BookingDAO;
import com.expedition.dao.UserDAO;

@WebServlet(asyncSupported = true, name = "cancelBooking", urlPatterns = { "/cancel-booking" })
public class CancelBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/dashboard");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userName") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            String bookingIdStr = request.getParameter("bookingId");
            if (bookingIdStr != null && !bookingIdStr.trim().isEmpty()) {
                int bookingId = Integer.parseInt(bookingIdStr.trim());
                String email = (String) session.getAttribute("userEmail");

                UserDAO userDao = new UserDAO();
                int customerId = userDao.getUserIdByEmail(email);

                if (customerId != -1) {
                    BookingDAO bookingDao = new BookingDAO();
                    bookingDao.cancelBooking(bookingId, customerId);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/dashboard");
    }
}
