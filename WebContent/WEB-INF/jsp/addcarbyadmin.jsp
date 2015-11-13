<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Car</title>
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
select{
	font-size:9pt;
}
input{
	font-size:9pt;
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
<script type="text/javascript">
	function changeImg(){
		document.getElementById("showpic").src = document.getElementById("picture").value;
	}
</script>
</head>
<body>
<div style="background-color: #EEF2F4;">
	<br>
	<div id="header" style="background-color:#B2D0E4;">
		<b>Add new car</b>
	</div>
	<br>
	<form:form action="newcarbyadmin" method="POST" modelAttribute="newcar">
		<table align="center" style="font-size:11pt;">
			<tr>
				<td>Maker</td>
				<td>
				<form:select id="selectMaker()" path="maker" onchange="addMore(this.value)">
					<c:forEach var="logo" items="${logoList}">
						<option value="${logo.name}">${logo.name}</option>
					</c:forEach>		
				</form:select>		
				<a href="addmaker"><input type="button" value="Add"/></a>	
				</td>
			</tr>
			<tr>
				<td>Model</td>
				<td><form:input path="model"></form:input></td>
			</tr>
			<tr>
				<td>Color</td>
				<td>
				<form:select path="color">
						<option value="Red">Red</option>
						<option value="Blue">Blue</option>
						<option value="Green">Green</option>	
						<option value="Yellow">Yellow</option>
						<option value="Orange">Orange</option>
						<option value="Brown">Brown</option>
						<option value="Grey">Grey</option>	
						<option value="Black">Black</option>
						<option value="White">White</option>			
				</form:select>			
				</td>
			</tr>
			<tr>
				<td>Engine</td>
				<td>
				<form:select path="engine">
						<option value="Diesel">Diesel</option>
						<option value="Petrol">Petrol</option>				
				</form:select>				
				</td>
			</tr>
			<tr>
				<td>Passenger</td>
				<td>
					<form:input value="1" type="number" path="passenger" min="1" max="30"/>			
				</td>
			</tr>
			<tr>
				<td>Gear</td>
				<td>
				<form:select path="gear">
						<option value="automatic">Automatic</option>
						<option value="manual">Manual</option>				
				</form:select>				
				</td>
			</tr>
			<tr>
				<td>Cost</td>
				<td>
					<form:input value="0" type="number" path="cost" min="0" max="1000000"/>	<font size="2pt">THB</font>	
				</td>
			</tr>
			<tr>
				<td>Picture</td>
				<td>
				<form:input path="picture" id="picture" onchange="changeImg()"/>			
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;"><img id="showpic" style="padding-top:10px;" width="225px" height="150px" src="http://womensfooty.com/sites/all/modules/media_gallery/images/empty_gallery.png"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Save" style="width:60px;height:30px;margin-top:10px"/></td>
				</form:form>
				<form action="/RentCarSpring/rentcar/manageCar">
				<td><button type="submit" style="width:60px;height:30px;margin-top:10px">Cancel</button></td>
				</form>
			</tr>
		</table>
		<br>
</div>
</body>
</html>