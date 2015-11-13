<%@page import="th.co.project.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Profile</title>
<style type="text/css">
body {
	font-family: Tahoma;
	font-weight: 500;
	line-height: 26.4px;
	width: 25%;
	margin-left: 40%;
	border: 1px solid;
}

#header{
	height: 40px;
	padding-top: 15px;
	padding-left: 50px;
}
#padding-left{
	padding-left:60px;
}
button{
 	box-shadow: 1px 1px 1px black;
}

input[type='button']{
 	box-shadow: 1px 1px 1px black;
}
</style>
</head>
<body>
<div style="background-color: #EEF2F4;">
	<br>
	<div id="header" style="background-color:#B2D0E4;">
		<b>Edit Profile</b>
	</div>
	<br>
	<div id="padding-left">
	<form:form action="/RentCarSpring/user/saveEditProfileAdmin" method="POST" modelAttribute="user">
	<table>
		<form:input path="id" type="hidden"/>
		<tr>
			<td>no.</td>	
			<td>	<input style="width:120px;" value="${user.id}" disabled/></td>
		</tr>
		<tr>
			<td>username </td>	
			<td><form:input style="width:120px;" path="username" /></td>
		</tr>
		<tr>
			<td>password </td>
			<td><form:input style="width:120px;" path="password" type="password" /></td>
		</tr>
		<tr>
			<td>firstname </td>
			<td><form:input style="width:120px;" path="firstname"/></td>
		</tr>
		<tr>
			<td>lastname </td>
			<td><form:input style="width:120px;" path="lastname"/></td>
		</tr>
		<tr>
			<td>telephone </td>
			<td><form:input style="width:120px;" path="telephone"/></td>
		</tr>
		<tr>
			<td>email </td>
			<td><form:input style="width:120px;" path="email" type="email"/></td>
		</tr>
		<tr>
			<td>status </td>
			<td><form:select path="status" >
					<option value="${user.status}" selected>${user.status}</option>
					<option value=""></option>
					<option value="member">member</option>
					<option value="admin">admin</option>
					<option value="banned">banned</option>
				</form:select>
		</tr>
		<tr>
			<td style="width:100px;">
				<button type="submit" style="width:60px;height:30px;margin-top:10px">Save</button>
			</td>
			</form:form>
			<form action="/RentCarSpring/user/manageUser">
			<td>
				<button type="submit" style="width:60px;height:30px;margin-top:10px">Cancel</button>
			</td>
			</form>
		</tr>
	</table>
	</div>
	<br>
	</div>
</body>
</html>