<%@page import="com.simplilearn.util.HibernateUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Booking Status</title>
</head>
<body background="/FlyAway/bgImg.jpg">
	<div align="center">
		<font size="7" style="color: brown;"><b>FlyAway</b></font>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<%
		if (HibernateUtil.newHttpSession != null) {
			HibernateUtil.newHttpSession.invalidate();
			HibernateUtil.newHttpSession = null;

		} else {

		}
	%>

	<div style="text-align: center;">
		<h1 style="color: green;">
			<b>Logged Out Successfully...</b>
		</h1>
		<br> <a href="index.jsp">Go to Login Page</a>
	</div>
</body>
</html>