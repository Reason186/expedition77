package com.expedition.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class AdminPanel
 */
@WebServlet(asyncSupported = true, name = "admin", urlPatterns = { "/admin" })
public class AdminPanel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPanel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Route Protection: Ensure only logged-in admins can access
		jakarta.servlet.http.HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("userEmail") == null || !"admin".equals(session.getAttribute("userRole"))) {
			response.sendRedirect(request.getContextPath() + "/admin-login?error=UnauthorizedAccess");
			return;
		}

		try {
			com.expedition.dao.UserDAO userDao = new com.expedition.dao.UserDAO();
			com.expedition.dao.BookingDAO bookingDao = new com.expedition.dao.BookingDAO();
			com.expedition.dao.ContactDAO contactDao = new com.expedition.dao.ContactDAO();

			int guidesCount = userDao.getActiveGuidesCount();
			int customersCount = userDao.getActiveCustomersCount();
			int bookingsCount = bookingDao.getTotalBookingsCount();
			int queriesCount = contactDao.getTotalQueriesCount();

			java.util.List<java.util.Map<String, Object>> recentQueries = contactDao.getRecentContactMessages(5);
			java.util.List<java.util.Map<String, Object>> allUsers = userDao.getAllUsers();

			request.setAttribute("guidesCount", guidesCount);
			request.setAttribute("customersCount", customersCount);
			request.setAttribute("bookingsCount", bookingsCount);
			request.setAttribute("queriesCount", queriesCount);
			request.setAttribute("recentQueries", recentQueries);
			request.setAttribute("allUsers", allUsers);

		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INF/pages/adminPanel.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
