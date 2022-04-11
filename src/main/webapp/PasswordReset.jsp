<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Password Reset</title>
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
	
	<form method="post" action="PasswordReset">
		<table align="center"
			style="width: 30%; height: 20%; background-color: rosybrown; border: 1px solid black;">
			<tr>
				<td colspan=3>
					<center>
						<font size=5><b>Reset Password</b></font>
					</center>
				</td>
			</tr>
			<tr>
				<td><label for="email">Email :</label></td>
				<td><input type="email" name="email" pattern="[A-Za-z0-9]*[@][a-z]*[.](com|in|org)" id="email"
					placeholder="abc@gmail.com" size="35" required /></td>
			</tr>
			<tr>
				<td><label for="password">New Password :</label></td>
				<td><input type="password" id="password" name="password" size="35" required></td>
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