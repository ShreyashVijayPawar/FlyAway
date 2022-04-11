<%@page import="com.simplilearn.util.HibernateUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Home</title>
</head>

<body background="/FlyAway/bgImg.jpg">
	<%
		if (HibernateUtil.newHttpSession == null) {
			response.sendRedirect("AdminLogin.jsp");
		} else {
	%>
	
	<br>
	
	<div align="center">
		<font size="7" style="color: brown;"><b>Welcome to Fly Away</b></font>
	</div>
	
	<br>
	
	<div align="right">
		<p style="text-align: center; width: 25%; border: 1px solid black; background-color: wheat; font-size: larger;">
			<b>User: </b> <%=HibernateUtil.newHttpSession.getAttribute("email")%>
		</p>
		<a href="LogOut.jsp">Log Out</a>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>

	<div align="center">
		<div style="width: 20%; border: 1px solid black; background-color: rosybrown;">
			<a href="NewFlight.jsp">Add New Flight</a> 
			<br> 
			<a href="SearchFlight.jsp">Search for a Flight</a>
			<br> 
			<a href="Locations.jsp">Location Available</a>
			<br> 
			<a href="/FlyAway/ViewAllFlights">View All Available Flights</a>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>