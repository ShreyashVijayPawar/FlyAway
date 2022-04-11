<%@page import="com.simplilearn.util.HibernateUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Flight</title>
</head>
<body background="/FlyAway/bgImg.jpg">
	<%
		if (HibernateUtil.newHttpSession == null) {
			response.sendRedirect("index.jsp");
		} else {
	%>
	<div align="center">
		<font size="7" style="color: brown;"><b>Welcome to Fly Away</b></font>
	</div>

	<div align="right">
		<p style="text-align: center; width: 25%; border: 1px solid black; background-color: wheat; font-size: larger;">
			<b>User: </b> <%=HibernateUtil.newHttpSession.getAttribute("email")%>
		</p>
		<a href="LogOut.jsp">Log Out</a>
	</div>
	
	<br>
	<br>
	<br>
	
	<form method="post" action="SearchFlight">
		<table align="center"
			style="width: 30%; height: 35%; background-color: rosybrown; border: 1px solid black;">
			<tr>
				<td colspan=3>
					<center>
						<font size=5><b>Search Flight</b></font>
					</center>
				</td>
			</tr>
			<tr>
				<td align="right"><label for="from">From :</label></td>
				<td><select name="fromLocation" id="from">
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
				<td><select name="toLocation" id="to">
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
				<td><input type="date" id="departure" name="departure" /></td>
			</tr>
			<tr>
				<td align="right"><label for="travellers">Travellers :</label>
				</td>
				<td><input type="number" id="travellers" name="travellers" placeholder="Enter No. of travellers" /></td>
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
	<%
		}
	%>
</body>
</html>