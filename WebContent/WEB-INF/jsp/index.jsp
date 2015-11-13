<%@page import="th.co.project.model.Logo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style type="text/css">
body {
	font-family: Tahoma;
	font-weight: 500;
	line-height: 26.4px;
	width: 50%;
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
		window.location = "searchmaker?key="+key;
	}
</script>
</head>
<body>
	<%@include file="login_header.jsp"%>
	<div id="header" style="background-color:#EFF5FB;">
		<table>
			<tr>
				<td>
				<b>Select your maker name</b>
				</td>
				<td>
					<span style="padding-left: 270px"> 
					<input id="search" placeholder="${keyword}" onkeypress="checkEnter(event)"
					style="padding-right: 10px; text-align: right; width: 130px;" />
					</span>
				</td>
			</tr>
		</table>
	</div>
	<div  style="background-color: #EFF5FB;">
	<table>
		<% int row = 0; %>
		<c:forEach var="logo" items="${logoList}">
		<% if(row%4==0){%><tr><%} %>
				<td width="164px"><a href="cars?key=${logo.name}"><img width="164px" height="164px" src="${logo.picture}"/></a></td>
		<% if(row%4==3){%></tr><%} row++;%>
		</c:forEach>
	</table>
	</div>
</body>
</html>