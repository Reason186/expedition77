package com.expedition.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.expedition.model.Trek;
import com.expedition.service.TrekService;

@WebServlet(asyncSupported = true, name = "trekDetail", urlPatterns = { "/trek-detail" })
public class TrekDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public TrekDetailServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String trekId = request.getParameter("id");

        if (trekId == null || trekId.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/treks");
            return;
        }

        TrekService trekService = new TrekService();
        Trek trek = trekService.getTrekById(trekId);

        request.setAttribute("trek", trek);
        request.getRequestDispatcher("/WEB-INF/pages/trekDetail.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
