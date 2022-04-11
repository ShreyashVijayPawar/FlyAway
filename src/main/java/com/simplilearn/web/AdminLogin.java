package com.simplilearn.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.simplilearn.dao.UserDao;
import com.simplilearn.model.UserCred;
import com.simplilearn.util.HibernateUtil;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserDao userDao;
	private static PrintWriter out;

	public void init() {
		userDao = new UserDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		validateUser(request, response);
	}

	public void validateUser(HttpServletRequest request, HttpServletResponse response) {
		RequestDispatcher requestDispatcher1 = request.getRequestDispatcher("AdminHome.jsp");
		RequestDispatcher requestDispatcher2 = request.getRequestDispatcher("AdminLogin.jsp");
		boolean validAdminFlag = false;
		String message;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			System.out.println("IO Exception occured while getting printwriter object...");
			System.out.println("Please Try Again by restarting the application...");
		}

		UserCred userCred = new UserCred();
		userCred.setUserName(request.getParameter("email"));
		userCred.setPassword(request.getParameter("password"));

		if (userCred.getUserName().equals("admin@gmail.com")) {
			validAdminFlag = userDao.validateUser(userCred);
		}

		if (validAdminFlag) {
			try {
				if (HibernateUtil.newHttpSession == null) {
					HibernateUtil.newHttpSession = request.getSession();
					HibernateUtil.newHttpSession.setAttribute("email", userCred.getUserName());
				}else {
					HibernateUtil.newHttpSession = null;
					HibernateUtil.newHttpSession = request.getSession();
					HibernateUtil.newHttpSession.setAttribute("email", userCred.getUserName());
				}
				requestDispatcher1.include(request, response);
			} catch (ServletException e2) {
				System.out.println("Servlet Exception occured while redirecting to AdminHome.jsp page...");
				System.out.println("Please Try Again by restarting the application...");
			} catch (IOException e3) {
				System.out.println("IO Exception occured while redirecting to AdminHome.jsp page...");
				System.out.println("Please Try Again by restarting the application...");
			}
		} else {
			message = "<div align=\"center\"><p style=\"width: 30%; text-align: center; color: red; font-size: x-large; background-color: thistle;\">Invalid Admin Email/Password...</p></div>";
			out.println(message);
			try {
				requestDispatcher2.include(request, response);
			} catch (ServletException e2) {
				System.out.println("Servlet Exception occured while redirecting to AdminLogin.jsp page...");
				System.out.println("Please Try Again by restarting the application...");
			} catch (IOException e3) {
				System.out.println("IO Exception occured while redirecting to AdminLogin.jsp page...");
				System.out.println("Please Try Again by restarting the application...");
			}
		}
	}
}
