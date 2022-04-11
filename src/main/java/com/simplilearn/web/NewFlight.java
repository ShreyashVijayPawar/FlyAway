package com.simplilearn.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.simplilearn.dao.FlightDao;
import com.simplilearn.model.Flight;

@WebServlet("/NewFlight")
public class NewFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static FlightDao flightDao;
	private static PrintWriter out;

	public void init() throws ServletException {
		flightDao = new FlightDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		addNewFlight(request, response);
	}

	public void addNewFlight(HttpServletRequest request, HttpServletResponse response) {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("AdminHome.jsp");
		String message;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			System.out.println("IO Exception occured while getting printwriter object...");
			System.out.println("Please Try Again by restarting the application...");
		}

		Flight flight = new Flight();
		flight.setName(request.getParameter("name"));
		flight.setFromLocation(request.getParameter("fromLocation"));
		flight.setToLocation(request.getParameter("toLocation"));
		flight.setDeparture(request.getParameter("departure"));
		flight.setTime(request.getParameter("time"));
		flight.setPrice(Integer.parseInt(request.getParameter("price")));
		flight.setAvailableSeats(Integer.parseInt(request.getParameter("seats")));

		boolean newFlightAdditionFlag = flightDao.addFlight(flight);

		if (!newFlightAdditionFlag) {
			message = "<div align=\"center\"><p style=\"width: 30%; text-align: center; color: green; font-size: x-large; background-color: thistle;\">New Flight "
					+ flight.getName() + " Added Successfully...</p></div>";
			out.println(message);
			try {
				requestDispatcher.include(request, response);
			} catch (ServletException e2) {
				System.out.println("Servlet Exception occured while redirecting to AdminHome.jsp page...");
				System.out.println("Please Try Again by restarting the application...");
			} catch (IOException e3) {
				System.out.println("IO Exception occured while redirecting to AdminHome.jsp page...");
				System.out.println("Please Try Again by restarting the application...");
			}
		} else {
			message = "<div align=\"center\"><p style=\"width: 30%; text-align: center; color: red; font-size: x-large; background-color: thistle;\">Not able to Add Flight "
					+ flight.getName() + "</p></div>";
			out.println(message);
			try {
				requestDispatcher.include(request, response);
			} catch (ServletException e2) {
				System.out.println("Servlet Exception occured while redirecting to AdminHome.jsp page...");
				System.out.println("Please Try Again by restarting the application...");
			} catch (IOException e3) {
				System.out.println("IO Exception occured while redirecting to AdminHome.jsp page...");
				System.out.println("Please Try Again by restarting the application...");
			}
		}
	}
}
