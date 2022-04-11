<%@page import="com.simplilearn.util.HibernateUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Locations</title>
<style>
table, th, td {
	border: 2px solid black;
	border-collapse: collapse;
	text-align: center;
}
</style>
</head>

<body background="/FlyAway/bgImg.jpg">
	<%
		if (HibernateUtil.newHttpSession == null) {
			response.sendRedirect("AdminLogin.jsp");
		} else {
			if (HibernateUtil.newHttpSession.getAttribute("email") != null) {
				if (HibernateUtil.newHttpSession.getAttribute("email").equals("admin@gmail.com")) {
	%>

	<div align="center">
		<font size="7" style="color: brown;"><b>FlyAway</b></font>
	</div>
	<div align="right">
		<a href="LogOut.jsp">Log Out</a>
	</div>
	<br>
	<br>
	<center>
		<div style="width: 20%; background-color: rosybrown;">
			<h3 class="text-center" style="font-size: x-large;">
				<p style="color: green;">All Available Locations</p>
			</h3>
			<table width="90%" cellspacing="1" cellpadding="3">
				<thead>
					<th>Source Location</th>
					<th>Destination</th>
				</thead>
				<tbody>
					<tr>
						<td>Mumbai</b></td>
						<td>Mumbai</td>
					</tr>
					<tr>
						<td>Delhi </b></td>
						<td>Delhi</td>
					</tr>
					<tr>
						<td>Pune</td>
						<td>Pune</td>
					</tr>
					<tr>
						<td>Nagpur</td>
						<td>Nagpur</td>
					</tr>
					<tr>
						<td>Hyderabad</td>
						<td>Hyderabad</td>
					</tr>
					<tr>
						<td>Mysore</td>
						<td>Mysore</td>
					</tr>
					<tr>
						<td>Bangluru</td>
						<td>Bangluru</td>
					</tr>
					<tr>
						<td>Chennai</td>
						<td>Chennai</td>
					</tr>
					<tr>
						<td>Amritsar</td>
						<td>Amritsar</td>
					</tr>
				</tbody>
			</table>
			<br>
		</div>
	</center>
	<div align="center">
		<p style="text-align: center; width: 10%; border: 1px solid black; background-color: tan; font-size: larger;">
			<a href="AdminHome.jsp">Go to Home Page</a>
		</p>
	</div>
	<%
		}else{
	%>
	<div align="center">
		<p style="width: 70%; text-align: center; color: red; font-size: x-large; background-color: thistle;">
			This Functionality is only Applicable for Admin... <br> Please
			Login as Admin... <br> <a href="AdminLogin.jsp">Go To Admin
				Login Page</a> <br> <a href="SearchFlight.jsp">Go To Home Page</a>
		</p>
	</div>
	<%
		}
		}
		}
	%>
</body>
</html>