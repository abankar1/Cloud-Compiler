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
<title><%@ include file="projectTitle.jsp" %></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
	<div id="header">
		<div class="clearfix">
			<div class="logo">
				<h2><%@ include file="projectTitle.jsp" %></h2>
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
			</ul>	</div>
	</div>
	<div id="contents">
		<div id="adbox">
			<div class="clearfix">
<div align="right">
			
			Welcome: &nbsp;<font style="color: green"><%=session.getAttribute("uname")%>&nbsp;&nbsp;&nbsp;&nbsp;</font></div>
				<div align="center">
					<br /> <br />
					<br />
					 <br /> 
					 <h3>Assignment List</h3>
					 
					 
					 <br />
					 
					 <table border="1" cellpadding="5">
					 <tr>
					 <th>Assignment Number</th>
					 <th>Class</th>
					 <th>Assignment</th>
					 <th>Upload by</th>
					 <th>Date</th>
					 
					 </tr>
					 <%
					 
					Connection con = DbConnection.getConnection();
					Statement  stm = con.createStatement();
					ResultSet rs = stm.executeQuery("select * from assignment");
					int no=0;
					while(rs.next())
					{
						no++;
						%>
						<tr align="center">
						<td><%=no%></td>
						<td><%=rs.getString("assign_to") %></td>
						<td><%=rs.getString("assignment") %></td>
						<td><%=rs.getString("tchr_id") %></td>
						<td><%=rs.getString("uplaod_date") %></td>
					<%-- 	<td><a href="compiler.jsp?as_id=<%=rs.getString("assignment_id")%>">Type Program</a></td> --%>
						
						
						<%
						
						
					}
						
					 
					 %>
					 </tr>
					 </table>
					<br />
					<br /> <br />
				</div>

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