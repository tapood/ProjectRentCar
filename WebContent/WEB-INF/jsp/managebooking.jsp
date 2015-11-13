<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Booking</title>
<script type="text/javascript">

	function search(key){
		window.location = "searchbooking?key="+key;
	}
	
	function showUserInfo(id,username,password,firstname,lastname,telephone,email,status){
		alert("no : "	+id 		+"\n"
				+"username : "	+	username	+"\n"
				+"password : "	+	password	+"\n"
				+"firstname : "	+	firstname	+"\n"
				+"lastname : "	+	lastname	+"\n"
				+"telephone : " +	telephone   +"\n"
				+"email : " 	+	email		+"\n"
				+"status : "	+	status		+"\n"
				);
	}
	
	function showCarInfo(id,maker,model,color,engine,gear,passenger,cost){
		alert("no : "	+id 		+"\n"
				+"model : "		+	maker	+" "+ model +"\n"
				+"color : "		+	color	+"\n"
				+"engine : "	+	engine	+"\n"
				+"gear : "		+	gear	+"\n"
				+"passenger : " +	passenger   +"\n"
				+"cost : "		+	cost	+"\n"
				);
	}
	
	function changeStatus(username,maker,model,total_cost,rid,status,charge){
		if (confirm("user : "	+	username 	+"\n"
				+"status : " 	+ 	status		+" car \n"
				+"model : "		+	maker	+ " " +		model	+"\n"
				+"total cost : "	+	total_cost	+"\n"
				+"Please press \"OK\" to confirm "+ username + " " + status + " car.") == true)
		{
			window.location = "changeRentStatus?status="+status+"&rid="+rid+"&charge="+charge;
		}
	}
	
	function deleteRenting(rid){
		if (confirm("Please press \"OK\" to confirm delete.") == true)
		{
			window.location = "deleteRenting?rid="+rid;
		}
	}
	
</script>
<style type="text/css">
body {
	font-family: Tahoma;
	font-weight: 500;
	line-height: 26.4px;
	width: 74%;
	margin-left: 13%;
	border: 1px solid;
}

#header {
	height: 40px;
	padding-top: 10px;
	padding-left: 50px;
}
#showUser td{
	padding-left: 4px;
	border-left: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
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
				<b>Manage Booking</b>
				</td>
				<td>
					<span style="padding-left: 550px"> 	
							<button onclick="search('reserved')">Reserved</button>
							<button onclick="search('received')">Received</button>
							<button onclick="search('returned')">Returned</button>
							<button onclick="search('')">All</button>
					</span>
				</td>
			</tr>
		</table>
	</div>
	<table id="showUser">		
		<tr style="background-color:#A1BAC9;">
			<td width="40px">No.</td>
			<td width="40px">UID</td>
			<td width="40px">CID</td>
			<td width="90px">Total Cost</td>
			<td width="110px">Start Date</td>
			<td width="110px">End Date</td>
			<td width="160px">Remaining</td>
			<td width="110px">Charge</td>
			<td width="80px">Status</td>
			<td width="240px" colspan="2" style="text-align:center;">Option</td>
		</tr>
		<c:forEach var="rent" items="${rentList}">
			<tr>
				<td width="40px">${rent.id_renting}</td>
				<td width="40px">
					<a href="#" onclick="showUserInfo(${rent.id_user},
					'${rent.username}','${rent.password}',
					'${rent.firstname}','${rent.lastname}',
					'${rent.telephone}','${rent.email}','${rent.user_status}')">
					${rent.id_user}</a>
				</td>
				<td width="40px">
					<a href="#" onclick="showCarInfo(${rent.id_car},
					'${rent.maker}','${rent.model}',
					'${rent.color}','${rent.engine}',
					'${rent.gear}','${rent.passenger}',${rent.cost})">
					${rent.id_car}</a>
				</td>
				<td width="90px">${rent.total_cost}</td>
				<td width="110px">${rent.start_date}</td>
				<td width="110px">${rent.end_date}</td>
				<td width="160px">${rent.showRemainingDate()}</td>
				<td width="110px">${rent.showCharge()}</td>
				<td width="80px">${rent.status}</td>
				<td width="130px">${rent.printButton()}</td>
				<td width="60px">${rent.printButtonDelete()}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>