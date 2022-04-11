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
	<%
		if (HibernateUtil.newHttpSession == null) {
			response.sendRedirect("index.jsp");
		} else {
	%>

	<div align="center">
		<font size="7" style="color: brown;"><b>FlyAway</b></font>
	</div>

	<div align="right">
		<p
			style="text-align: center; width: 25%; border: 1px solid black; background-color: wheat; font-size: larger;">
			<b>User: </b> <%=HibernateUtil.newHttpSession.getAttribute("email")%>
		</p>
		<a href="LogOut.jsp">Log Out</a>
	</div>

	<div style="text-align: center;">
		<%
			Boolean bookingStatus = (Boolean) request.getAttribute("bookingStatus");
				if (bookingStatus) {
		%>
		<h1 style="color: green;">
			<font size="7"><b>Payment Successful...</b></font> 
			<br> 
			<font size="7"><b>Your Flight is Booked Successfully...</b></font> 
			<br> 
			<font size="7"><b>Your Flight Id is <%=request.getAttribute("flightId")%></b></font>
			<br> 
			<font size="7"><b>Have a Safe Journey...</b></font> 
		</h1>
		<br>
		<%
			} else {
		%>

		<h1 style="color: red;">
			<font size="7"><b>Sorry... Payment Unsuccessful...</b></font> <br>
			<font size="7"><b>Flight Booking Failed...</b></font>
		</h1>

		<%
			}
		%>
		<div align="center">
			<p style="text-align: center; width: 25%; border: 1px solid black; background-color: rosybrown; font-size: larger;">
				<%
					if (HibernateUtil.newHttpSession.getAttribute("email").equals("admin@gmail.com")) {
				%>
				<a href="AdminHome.jsp">Go to Home Page</a>
				<%
					} else {
				%>
				<a href="SearchFlight.jsp">Go to Home Page</a>
				<%
					}
				%>
			</p>
		</div>
	</div>

	<%
		}
	%>
</body>
</html>