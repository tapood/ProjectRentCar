<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage User</title>
<script type="text/javascript">
	function checkEnter(event){
		if(event.keyCode==13||event.which==13)
		search();
	}

	function search(){
		var key = document.getElementById("search").value;
		window.location = "search?key="+key;
	}
	
	function add(){
		window.location = "addnewuser";
	}
	
	function deleteUser(id,username,password,firstname,lastname,telephone,email,status){
		if (confirm("no : "	+id 		+"\n"
				+"username : "	+	username	+"\n"
				+"password : "	+	password	+"\n"
				+"firstname : "	+	firstname	+"\n"
				+"lastname : "	+	lastname	+"\n"
				+"telephone : "	+	telephone	+"\n"
				+"email : "		+	email		+"\n"
				+"status : "	+	status		+"\n\n"
				+"Please press \"OK\" to confirm delete user.\n\n\n") == true)
		{
			window.location = window.location = "delete?id="+id;
		}
	}
</script>
<style type="text/css">
body {
	font-family: Tahoma;
	font-weight: 500;
	line-height: 26.4px;
	width: 70%;
	margin-left: 15%;
	border: 1px solid;
}

#header {
	height: 40px;
	padding-top: 15px;
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
				<b>Manage User</b>
				</td>
				<td>
					<span style="padding-left: 540px"> 
					<input id="search" placeholder="${keyword}" onkeypress="checkEnter(event)"
					style="padding-right: 10px; text-align: right; width: 150px;" />
							<button onclick="add()">New User</button>
					</span>
				</td>
			</tr>
		</table>
	</div>
	<table id="showUser">
		<tr style="background-color:#A1BAC9;">
			<td width="40px">No.</td>
			<td width="100px">Username</td>
			<td width="100px">Password</td>
			<td width="110px">Firstname</td>
			<td width="120px">Lastname</td>
			<td width="100px">Telephone</td>
			<td width="150px">Email</td>
			<td width="70px">Status</td>
			<td width="100px">Option</td>
		</tr>
		<c:forEach var="user" items="${userList}">
			<tr>
				<td>${user.id}</td>
				<td>${user.username}</td>
				<td>${user.password}</td>
				<td>${user.firstname}</td>
				<td>${user.lastname}</td>
				<td>${user.telephone}</td>
				<td>${user.email}</td>
				<td>${user.status}</td>
				<td><a href="editadmin?id=${user.id}"><button>Edit</button></a>
					<button onclick="deleteUser(${user.id},'${user.username}','${user.password}','${user.firstname}','${user.lastname}','${user.telephone}','${user.email}','${user.status}')">Delete</button></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>