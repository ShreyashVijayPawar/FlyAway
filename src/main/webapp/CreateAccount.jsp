<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Account</title>
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
	
	<form method="post" action="CreateAccount">
		<table align="center"
			style="width: 30%; height: 30%; background-color: rosybrown; border: 1px solid black;">
			<tr>
				<td colspan=3>
					<center>
						<font size=5><b>Create New Account</b></font>
					</center>
				</td>
			</tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr>
				<td align="right"><label for="email">Email :</label></td>
				<td><input type="email" name="email" pattern="[A-Za-z0-9]*[@][a-z]*[.](com|in|org)" id="email"
					placeholder="Enter Email in format 'user@gmail.com'" size="35" required /></td>
			</tr>
			<tr>
				<td align="right"><label for="password">Password :</label></td>
				<td><input type="password" id="password" name="password" size="35" placeholder="Enter Password" required></td>
			</tr>
			<tr>
				<td align="right"><label for="name">Name :</label></td>
				<td><input type="text" id="name" name="name" size="35" placeholder="Enter Your Name" required></td>
			</tr>
			<tr>
				<td align="right"><label for="phone">Phone No. :</label></td>
				<td><input type="text" id="phone" name="phone" size="35" pattern="[0-9]{10}" maxlength="10" 
					placeholder="Enter 10 Digit Phone No." required></td>
			</tr>
			<tr>
				<td align="right"><label for="aadhar">Aadhar No. :</label></td>
				<td><input type="text" id="aadhar" name="aadhar" size="35" pattern="[0-9]{12}" maxlength="12"
					placeholder="Enter 12 Digit Aadhar No." required></td>
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
</body>
</html>