<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add User</title>
<style type="text/css">
body {
	font-family: Tahoma;
	font-weight: 500;
	line-height: 26.4px;
	width: 20%;
	margin-left: 40%;
	border: 1px solid;
}

#header{
	height: 40px;
	padding-top: 15px;
	padding-left: 50px;
}
button{
 	box-shadow: 1px 1px 1px black;
}

input[type='button']{
 	box-shadow: 1px 1px 1px black;
}

input[type='submit']{
 	box-shadow: 1px 1px 1px black;
}
</style>
</head>
<body>
<div style="background-color: #EEF2F4;">
	<br>
	<div id="header" style="background-color:#B2D0E4;">
		<b>Add new user</b>
	</div>
	<br>
	<form:form action="newuserbyadmin" method="POST" modelAttribute="newuser">
		<table align="center">
			<tr>
				<td colspan="2"><form:input path="username"
					placeholder="Username" /></td>
			</tr>
			<tr>
				<td colspan="2"><form:input type="password" path="password"
					placeholder="Password" /></td>
			</tr>
			<tr>
				<td colspan="2"><form:input path="firstname"
					placeholder="Firstname" /></td>
			</tr>
						<tr>
				<td colspan="2"><form:input path="lastname"
					placeholder="Lastname" /></td>
			</tr>
						<tr>
				<td colspan="2"><form:input path="telephone"
					placeholder="Telephone" /></td>
			</tr>
						<tr>
				<td colspan="2"><form:input type="email" path="email"
					placeholder="Email" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Save" style="width:60px;height:30px;margin-top:10px"/></td>
				</form:form>
				<form action="/RentCarSpring/user/manageUser">
				<td><button type="submit" style="width:60px;height:30px;margin-top:10px">Cancel</button></td>
				</form>
			</tr>
		</table>
		<br>
		</div>
</body>
</html>