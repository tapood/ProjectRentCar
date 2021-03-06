<%@page import="java.util.List"%>
<%@page import="th.co.project.model.Car"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Car</title>
<style type="text/css">
body {
	font-family: Tahoma;
	font-weight: 500;
	line-height: 26.4px;
	width: 55%;
	margin-left: 25%;
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
</style>
<script type="text/javascript">
	function checkEnter(event){
		if(event.keyCode==13||event.which==13)
		search();
	}

	function search(){
		var key = document.getElementById("search").value;
		window.location = "searchcars?key="+key;
	}
</script>
</head>
<body>
	<%@include file="login_header.jsp"%>
	<div id="header" style="background-color:#EFF5FB;">
		<table>
			<tr>
				<td>
				<b>Select your desired car</b>
				</td>
				<td>
					<span style="padding-left: 350px"> 
					<input id="search" placeholder="${keyword}" onkeypress="checkEnter(event)"
					style="padding-right: 10px; text-align: right; width: 130px;" />
					</span>
				</td>
			</tr>
		</table>
	</div>
	<table>
		<% int row = 0; 
			if(request.getAttribute("carList")!=null){
				List<Car> carList = (List<Car>) request.getAttribute("carList");	
		%>
		<c:forEach var="car" items="${carList}">
				<% Car car = carList.get(row); %>
			<tr>
				<td><img src="${car.picture}" /></td>
				<td style="width:220px;padding-left:10px;">Model : ${car.maker} ${car.model} 
				<br> Engine : ${car.engine} 
				<br> Gear : ${car.gear} 
				<br> Passenger : <%
					for (int i = 0; i <car.getPassenger(); i++) 
					{ %> 
					<img src="http://www.sixtthailand.com/img/people.png" /> 
					<%
					} row++;
					%>
				</td>
				<td>
					<font size="3pt"><b>Price Per Day <font color="orange"> THB ${car.cost}</font></b></font><br>
					<div align="center">
						<% if(car.getStatus().equalsIgnoreCase("available")){ %>
						<a href="detail?id=${car.id}"><button>Booking</button></a><br>
						<font color="green">${car.status }</font>
						<% } else { %>
						<a href="detail?id=${car.id}"><input type="button" value="Booking" disabled/></a><br>
						<font color="red">${car.status }</font>
						<% } %>
					</div>
				</td>
			</tr>
		</c:forEach>
		<% } %>
	</table>
</body>
</html>