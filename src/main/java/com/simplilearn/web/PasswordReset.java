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

@WebServlet("/PasswordReset")
public class PasswordReset extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserDao userDao;
	private static PrintWriter out;

	public void init() {
		userDao = new UserDao();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		updatePassword(request, response);
	}

	public void updatePassword(HttpServletRequest request, HttpServletResponse response){
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("AdminLogin.jsp");
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

		boolean passwordResetFlag = userDao.updatePassword(userCred);

		if (!passwordResetFlag) {
			message = "<div align=\"center\"><p style=\"width: 30%; text-align: center; color: green; font-size: x-large; background-color: thistle;\">Password Successfully Reset for Admin...</p></div>";
			out.println(message);
			try {
				requestDispatcher.include(request, response);
			} catch (ServletException e2) {
				System.out.println("Servlet Exception occured while redirecting to AdminLogin.jsp page...");
				System.out.println("Please Try Again by restarting the application...");
			} catch (IOException e3) {
				System.out.println("IO Exception occured while redirecting to AdminLogin.jsp page...");
				System.out.println("Please Try Again by restarting the application...");
			}
		} else {
			message = "<div align=\"center\"><p style=\"width: 30%; text-align: center; color: red; font-size: x-large; background-color: thistle;\">Not able to Reset Password... Please Contact Administrator...</p></div>";
			out.println(message);
			try {
				requestDispatcher.include(request, response);
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
