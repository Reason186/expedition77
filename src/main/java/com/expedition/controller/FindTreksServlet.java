package com.expedition.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import com.expedition.model.Trek;
import com.expedition.model.Guide;
import com.expedition.service.TrekService;
import com.expedition.dao.UserDAO;

@WebServlet(asyncSupported = true, name = "findTreks", urlPatterns = { "/find-treks" })
public class FindTreksServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FindTreksServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userName") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            TrekService trekService = new TrekService();
            List<Trek> treks = trekService.getAllTreks();

            UserDAO userDao = new UserDAO();
            List<Guide> guides = userDao.getAllGuides();

            if (guides == null || guides.isEmpty()) {
                guides = new ArrayList<>();
                Guide fallback1 = new Guide();
                fallback1.setId(1);
                fallback1.setName("Pemba Sherpa");
                fallback1.setSpecialty("High-Altitude Peak Climbing");
                fallback1.setBio("Pemba has climbed Mt. Everest 5 times and has been guiding for over a decade.");
                fallback1.setExperienceYears(12);
                fallback1.setTreksCompleted(48);
                fallback1.setRating(4.9);
                fallback1.setReviewCount(36);
                fallback1.setPhotoUrl("pemba.jpg");
                guides.add(fallback1);
            }

            request.setAttribute("trekList", treks);
            request.setAttribute("guideList", guides);

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/WEB-INF/pages/findTreks.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
