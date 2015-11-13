<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="th.co.project.model.Car"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Detail</title>
<script>

	function rentDays(cost){
		var today = new Date();
 		var rent_date = document.getElementById("rent_date").value;
 		var last_day = new Date(rent_date);
 		var temp = (last_day.getTime()-today.getTime())/(1000*3600*24); 		
 		var day = Math.ceil(temp);
		document.getElementById("totalCost").innerHTML = cost*day;	
		document.getElementById("numOfDays").innerHTML = day;	
	}
	
	function submit(cost){
		var today = new Date();
 		var rent_date = document.getElementById("rent_date").value;
 		var last_day = new Date(rent_date);
 		var temp = (last_day.getTime()-today.getTime())/(1000*3600*24); 		
 		var day = Math.ceil(temp);
 		if(day<=0){
 			alert("Error Date!!");	
 		}
 		else{
 			var sd = document.getElementById("start_date").value;
 			var ed = document.getElementById("rent_date").value;
 			var id_car = document.getElementById("id_car").value;
 			var id_user = document.getElementById("id_user").value;
 			var tc = day*cost;
 			
 			var maker = document.getElementById("maker").value;
 			var model = document.getElementById("model").value;
 			var color = document.getElementById("color").value;
 			var passenger = document.getElementById("passenger").value;
 			var gear = document.getElementById("gear").value;
 			var engine = document.getElementById("engine").value;
 			
 			if(id_user!=-1){
 				if (confirm(maker+" "+model+"\n"
 						+"Color : "+color+"\n"
 						+"Engine : "+engine+"\n"
 						+"Gear : "+gear+"\n"
 						+"Passenger : "+passenger+"\n\n"
 						+"Rent Day : "+day+" Day(s)\n"
 						+"Total Cost : "+tc+" THB\n\n"
 						+"Please press \"OK\" to confirm your reservation?\n\n\n") == true)
 				{
 					window.location = 'booking?uid='+id_user+'&cid='+id_car+'&tc='+tc+'&sd='+sd+'&ed='+ed;
 				}
 			}
 			else
 			{
 				alert("Please login before you make any reservation.");
 			}	
 		}
	}
</script>
<style type="text/css">
body {
	font-family: Tahoma;
	font-weight: 500;
	line-height: 26.4px;
	width: 50%;
	margin-left: 25%;
	border: 1px solid;
}

#showdetail {
	padding-left: 50px;
	padding-top: 20px;
	padding-bottom: 30px;
}

#header {
	height: 40px;
	padding-top: 15px;
	padding-left: 50px;
}

input[type="date"] {
	width: 140px;
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
	<div id="header" style="background-color: #EFF5FB;">
		<b>Select your desired car</b>
	</div>
	<div id="showdetail">
		<table width="600px">
			<tr>
				<td colspan="2"><img src="${car.picture}" /></td>
			</tr>
			<tr>
			<input type="hidden" id="maker" value="${car.maker}"/>
			<input type="hidden" id="model" value="${car.model}"/>
			<input type="hidden" id="color" value="${car.color}"/>
			<input type="hidden" id="engine" value="${car.engine}"/>
			<input type="hidden" id="gear" value="${car.gear}"/>
			<input type="hidden" id="passenger" value="${car.passenger}"/>
			
				<td width="200px"><b>Model : ${car.maker} ${car.model}</b> <br>
					Color : ${car.color} <br> Engine : ${car.engine} <br>
					Gear : ${car.gear} <br> Passenger : <%
 	if (request.getAttribute("car") != null) {
 		Car c = (Car) request.getAttribute("car");
 		for (int i = 0; i < c.getPassenger(); i++) {
 %> <img src="http://www.sixtthailand.com/img/people.png" /> <%
 	}
 	}
 %></td>
				<td style="padding-left: 40px"><font size="3"> <input
						type="radio" checked><b>Pay upon arrival</b>
						&nbsp&nbsp&nbsp&nbsp&nbsp <font size="2">per day</font>&nbsp&nbsp&nbsp&nbsp&nbsp
						<b>THB &nbsp<font color="orange">${car.cost}</font>
					</b> <%
 	Date today_date = new Date();
 	String today = new SimpleDateFormat("yyyy-MM-dd").format(today_date);
 	Date min_date = Calendar.getInstance().getTime();
 	min_date.setDate(min_date.getDate() + 1);
 	String min = new SimpleDateFormat("yyyy-MM-dd").format(min_date);
 	Date max_date = new Date();
 	max_date.setDate(max_date.getDate() + 30);
 	String max = new SimpleDateFormat("yyyy-MM-dd").format(max_date);
 %>
				</font>

					<table>
						<tr>
							<td align="right"><font size="2">Start Date</font></td>
							<td><input id="start_date" type="date" value="<%=today%>"
								disabled /></td>
						</tr>
						<tr>
							<td align="right"><font size="2">End Date</font></td>
							<td><input id="rent_date" type="date" min="<%=min%>"
								max="<%=max%>" value="<%=min%>" onchange="rentDays(${car.cost})" />
							</td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td colspan="2">
					<table>
						<tr>
							<td width="1000px"><font size="5"><br>Your total
									price:&nbsp&nbsp <b> <span id="totalCost">${car.cost}</span>&nbsp&nbspTHB
								</b></font> <br>
							<font size="2" color="grey">Rental period: <span
									id="numOfDays">1</span> day(s)
							</font> <input type="hidden" id="id_car" value="${car.id}" /> <%
 	if (session.getAttribute("user_login") != null) {
 		User user = (User) session.getAttribute("user_login");
 %> <input type="hidden" id="id_user" value="<%=user.getId()%>" /> <%
 	} else
 	{ %>
 	<input type="hidden" id="id_user" value="-1" />
 	 <% } %>
							</td>
							<td style="padding-top: 20px; padding-left: 10px;">
								<button onclick="submit(${car.cost})"
									style="width: 200px; height: 80px; lightgrey; text-align: left; padding-left: 20px">
									<b><font size="3">Pay upon arrival</font></b> <br>Click to
									next step
								</button>
							</td>
						</tr>
					</table>

				</td>
			</tr>
		</table>
	</div>

</body>
</html>