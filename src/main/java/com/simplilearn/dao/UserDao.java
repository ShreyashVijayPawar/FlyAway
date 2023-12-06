package com.simplilearn.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.simplilearn.model.UserCred;
import com.simplilearn.util.HibernateUtil;

public class UserDao {

	public static Transaction transaction;
	public static Session session;

	public boolean validateUser(UserCred userCred) {
		boolean validUserFlag = false;
		try {
			// Open session if it is not already open and begin transaction
			if (session == null) {
				session = HibernateUtil.sessionFactory.openSession();
			}
			
			// Fetching user based on user name provided
			System.out.println("Fetching user based on user name provided");
			UserCred tempUserCred = (UserCred) session.get(UserCred.class, userCred.getUserName());
			
			// Validating Password with temporarily stored user from DB for provided user name
			if (tempUserCred == null) {
				return validUserFlag;
			} else {
				System.out.println("Inside Else part");
				if (tempUserCred.getPassword().equals(userCred.getPassword())) {
					validUserFlag = true;
					return validUserFlag;
				}
			}
			
		} catch (Exception e) {
			System.out.println("Some error occured while validating user...");
		}
		return validUserFlag;
	}

	public boolean saveUser(UserCred userCred) {
		boolean userSaveFlag = false;
		transaction = null;
		
		try {
			// Open session if it is not already open and begin transaction
			if (session == null) {
				session = HibernateUtil.sessionFactory.openSession();
			}
			transaction = session.beginTransaction();

			// Save the User object and commit transaction
			session.save(userCred);
			transaction.commit();
			userSaveFlag = true;
		} catch (Exception e) {
			// Rolling back transaction if user is not saved successfully
			if (transaction != null) {
				System.out.println("Rolling back transaction as same user name already exists in database...");
				transaction.rollback();
			}
		}
		return userSaveFlag;
	}

	public boolean updatePassword(UserCred userCred) {
		boolean updateUserFlag = false;
		transaction = null;
		
		try {
			// Open session if it is not already open and begin transaction
			if (session == null) {
				session = HibernateUtil.sessionFactory.openSession();
			}
			transaction = session.beginTransaction();
			
			// Fetching Used based on user name provided
			UserCred tempUser = (UserCred) session.load(UserCred.class, userCred.getUserName());
			
			// Updating password for fetched user and committing transaction
			tempUser.setPassword(userCred.getPassword());
			transaction.commit();
			updateUserFlag = true;
			
		} catch (Exception e) {
			// Rolling back transaction if password is not updated successfully
			if (transaction != null) {
				System.out.println("Rolling back transaction as some error occured while updating password for admin");
				transaction.rollback();
			}
		}
		return updateUserFlag;
	}
}