<%@page import="com.simplilearn.util.HibernateUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>New Flight</title>
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
		<p
			style="text-align: center; width: 25%; border: 1px solid black; background-color: wheat; font-size: larger;">
			<b>User: </b>
			<%=HibernateUtil.newHttpSession.getAttribute("email")%>
		</p>
		<a href="LogOut.jsp">Log Out</a>
	</div>

	<br>
	<br>
	<br>
	<br>

	<form method="post" action="NewFlight">
		<table align="center"
			style="width: 25%; height: 30%; background-color: rosybrown; border: 1px solid black;">
			<tr>
				<td colspan=3 style="text-align: center;"><font size=5><b>Insert
							New Flight Details</b></font></td>
			</tr>
			<tr>
				<td align="right"><label for="name">Name :</label></td>
				<td><input type="text" id="name" name="name"
					placeholder="Enter Name of Flight" required /></td>
			</tr>
			<tr>
				<td align="right"><label for="from">From :</label></td>
				<td><select name="fromLocation" id="from" required>
						<option value="">Select</option>
						<option value="Mumbai">Mumbai</option>
						<option value="Delhi">Delhi</option>
						<option value="Pune">Pune</option>
						<option value="Nagpur">Nagpur</option>
						<option value="Hyderabad">Hyderabad</option>
						<option value="Mysore">Mysore</option>
						<option value="Bangluru">Bangluru</option>
						<option value="Chennai">Chennai</option>
						<option value="Amritsar">Amritsar</option>
				</select></td>
			</tr>
			<tr>
				<td align="right"><label for="to">To :</label></td>
				<td><select name="toLocation" id="to" required>
						<option value="">Select</option>
						<option value="Mumbai">Mumbai</option>
						<option value="Delhi">Delhi</option>
						<option value="Pune">Pune</option>
						<option value="Nagpur">Nagpur</option>
						<option value="Hyderabad">Hyderabad</option>
						<option value="Mysore">Mysore</option>
						<option value="Bangluru">Bangluru</option>
						<option value="Chennai">Chennai</option>
						<option value="Amritsar">Amritsar</option>
				</select></td>
			</tr>
			<tr>
				<td align="right"><label for="departure">Departure :</label></td>
				<td><input type="date" id="departure" name="departure" required />
				</td>
			</tr>
			<tr>
				<td align="right"><label for="time">Time :</label></td>
				<td><input type="time" id="time" name="time"
					placeholder="Enter Time of Flight" required /></td>
			</tr>
			<tr>
				<td align="right"><label for="price">Price :</label></td>
				<td><input type="number" id="price" name="price"
					placeholder="Enter Amount of Flight Fare" required /></td>
			</tr>
			<tr>
				<td align="right"><label for="seats">Seat Capacity :</label></td>
				<td><input type="number" id="seats" name="seats"
					placeholder="Enter Seat Capacity of Flight" required /></td>
			</tr>
			<tr>
				<td align="right">
					<button type="submit">Submit</button>
				</td>
				<td>
					<button type="reset">Reset</button>
				</td>
			</tr>
		</table>
	</form>
	<br>
	<center>
		<div style="width: 10%; text-align: center; color: red; font-size: large; background-color: thistle;">
			<a href="AdminHome.jsp">Go To Home Page</a>
		</div>
	</center>
	<%
		} else {
	%>

	<div align="center">
		<p
			style="width: 70%; text-align: center; color: red; font-size: x-large; background-color: thistle;">
			This Functionality is only Applicable for Admin... <br> Please
			Login as Admin... <br> <a href="AdminLogin.jsp">Go To Admin
				Login Page</a>
		</p>
	</div>

	<%
		}
			}
		}
	%>
</body>
</html>