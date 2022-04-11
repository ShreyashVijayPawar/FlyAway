package com.simplilearn.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.simplilearn.dao.FlightDao;
import com.simplilearn.model.Flight;
import com.simplilearn.util.HibernateUtil;

@WebServlet("/SearchFlight")
public class SearchFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static FlightDao flightDao;
	private static PrintWriter out;

	public void init() throws ServletException {
		flightDao = new FlightDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		searchFlight(request, response);
	}

	public void searchFlight(HttpServletRequest request, HttpServletResponse response) {
		RequestDispatcher requestDispatcher1 = request.getRequestDispatcher("AvailableFlights.jsp");
		RequestDispatcher requestDispatcher2 = request.getRequestDispatcher("SearchFlight.jsp");
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			System.out.println("IO Exception occured while getting printwriter object...");
			System.out.println("Please Try Again by restarting the application...");
		}

		Integer seatsToBook = Integer.parseInt(request.getParameter("travellers"));

		Flight flight = new Flight();
		flight.setFromLocation(request.getParameter("fromLocation"));
		flight.setToLocation(request.getParameter("toLocation"));
		flight.setDeparture(request.getParameter("departure"));
		List<Flight> flightsList = flightDao.getFlights(flight, seatsToBook);

		if (!flightsList.isEmpty()) {
			try {
				request.setAttribute("list", flightsList);
				HibernateUtil.newHttpSession.setAttribute("list", flightsList);
				requestDispatcher1.include(request, response);
			} catch (ServletException e2) {
				System.out.println("Servlet Exception occured while redirecting to AvailableFlights.jsp page...");
				System.out.println("Please Try Again by restarting the application...");
			} catch (IOException e3) {
				System.out.println("IO Exception occured while redirecting to AvailableFlights.jsp page...");
				System.out.println("Please Try Again by restarting the application...");
			}
		} else {
			String message = "<div align=\"center\"><p style=\"width: 30%; text-align: center; color: red; font-size: x-large; background-color: thistle;\">No Flights Available...</p></div>";
			out.println(message);
			try {
				requestDispatcher2.include(request, response);
			} catch (ServletException e2) {
				System.out.println("Servlet Exception occured while redirecting to SearchFlight.jsp page...");
				System.out.println("Please Try Again by restarting the application...");
			} catch (IOException e3) {
				System.out.println("IO Exception occured while redirecting to SearchFlight.jsp page...");
				System.out.println("Please Try Again by restarting the application...");
			}
		}
	}
}
