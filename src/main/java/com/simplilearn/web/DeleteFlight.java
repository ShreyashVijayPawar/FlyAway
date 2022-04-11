package com.simplilearn.web;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.simplilearn.dao.FlightDao;

@WebServlet("/DeleteFlight")
public class DeleteFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static FlightDao flightDao;

	@Override
	public void init() {
		flightDao = new FlightDao();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		deleteFlight(request, response);
	}

	public void deleteFlight(HttpServletRequest request, HttpServletResponse response) {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("DeletionStatus.jsp");
		
		boolean deletionStatus = false;
		if (request.getParameter("id") != null) {
			Integer flightId = Integer.parseInt(request.getParameter("id"));
			deletionStatus = flightDao.deleteFlight(flightId);
			request.setAttribute("deletionStatus", !deletionStatus);
			request.setAttribute("deletedflightId", flightId);
			try {
				requestDispatcher.include(request, response);
			} catch (ServletException e1) {
				System.out.println("Servlet Exception occured while redirecting to DeletionStatus.jsp page...");
				System.out.println("Please Try Again by restarting the application...");
			} catch (IOException e2) {
				System.out.println("IO Exception occured while redirecting to DeletionStatus.jsp page...");
				System.out.println("Please Try Again by restarting the application...");
			}
		}
	}
}
