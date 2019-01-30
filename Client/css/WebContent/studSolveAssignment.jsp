<%@page import="com.util.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>

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
				<li><a href="studentHome.jsp">Home</a></li>
				<li><a href="studNewAssignment.jsp">New Assignment</a></li>
				
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
					<br /> <br /> <br /> <br />
					<h3>Solve Assignment List</h3>
					<br />
					<table border="1" cellpadding="5">
						<tr>
							<th>Sr. No.</th>
							<th>Ass. ID</th>
							<th>Assignment</th>
							<th>Uploaded By</th>
							<th>Solve Date</th>
							<th>Output</th>
							<!-- <th>Status</th> -->
							<th>Operation</th>

						</tr>
						<%
					 
					Connection con = DbConnection.getConnection();
					Statement  stm = con.createStatement();
					ResultSet rs = stm.executeQuery("select * from solve_assignment");
					int no=0;
					while(rs.next())
					{
						no++;
						%>
						<tr align="center">
							<td><%=no%></td>
							<td><%=rs.getString("ass_id") %></td>

							<td><%=rs.getString("assignment") %></td>
							<td><%=rs.getString("upload_by") %></td>
							<td><%=rs.getString("solve_date") %></td>
							<td><%=rs.getString("output") %></td>
							<%-- <td><%=rs.getString("ass_status") %></td> --%>
							<td><a
								href="compiler.jsp?as_id=<%=rs.getString("stud_as_id")%>">Edit</a></td>


							<%
						
						
					}
						
					 
					 %>
						</tr>
					</table>
					<br /> <br /> <br />
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