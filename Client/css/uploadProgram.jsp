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
				<li class="active"><a href="studNewAssignment.jsp">Assignment</a></li>
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
					<br /> <br /> <br /> <br />
					<h3>
						Welcome on Cloud Compiler <br />
						<%=session.getAttribute("fname")%>&nbsp;<%=session.getAttribute("lname")%></h3>
					<br /> 
				</div>
				
				<%
				String as_id=request.getParameter("nas_id");
				
				Connection con=DbConnection.getConnection();
				PreparedStatement ps=con.prepareStatement("SELECT * FROM `assignment` where assignment_id='"+as_id+"'");
				ResultSet rs=ps.executeQuery();
				String programName="";
				String ass_id="";
				if(rs.next())
				{
					programName=rs.getString("assignment");
					ass_id=rs.getString("assignment_id");
				}
				%>
				<div align="center">
				<form action="UploadProgram" method="post" enctype="multipart/form-data">
					<table cellpadding="5" cellspacing="5">
						<tr>
							<td><strong>Assignment Name :</strong></td>
							
							<td> <%=programName %><input type="hidden" value="<%=programName %>" name="pname"> <input type="hidden" name="ass_id" value="<%=ass_id%>"></td>
						</tr>
						<tr>
						<td><strong>Program Name:</strong></td>
						<td><input type="text" name="programName" placeholder="Program Name" style="width: 170px;height: 25px;"></td>
						
						</tr>
						<tr>
							<td><strong>Upload File :</strong></td>
							<td><input type="file" name="file"></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" value="Upload"></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
						</tr>

					</table>



				</form>
				</div>
				<br /> <br />

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