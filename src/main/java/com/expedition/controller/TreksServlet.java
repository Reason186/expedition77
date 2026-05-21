package com.expedition.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import com.expedition.model.Trek;
import com.expedition.service.TrekService;

@WebServlet(asyncSupported = true, name = "treks", urlPatterns = { "/treks" })
public class TreksServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public TreksServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String difficulty = request.getParameter("difficulty");
        String search = request.getParameter("search");

        TrekService trekService = new TrekService();
        List<Trek> allTreks = trekService.getAllTreks();
        List<Trek> filteredTreks = new ArrayList<>();

        for (Trek trek : allTreks) {
            boolean matchesDifficulty = true;
            boolean matchesSearch = true;

            if (difficulty != null && !difficulty.trim().isEmpty()) {
                matchesDifficulty = trek.getDifficulty().equalsIgnoreCase(difficulty.trim());
            }

            if (search != null && !search.trim().isEmpty()) {
                String searchLower = search.trim().toLowerCase();
                matchesSearch = trek.getName().toLowerCase().contains(searchLower) ||
                                trek.getShortDescription().toLowerCase().contains(searchLower);
            }

            if (matchesDifficulty && matchesSearch) {
                filteredTreks.add(trek);
            }
        }

        request.setAttribute("trekList", filteredTreks);
        request.getRequestDispatcher("/WEB-INF/pages/treks.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
