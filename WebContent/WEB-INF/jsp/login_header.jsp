<%@page import="th.co.project.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div align="right"
	style="padding-right: 10px; padding-bottom: 20px;padding-top:10px;background-color:#CEECF5;">
	<%
		if (session.getAttribute("user_login") != null) {
			User user = (User) session.getAttribute("user_login");
			%> 
			<font color="green">Welcome, <%=user.getStatus()%></font><br>
			<%=user.getFirstname()%>, <%=user.getLastname()%>
			<br>
			<% 
				if(user.getStatus().equalsIgnoreCase("admin")){
			%>
			<a href="/RentCarSpring/rentcar/manageCar"><button>ManageCar</button></a>
			<a href="/RentCarSpring/user/manageUser"><button>ManageUser</button></a>
			<a href="/RentCarSpring/rentcar/manageBooking"><button>ManageBooking</button></a>	
			<%
				}
			%>
			<a href="/RentCarSpring/rentcar/maker"><button>Home</button></a>
			<a href="/RentCarSpring/user/edit?id=<%=user.getId()%>"><button>Edit Profile</button></a>
			<a href="/RentCarSpring/user/logout"><button>Log Out</button></a>
	<%
		} else {
						
	%>
	<table style="text-align:right;">
		<tr>
			<td colspan="2" style="height:10px;padding-top:0px;padding-bottom:0px;">
				<font size="2">${msg}&nbsp</font>
			</td>
		</tr>
		<tr>
			<form:form action="/RentCarSpring/user/checkvalid"
				modelAttribute="user" method="post">
				<td style="padding-left: 20px;width:150;"><form:input path="username"
						type="text" style="width: 106px;" placeholder="username" /></td>
				<td style="padding-left: 10px;width:100px;"><form:input path="password"
						type="password" style="width: 106px;" placeholder="password" /></td>
		</tr>
		<tr>
			<td colspan="2" style="padding-left: 140px;width:500px">			
				<font size="2"><a href="/RentCarSpring/user/register">not member?</a></font>
				<button>Log In</button></td>
			</form:form>
		</tr>
	</table>
	<% } %>
</div>

