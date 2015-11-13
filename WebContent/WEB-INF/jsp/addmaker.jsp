<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Maker</title>
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
		<b>Add new maker</b>
	</div>
	<form:form action="newmaker" method="POST" modelAttribute="newlogo">
	<table style="padding-left:5px;font-size:14px;">
		<tr>
			<td style="padding-left:20px">Name</td>
			<td><form:input style="margin-left:5px;width:125px;" path="name" /></td>
			<td rowspan="3">
			<img id="showpic" style="padding-left:10px;padding-top:10px;padding-bottom:10px;" width="110px" height="110px" src="http://womensfooty.com/sites/all/modules/media_gallery/images/empty_gallery.png">
			</td>
		</tr>
		<tr>
			<td style="padding-left:20px">Logo</td>
			<td><form:input style="margin-left:5px;width:125px;"  path="picture" onchange="changeImg()"/></td>
		</tr>
		<tr>
			<td colspan style="padding-left:20px;text-align:center;padding-bottom:10px;">
				<input type="submit" value="Add"/></form:form>
			</td>
			<form action="addnewcar">
			<td colspan style="padding-left:10px;padding-bottom:10px;">
				<input type="submit" value="Cancel"/>
			</td>
			</form>
		</tr>
	</table>
</div>
</body>
</html>