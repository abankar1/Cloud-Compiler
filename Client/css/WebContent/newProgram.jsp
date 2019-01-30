<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title><%@ include file="projectTitle.jsp"%></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<%
	if (request.getParameter("login") != null) {
		out.print("<script>alert('Login Successfully')</script>");
	}
%>

<body>

	<div id="header">
		<div class="clearfix">
			<div class="logo">
				<h2><%@ include file="projectTitle.jsp"%></h2>
			</div>
			<ul class="navigation">
				<li class="active"><a href="studentHome.jsp">Home</a></li>
				<li><a href="studNewAssignment.jsp">Assignment</a></li>
				<li><a href="studEditAssignment.jsp">Solve Assignment</a></li>
				<li><a href="studViewSolveOutput.jsp">View Output</a></li>
				<li><a href="LogoutServlet">Logout</a></li>
			</ul>
		</div>
	</div>
	<div id="contents">
		<div id="adbox">
			<div class="clearfix">
				<div align="right">
					Welcome: <font style="color: green"><%=session.getAttribute("fname")%>&nbsp;<%=session.getAttribute("lname")%>&nbsp;&nbsp;</font>
				</div>
				<div align="center">
					<br />
					<h3>
						Welcome on Android Compiler <br />
						<%=session.getAttribute("fname")%>&nbsp;<%=session.getAttribute("lname")%></h3>
					
				</div>

				<div align="center">
				
				<%
				
				String nas_id = request.getParameter("nas_id");
 		Connection con1 = DbConnection.getConnection();
 		Statement stm1 = con1.createStatement();
 		System.out.println("new assignment ID " + nas_id);
 		ResultSet rs1 = stm1.executeQuery("select * from assignment where assignment_id='"+ nas_id + "'");
 		if (rs1.next()) 
 		{
	 %>
								<h1 align="center">New Assignment</h1> <br />
								<form action="AddNewProgram" method="post">
									<table border="1" cellpadding="5" cellspacing="3">
										<tr align="center">
											<td>Assignment:-<%=rs1.getString("assignment")%> 
											<input type="hidden" name="assignment" value="<%=rs1.getString("assignment")%>"> 
											<input type="hidden" name="ass_id" value="<%=nas_id%>"> 
											</td>
										</tr>
										<tr align="center">
											<td>Enter Only Program :&nbsp;&nbsp;<input type="text" name="program_name" placeholder="ProgramName" required>
											</td>
										</tr>
										<tr>
											<td><textarea rows="20" cols="50" name="program" placeholder="Write a Program here" required></textarea></td>
										</tr>
										<tr align="center">
											<td><input type="submit" value="Send To Server"></td>
										</tr>



									</table>

								</form> <%
 

 	}
 %>

				</div>


				<br /> <br /> <br /> <br />

			</div>
		</div>


	</div>
	<div id="footer">

		<div id="footnote">
			<div class="clearfix">
				<div class="connect"></div>
				<p>© Copyright 2023 Manes Winchester. All Rights Reserved.</p>
			</div>
		</div>
	</div>
</body>
</html>