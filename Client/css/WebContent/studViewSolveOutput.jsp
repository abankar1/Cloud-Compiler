<%@page import="com.souce.GlobalFunction"%>
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
				<li><a href="studNewAssignment.jsp">Assignment</a></li>
				<li><a href="studEditAssignment.jsp">Solve Assignment</a></li>
				<li class="active"><a href="studViewSolveOutput.jsp">View Output</a></li>
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
				<%
					String as_id = request.getParameter("as_id");
					if (as_id == null) {
				%>

				<div align="center">
					<br /> <br />
					<%
					String stud_no=session.getAttribute("stud_no").toString();	
					
						
					%>
					<h3>Solve Assignment List with Output</h3>

					<br />
					<table border="1" cellpadding="5">
						<tr>
							<th>Sr. No.</th>

							<th>Student Name</th>
							<th>Student Number</th>
							<th>Assignment</th>
							<th>Operation</th>

						</tr>
						<%
							Connection con = DbConnection.getConnection();
								Statement stm = con.createStatement();
								ResultSet rs = stm.executeQuery("Select * from solve_assignment where output!='Not_Generated' AND stud_id='"+stud_no+"'");
								int no = 0;
								String as_id1 = "";
								while (rs.next()) 
								
								{
									no++;
									as_id1 = rs.getString("stud_as_id");
									rs.getString("upload_by");
									rs.getString("stud_id");
									rs.getString("assignment");
						%>
						<tr align="center">
							<td><%=no%></td>

							<td><%=rs.getString("upload_by")%></td>
							<td><%=rs.getString("stud_id")%></td>
							<td align="left"><%=rs.getString("assignment")%></td>
							<td><a href="studViewSolveOutput.jsp?as_id=<%=as_id1%>">In
									Details</a></td>
						</tr>

						<%
							}
						%>

					</table>
					<br /> <br /> <br />
				</div>
				<%
					} else if (as_id != null) {
						Connection con = DbConnection.getConnection();
						Statement stm = con.createStatement();
						ResultSet rs = stm.executeQuery("Select * from solve_assignment where stud_as_id='"+ as_id + "'");
						if (rs.next()) {
							
							
				%>
				<br />

				<div align="center">
					<br /> <br /> <br /> <b><h1>View Output</h1></b> <br /> <br />

					<table border="0" cellpadding="15" cellspacing="15">
						<tr>
							<td>
								<table border="1">
									<tr>
										<td>Assignment: &nbsp;<%=rs.getString("assignment") %></td>
									</tr>
									<tr>
										<td>Program Name: &nbsp; <input type="text"
											value="<%=rs.getString("program_name") %>"
											readonly="readonly">
										</td>
									</tr>
									<tr>
										<td><textarea rows="15" cols="50" readonly="readonly"><%=rs.getString("program") %></textarea>
										</td>
									</tr>
								</table>
							</td>
							<td>
								<table border="1">
									<tr>

										<td align="center">Output: &nbsp;</td>
									</tr>
									<tr>
										<td><textarea rows="10" cols="20" readonly="readonly"><%=rs.getString("output") %></textarea>
										</td>
									</tr>
								</table>


							</td>

						</tr>
					</table>


				</div>




				<%
					}
					}
				%>

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