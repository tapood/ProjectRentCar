<%@page import="th.co.project.model.Car"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Car</title>
<script type="text/javascript">
	function checkEnter(event){
		if(event.keyCode==13||event.which==13)
		search();
	}

	function search(){
		var key = document.getElementById("search").value;
		window.location = "search?key="+key;
	}
	
	function deleteCar(id,maker,model,engine,gear,passenger,cost){
		var key = document.getElementById("search").value;
		if (confirm("no : "		+	id 		+"\n"
				+"model : "		+	maker	+" "+ model +"\n"
				+"engine : "	+	engine	+"\n"
				+"gear : "		+	gear	+"\n"
				+"passenger : "	+	passenger	+"\n"
				+"cost : "		+	cost	+"\n\n"
				+"Please press \"OK\" to confirm delete car.\n\n\n") == true)
		{
			 window.location = "delete?key="+key+"&id="+id;
		}
	}
</script>
<style type="text/css">
body {
	font-family: Tahoma;
	font-weight: 500;
	line-height: 26.4px;
	width: 40%;
	margin-left: 30%;
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
</head>
<body>
	<%@include file="login_header.jsp"%>
	<div id="header" style="background-color:#EFF5FB;">
		<table>
			<tr>
				<td>
				<b>Manage Car</b>
				</td>
				<td>
					<span style="padding-left: 160px"> 
					<input id="search" placeholder="${keyword}" onkeypress="checkEnter(event)"
					style="padding-right: 10px; text-align: right; width: 130px;" />
							<a href="addnewcar"><button>New Car</button></a>
					</span>
				</td>
			</tr>
		</table>
	</div>
	<table>
		<c:forEach var="car" items="${manage_carList}">
			<tr>
				<td><img src="${car.picture}" /></td>
				<td style="width:250px;padding-left:10px;"><b>${car.maker} ${car.model} </b>
				<br> Engine : ${car.engine} 
				<br> Gear : ${car.gear} 
				<br> Passenger : ${car.passenger}
				<br> Price : ${car.cost} THB
				<br>
				<div style="padding-top:5px;">
					<a href="edit?id=${car.id}"><button>Edit</button></a>
					<button onclick="deleteCar(${car.id},'${car.maker}','${car.model}','${car.engine}','${car.gear}',${car.passenger},${car.cost})">Delete</button>
				</div>
				</td>
			</tr>
		</c:forEach>
	</table>
</html>