<%@page import="com.simplilearn.util.HibernateUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.simplilearn.model.Flight"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<title>Available Flights</title>
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
			List<Flight> flightList = (List) HibernateUtil.newHttpSession.getAttribute("list");
			if ((flightList != null) && (!flightList.isEmpty())) {
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
	
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<center>
		<div style="width: 80%; height: 50%; background-color: rosybrown; border: 1px solid black;">
			<h3 class="text-center" style="font-size: x-large;">List of Flights</h3>
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
						<th>Book Tickets</th>
					</tr>
				</thead>
				<tbody>
					<%
						List<Flight> flights = (List) request.getAttribute("list");
					%>
					<%
						for (Flight flight : flights) {
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
						<td><a href="FlightBooking?id=<%=flight.getId()%>">Make Payment & Book Flight</a></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</center>
	<%
		} else {
	%>
	<center>
		<p style="width: 30%; text-align: center; color: red; font-size: x-large; background-color: thistle;">Please Search for Flights</p>
	</center>
	
	<br>
	<br>
	
	<div align="center">
		<a href="SearchFlight.jsp">Search Flights</a>
	</div>
	<%
		}
		}
	%>
</body>
</html>