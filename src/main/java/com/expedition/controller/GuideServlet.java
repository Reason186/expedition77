package com.expedition.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.expedition.dao.GuideDAO;
import com.expedition.model.Guide;

@WebServlet(asyncSupported = true, urlPatterns = { "/guides" })
public class GuideServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GuideServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			GuideDAO dao = new GuideDAO();
			List<Guide> guideList = dao.getAllGuides();
			request.setAttribute("guideList", guideList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INF/pages/guides.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
