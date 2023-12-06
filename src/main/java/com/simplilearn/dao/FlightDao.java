package com.simplilearn.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.simplilearn.model.Flight;
import com.simplilearn.util.HibernateUtil;

public class FlightDao {

	public static Transaction transaction;
	public static Session session;

	public boolean addFlight(Flight flight) {
		boolean flightAddFlag = false;
		transaction = null;

		try {
			// Open session if it is not already open and begin transaction
			System.out.println("Open session if it is not already open and begin transaction");
			if (session == null) {
				session = HibernateUtil.sessionFactory.openSession();
			}
			transaction = session.beginTransaction();

			// Save the Flight object and commit transaction
			session.save(flight);
			transaction.commit();
			flightAddFlag = true;
			
		} catch (Exception e) {
			// Rolling back transaction if it is not successful
			if (transaction != null) {
				System.out.println("Rolling back transaction as some error occured while saving flight Object");
				transaction.rollback();
			}
		}
		return flightAddFlag;
	}

	public List<Flight> getFlights(Flight flight, Integer seatsToBook) {
		List<Flight> flights = new ArrayList<Flight>();
		transaction = null;

		try {
			// Open session if it is not already open and begin transaction
			if (session == null) {
				session = HibernateUtil.sessionFactory.openSession();
			}
			transaction = session.beginTransaction();

			// Creating Query to fetch available flights which are matching provided criteria
			String queryString = "from Flight where from_location = '" + flight.getFromLocation() + "' AND ";
			queryString = queryString + "to_location = '" + flight.getToLocation() + "' AND ";
			queryString = queryString + "departure = '" + flight.getDeparture() + "' AND available_seats > "
					+ seatsToBook;

			// Fetching list of available flights and committing transaction
			flights = session.createQuery(queryString).list();
			transaction.commit();

		} catch (Exception e) {
			// Rolling back transaction if it is not successful
			if (transaction != null) {
				System.out.println("Rolling back transaction as some error occured while fetching flight Objects");
				transaction.rollback();
			}
		}
		return flights;
	}
	
	public List<Flight> getAllFlights() {
		List<Flight> allFlights = new ArrayList<Flight>();
		transaction = null;

		try {
			// Open session if it is not already open and begin transaction
			if (session == null) {
				session = HibernateUtil.sessionFactory.openSession();
			}
			transaction = session.beginTransaction();

			// Fetching list of available flights and committing transaction
			allFlights = session.createQuery("from Flight").list();
			transaction.commit();

		} catch (Exception e) {
			// Rolling back transaction if it is not successful
			if (transaction != null) {
				System.out.println("Rolling back transaction as some error occured while fetching flight Objects");
				transaction.rollback();
			}
		}
		return allFlights;
	}

	public boolean bookSeats(Integer flightId) {
		boolean seatBookFlag = false;
		transaction = null;

		try {
			// Open session if it is not already open and begin transaction
			if (session == null) {
				session = HibernateUtil.sessionFactory.openSession();
			}
			transaction = session.beginTransaction();

			// Fetching Flight object and updating available seats and then committing the transaction
			Flight flight = session.get(Flight.class, flightId);
			if (flight != null) {
				flight.setAvailableSeats(flight.getAvailableSeats() - 1);
				session.update(flight);
				transaction.commit();
				seatBookFlag = true;
			}
			
		} catch (Exception e) {
			// Rolling back transaction if it is not successful
			if (transaction != null) {
				System.out.println("Rolling back transaction as some error occured while booking flight");
				transaction.rollback();
			}
		}
		return seatBookFlag;
	}
	
	public boolean deleteFlight(Integer flightId) {
		boolean flightDeletionFlag = false;
		transaction = null;

		try {
			// Open session if it is not already open and begin transaction
			if (session == null) {
				session = HibernateUtil.sessionFactory.openSession();
			}
			transaction = session.beginTransaction();

			// Fetching Flight object and deleting that flight and then committing the transaction
			Flight flight = session.get(Flight.class, flightId);
			if (flight != null) {
				session.delete(flight);
				transaction.commit();
				flightDeletionFlag = true;
			}
			
		} catch (Exception e) {
			// Rolling back transaction if it is not successful
			if (transaction != null) {
				System.out.println("Rolling back transaction as some error occured while deleting flight");
				transaction.rollback();
			}
		}
		return flightDeletionFlag;
	}
}