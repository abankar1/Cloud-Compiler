<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.souce.GlobalFunction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title><%@ include file="projectTitle.jsp"%></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
	<div id="header">
		<div class="clearfix">
			<div class="logo">
				<h2><%@ include file="projectTitle.jsp"%></h2>
			</div>
			<ul class="navigation">
				<li><a href="adminHome.jsp">Home</a></li>
				<li><a href="addAssignment.jsp">Add Assignment</a></li>
				<li class="active"><a>view</a>
					<div>
						<a href="adminAssignmentList.jsp">Assignment List</a> 
						<a href="adminViewSolveAssi.jsp">Solve Assignment</a>
					</div></li>
				<li><a href="viewSolveOutput.jsp">View Output</a></li>
				
				<li><a href="LogoutServlet">Logout</a></li>
			</ul>
		</div>
	</div>
	<div id="contents">
		<div id="adbox">
			<div class="clearfix">
				<div align="right">

					Welcome: &nbsp;<font style="color: green"><%=session.getAttribute("uname")%>&nbsp;&nbsp;&nbsp;&nbsp;</font>
				</div>
				<div align="center">
					<br /> <br />
					<h3>View In Details</h3>
					<div align="center">
						<h3>
						<%
						//Assignment ID
						
						String ass=request.getParameter("assignment");
						
						
						%>
						
							Assignment:- <label><%=ass%></label>
						</h3>
						<br />
						<form action="GenerateOutput" method="post">
							<table border="2" cellpadding="10" cellspacing="2">
								<tr>
									<td align="center"><b>Program</b></td>
									<td align="center"><b>Output</b></td>
								</tr>
								<tr>
									<%
										String stud_as_id = request.getParameter("stud_as_id");
									String assignment = request.getParameter("assignment");
									
									
									System.out.println("stud_as_id "+stud_as_id);
									
									
									
										//System.out.println("Ritesh Surange "+stud_as_id)
									%>
									<td><input type="hidden" name="stud_as_id" value="<%=stud_as_id%>">
									<textarea rows="15" name="program" cols="40" readonly="readonly"><%=request.getParameter("program")%></textarea>
									</td>
									<td><textarea rows="10" cols="25" readonly="readonly"><%=request.getParameter("output")%></textarea>
									</td>
								</tr>
								<tr>
									<td><input type="submit" value="Generate Output"></td>
									<td></td>
								</tr>

							</table>
						</form>
					</div>
					<%
					String as_id=request.getParameter("as_id");
					if(as_id!=null)
					{
						Connection conn1=DbConnection.getConnection();
						PreparedStatement ps=conn1.prepareStatement("SELECT * FROM `solve_assignment` where stud_as_id='"+as_id+"'");
						ResultSet rs=ps.executeQuery();
						
						
					%>
					Ritesh Surange
					
						
					<% 
					}
					%>

					<br />
					 
					<br /> <br /> 
				</div>


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