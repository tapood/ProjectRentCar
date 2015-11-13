<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transaction Done</title>
<style type="text/css">
body {
	font-family: Tahoma;
	font-weight: 500;
	line-height: 26.4px;
	width: 40%;
	margin-left: 30%;
	margin-top: 20px;
	border: 1px solid;
	text-align: center;
	padding-top:10px;
	padding-bottom:30px;
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
	<div id="header" style="background-color:#96B8CE;" >
		<b>Confirmation</b>
	</div>
	<br>
	<table align="center" style="width:500px;">
		<tr>
			<td colspan="2" style="text-align:left;">
			
			<b>Invoice No</b> : ${detail.id_renting}<br>
			Start Date : ${detail.start_date}<br>
			End Date   : ${detail.end_date}<br>
			Account No : ${detail.id_user}	
			</td>
		</tr>	
		<tr style="text-align:left;">
			<td>First Name : ${detail.firstname}</td>
			<td>Last Name : ${detail.lastname}</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:left;">
				Model : ${detail.maker} ${detail.model}
				<br> Color : ${detail.color}
				<br> Engine : ${detail.engine}
				<br> Gear : ${detail.gear}
				<br> Passenger :
				
				<c:forEach var="i" begin="1" end="${detail.passenger}">
					<img src="http://www.sixtthailand.com/img/people.png" />
				</c:forEach>
				<br> Total Cost : <b>${detail.total_cost} THB</b>
			</td>
		</tr>
	
	</table>
	<br>
	<a href="maker"><button>Back</button></a>
</body>
</html>