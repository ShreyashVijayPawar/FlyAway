package com.simplilearn.util;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import com.simplilearn.model.Flight;
import com.simplilearn.model.UserCred;

public class HibernateUtil {
	public static SessionFactory sessionFactory;
	public static HttpSession newHttpSession;

	static {
		if (sessionFactory == null) {
			try {
				// Creating connection with DB
				Configuration configuration = new Configuration().configure();
				configuration.addAnnotatedClass(UserCred.class);
				configuration.addAnnotatedClass(Flight.class);
				StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder()
						.applySettings(configuration.getProperties());
				sessionFactory = configuration.buildSessionFactory(builder.build());
				System.out.println("Connection With DB is Successfully Established...");

			} catch (Exception e) {
				Sysystem.out.println("Inside catch block");
				System.out.println("Some error occured while connecting to database...");
				System.out.println("Connection With DB Failed...");
			}
		}
	}
}
