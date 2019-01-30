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
				<li><a href="adminHome.jsp">Home</a></li>
				<li><a href="addAssignment.jsp">Add Assignment</a></li>
				<li><a>view</a>
					<div>
						<a href="adminAssignmentList.jsp">Assignment List</a> <a
							href="adminViewSolveAssi.jsp">Solve Assignment</a>
					</div></li>
				<li  class="active"><a href="viewSolveOutput.jsp">View Output</a></li>
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

				<%
					String as_id = request.getParameter("as_id");
					if (as_id == null) {
				%>

				<div align="center">
					<br /> <br />
					<%
						String stud_no = request.getParameter("stud_no");
							String fname = "", lname = "";
							GlobalFunction gf = new GlobalFunction();
							fname = gf.getFname(stud_no);
							lname = gf.getLname(stud_no);
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
								//ResultSet rs = stm.executeQuery("select b.assignment,a.uplaod_date,b.upload_by,b.solve_date,b.program,b.output,b.stud_as_id from assignment a,solve_assignment b where b.stud_id='"+ stud_no + "' AND a.assignment_id=b.ass_id AND program_sts!='done'");
								ResultSet rs = stm
										.executeQuery("Select * from solve_assignment where output!='Not_Generated'");
								int no = 0;
								String as_id1 = "";
								while (rs.next()) {
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
							<td><a href="viewSolveOutput.jsp?as_id=<%=as_id1%>">In
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
				<p>Computer Department, SCOE</p>
			</div>
		</div>
	</div>
</body>
</html>