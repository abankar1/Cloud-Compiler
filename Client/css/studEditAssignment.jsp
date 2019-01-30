<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DbConnection"%>
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
		out.print("<script>alert('Logged In Successfully')</script>");
	}
%>

<body>

	<div id="header">
		<div class="clearfix">
			<div class="logo">
				<h2><%@ include file="projectTitle.jsp"%></h2>
			</div>
			<ul class="navigation">
				<li><a href="studentHome.jsp">Home</a></li>
				<li><a href="studNewAssignment.jsp">Assignment</a></li>
				<li class="active"><a href="studEditAssignment.jsp">Solve Assignment</a></li>
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
					<br /> <br />
					<h3>Solve Assignment List For Edit</h3>

				</div>
				<br />
				<div align="center">
					<%
						String ass_id = request.getParameter("ass_id");
						if (ass_id == null) {
					%>



					<table border="1">
						<tr align="center">
							<th>Sr. No.</th>
							<th>Assignment</th>
							<th>Program Name</th>
							<th>Program</th>
							<th>Output</th>
							<th>Operation</th>
						</tr>

						<%
							String stud_id = session.getAttribute("stud_no").toString();
								Connection con = DbConnection.getConnection();
								PreparedStatement ps = con
										.prepareStatement("SELECT * FROM `solve_assignment` where stud_id='"
												+ stud_id + "'");
								ResultSet rs = ps.executeQuery();
								int sr_no = 0;
								while (rs.next()) {
									sr_no++;
						%>
						<tr align="center">
							<td><%=sr_no%></td>
							<td><%=rs.getString("assignment")%></td>
							<td><%=rs.getString("program_name")%></td>
							<td><textarea rows="2" cols="20" readonly="readonly"><%=rs.getString("program")%></textarea></td>
							<td><textarea rows="2" cols="13" readonly="readonly"><%=rs.getString("output")%></textarea></td>
							<td><a
								href="studEditAssignment.jsp?ass_id=<%=rs.getString("stud_as_id")%>">Edit
									Program</a></td>
						</tr>
						<%
							}
						%>
					</table>

					<%
						} else if (ass_id != null) {

							Connection con = DbConnection.getConnection();
							Statement stm = con.createStatement();
							ResultSet rs = stm
									.executeQuery("Select * from solve_assignment where stud_as_id='"
											+ ass_id + "'");
							if (rs.next()) {
					%>


					<div align="center">
						<br /> <b><h1>Edit Program</h1></b> <br />
						<form action="UpdateProgram" method="post">
							<table border="0" cellpadding="15" cellspacing="15">
								<tr>
									<td>
										<table border="1">
											<tr>
												<td>Assignment: &nbsp;<%=rs.getString("assignment")%> <input type="hidden" name="ass_id" value="<%=rs.getString("stud_as_id")%>">
												</td>
											</tr>
											<tr>
												<td>Program Name: &nbsp; <input type="text" name="programName" value="<%=rs.getString("program_name")%>"
													>
												</td>
											</tr>
											<tr>
												<td><textarea name="program" rows="15" cols="50"
													><%=rs.getString("program")%></textarea>
												</td>
											</tr>
											<tr align="center">
												<td><input type="submit" value="Update Program"></td>
												<td></td>
											</tr>

										</table>
									</td>
									<td>
										<table border="1">
											<tr>

												<td align="center">Output: &nbsp;</td>
											</tr>
											<tr>
												<td><textarea rows="10" cols="20" readonly="readonly"><%=rs.getString("output")%></textarea>
												</td>
											</tr>

										</table>


									</td>

								</tr>
							</table>
						</form>

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