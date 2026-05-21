package com.expedition.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import com.expedition.dao.CustomTrekDAO;
import com.expedition.dao.UserDAO;

@WebServlet(asyncSupported = true, name = "postTrek", urlPatterns = { "/post-trek" })
public class PostTrekServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/dashboard");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || !"guide".equals(session.getAttribute("userRole"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            String trekName = request.getParameter("trekName");
            String durationStr = request.getParameter("duration");
            String difficulty = request.getParameter("difficulty");
            String maxAltitudeStr = request.getParameter("maxAltitude");
            String priceStr = request.getParameter("price");
            String shortDesc = request.getParameter("shortDesc");
            String longDesc = request.getParameter("longDesc");
            String groupSize = request.getParameter("groupSize");
            String image1 = request.getParameter("image1");
            String image2 = request.getParameter("image2");
            String image3 = request.getParameter("image3");

            if (trekName == null || trekName.trim().isEmpty() ||
                durationStr == null || durationStr.trim().isEmpty() ||
                priceStr == null || priceStr.trim().isEmpty() ||
                shortDesc == null || shortDesc.trim().isEmpty() ||
                longDesc == null || longDesc.trim().isEmpty() ||
                image1 == null || image1.trim().isEmpty() ||
                image2 == null || image2.trim().isEmpty() ||
                image3 == null || image3.trim().isEmpty()) {
                
                session.setAttribute("postError", "Please fill in all required fields, including all 3 trek images.");
                response.sendRedirect(request.getContextPath() + "/dashboard");
                return;
            }

            int duration = Integer.parseInt(durationStr.trim());
            int maxAltitude = 0;
            if (maxAltitudeStr != null && !maxAltitudeStr.trim().isEmpty()) {
                maxAltitude = Integer.parseInt(maxAltitudeStr.trim());
            }
            int price = Integer.parseInt(priceStr.trim());
            if (groupSize == null || groupSize.trim().isEmpty()) {
                groupSize = "1 - 10 People";
            }

            String email = (String) session.getAttribute("userEmail");
            String guideName = (String) session.getAttribute("userName");
            
            UserDAO userDao = new UserDAO();
            int guideId = userDao.getUserIdByEmail(email);

            if (guideId == -1) {
                session.setAttribute("postError", "Guide account not found. Please log in again.");
                response.sendRedirect(request.getContextPath() + "/dashboard");
                return;
            }

            CustomTrekDAO customTrekDao = new CustomTrekDAO();
            customTrekDao.insertCustomTrek(guideId, guideName, trekName, duration, difficulty, maxAltitude, price, shortDesc, longDesc, groupSize, image1, image2, image3);

            session.setAttribute("postSuccess", "Trek gig posted successfully! It is now live in the marketplace.");

        } catch (NumberFormatException e) {
            session.setAttribute("postError", "Invalid numeric values entered for duration, price, or altitude.");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("postError", "An error occurred while posting: " + e.getMessage());
        }

        response.sendRedirect(request.getContextPath() + "/dashboard");
    }
}
