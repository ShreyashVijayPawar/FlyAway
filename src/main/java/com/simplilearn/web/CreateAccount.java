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

@WebServlet("/CreateAccount")
public class CreateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserDao userDao;
	private static PrintWriter out;

	public void init() throws ServletException {
		userDao = new UserDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		createNewAccount(request, response);
	}

	public void createNewAccount(HttpServletRequest request, HttpServletResponse response) {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("UserLogin.jsp");
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
		userCred.setName(request.getParameter("name"));
		userCred.setPhone(request.getParameter("phone"));
		userCred.setAadhar(request.getParameter("aadhar"));
		boolean acctCreationFlag = userDao.saveUser(userCred);

		if (acctCreationFlag) {
			message = "<div align=\"center\"><p style=\"width: 30%; text-align: center; color: green; font-size: x-large; background-color: thistle;\">User Account Created Successfully...</p></div>";
			out.println(message);
			try {
				requestDispatcher.include(request, response);
			} catch (ServletException e2) {
				System.out.println("Servlet Exception occured while redirecting to UserLogin.jsp page...");
				System.out.println("Please Try Again by restarting the application...");
			} catch (IOException e3) {
				System.out.println("IO Exception occured while redirecting to UserLogin.jsp page...");
				System.out.println("Please Try Again by restarting the application...");
			}
		} else {
			message = "<div align=\"center\"><p style=\"width: 30%; text-align: center; color: red; font-size: x-large; background-color: thistle;\">Not Able to Create New User Account... Please Try Again with Different User Name...</p></div>";
			out.println(message);
			try {
				requestDispatcher.include(request, response);
			} catch (ServletException e2) {
				System.out.println("Servlet Exception occured while redirecting to UserLogin.jsp page...");
				System.out.println("Please Try Again by restarting the application...");
			} catch (IOException e3) {
				System.out.println("IO Exception occured while redirecting to UserLogin.jsp page...");
				System.out.println("Please Try Again by restarting the application...");
			}
		}
	}
}
