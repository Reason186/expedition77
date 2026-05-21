package com.expedition.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import com.expedition.model.Trek;
import com.expedition.model.Guide;
import com.expedition.service.TrekService;
import com.expedition.dao.UserDAO;

@WebServlet(asyncSupported = true, name = "dashboard", urlPatterns = { "/dashboard" })
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DashboardServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userName") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String role = (String) session.getAttribute("userRole");
        String destinationPage = "/WEB-INF/pages/dashboard.jsp";

        try {
            String email = (String) session.getAttribute("userEmail");
            com.expedition.dao.UserDAO userDao = new com.expedition.dao.UserDAO();
            int userId = userDao.getUserIdByEmail(email);

            if ("admin".equals(role)) {
                response.sendRedirect(request.getContextPath() + "/admin");
                return;
            } else if ("guide".equals(role)) {
                com.expedition.dao.CustomTrekDAO customTrekDao = new com.expedition.dao.CustomTrekDAO();
                java.util.List<java.util.Map<String, Object>> gigs = customTrekDao.getCustomTreksByGuideId(userId);
                request.setAttribute("gigs", gigs);
                
                com.expedition.dao.BookingDAO bookingDao = new com.expedition.dao.BookingDAO();
                java.util.List<java.util.Map<String, Object>> guideBookings = bookingDao.getBookingsForGuide(userId);
                request.setAttribute("guideBookings", guideBookings);
                
                destinationPage = "/WEB-INF/pages/guideDashboard.jsp";
            } else {
                java.util.List<java.util.Map<String, Object>> bookings = new java.util.ArrayList<>();
                if (userId != -1) {
                    com.expedition.dao.BookingDAO bookingDao = new com.expedition.dao.BookingDAO();
                    bookings = bookingDao.getBookingsByCustomerId(userId);
                }
                request.setAttribute("bookings", bookings);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher(destinationPage).forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
