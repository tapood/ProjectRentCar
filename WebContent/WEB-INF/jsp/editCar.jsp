<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Car Information</title>
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
#padding-left{
	padding-left:20px;
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
	<div id="header" style="background-color:#B2D0E4;">
		<b>Edit car information</b>
	</div>
	<br>
	<div id="padding-left">
	<form:form action="/RentCarSpring/rentcar/saveEditCar" method="POST" modelAttribute="car">
	<table>
	<form:input path="id" type="hidden"/>
	<form:input path="status" type="hidden"/>
		<tr>
			<td width="50px">Maker </td>	
			<td><form:input style="width:120px;" path="maker"/></td>
		</tr>
		<tr>
			<td>Model </td>
			<td><form:input style="width:120px;" path="model" /></td>
		</tr>
		<tr>
			<td>Color </td>
			<td><form:input style="width:120px;" path="color"/></td>
		</tr>
		<tr>
			<td>Gear </td>
			<td><form:input style="width:120px;" path="gear"/></td>
		</tr>
		<tr>
			<td>Engine </td>
			<td><form:input style="width:120px;" path="engine"/></td>
		</tr>
		<tr>
			<td>Passenger </td>
			<td><form:input style="width:120px;" path="passenger"/></td>
		</tr>
		<tr>
			<td>Price </td>
			<td><form:input style="width:120px;" path="cost"/></td>
		</tr>
		<tr>
			<td>Picture </td>
			<td><form:input style="width:120px;" path="picture"/></td>
		</tr>
		<tr>
			<td style="width:100px;">
				<button type="submit" style="margin-left:40px;width:60px;height:30px;margin-top:10px">Save</button>
			</td>
			</form:form>
			<form action="/RentCarSpring/rentcar/manageCar">
			<td>
				<button type="submit" style="margin-left:15px;width:60px;height:30px;margin-top:10px">Cancel</button>
			</td>
			</form>
		</tr>
	</table>
	</div><br>
	</div>
</body>
</html>