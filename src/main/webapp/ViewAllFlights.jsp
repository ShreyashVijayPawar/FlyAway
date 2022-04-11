<%@page import="com.simplilearn.util.HibernateUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.simplilearn.model.Flight"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<title>All Flights</title>
<style>
table, th, thead, tbody, td {
	border: 2px solid black;
	border-collapse: collapse;
}
</style>
</head>

<body background="/FlyAway/bgImg.jpg">
	<%
		if (HibernateUtil.newHttpSession == null) {
			response.sendRedirect("index.jsp");
		} else {
			if (HibernateUtil.newHttpSession.getAttribute("email") != null) {
				if (HibernateUtil.newHttpSession.getAttribute("email").equals("admin@gmail.com")) {
					List<Flight> allFlightsList = (List) HibernateUtil.newHttpSession.getAttribute("allFlights");
					if ((allFlightsList != null) && (!allFlightsList.isEmpty())) {
	%>

	<div align="center">
		<font size="7" style="color: brown;"><b>FlyAway</b></font>
	</div>

	<div align="right">
		<p
			style="text-align: center; width: 25%; border: 1px solid black; background-color: wheat; font-size: larger;">
			<b>User: </b>
			<%=HibernateUtil.newHttpSession.getAttribute("email")%>
		</p>
		<a href="LogOut.jsp">Log Out</a>
	</div>


	<center>
		<div
			style="width: 80%; background-color: rosybrown; border: 1px solid black;">
			<h3 class="text-center" style="font-size: x-large;">List of All
				Flights</h3>
			<table width="80%" border="0" cellspacing="2" cellpadding="5">
				<thead>
					<tr>
						<th>Flight Id</th>
						<th>Flight Name</th>
						<th>Source</th>
						<th>Destination</th>
						<th>Departure</th>
						<th>Time</th>
						<th>Fare</th>
						<th>Seats Available</th>
						<th>Delete Flight</th>
					</tr>
				</thead>
				<tbody>
					<%
						List<Flight> allFlights = (List) request.getAttribute("allFlights");
					%>
					<%
						for (Flight flight : allFlights) {
					%>
					<tr>
						<td><%=flight.getId()%></td>
						<td><%=flight.getName()%></td>
						<td><%=flight.getFromLocation()%></td>
						<td><%=flight.getToLocation()%></td>
						<td><%=flight.getDeparture()%></td>
						<td><%=flight.getTime()%></td>
						<td><%=flight.getPrice()%></td>
						<td><%=flight.getAvailableSeats()%></td>
						<td><a href="DeleteFlight?id=<%=flight.getId()%>">Delete
								Flight</a></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<br>
		</div>
		<br>
	<div style="width: 15%; text-align: center; color: red; font-size: x-large; background-color: thistle;">
		<a href="AdminHome.jsp">Go To Home Page</a>
	</div>
	</center>
	<%
		} else {
	%>
	<center>
		<p
			style="width: 30%; text-align: center; color: red; font-size: x-large; background-color: thistle;">
			No Flights Available to display<br>Please Try Again by Adding
			Some Flights...
		</p>

	</center>

	<br>
	<br>

	<div align="center">
		<a href="AdminHome.jsp">Go To Home Page</a>
	</div>
	<%
		}
				}
			}
		}
	%>
</body>
</html>