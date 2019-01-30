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
<%
if(request.getParameter("marks")!=null)
{
	out.print("<script>alert('Marks Add Successfully')</script>");
}

%>
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
			</ul>
		</div>
	</div>
	<div id="contents">
		<div id="adbox">
			<div class="clearfix">
<div align="right">
			
			Welcome: &nbsp;<font style="color: green"><%=session.getAttribute("uname")%>&nbsp;&nbsp;&nbsp;&nbsp;</font></div>
				<div align="center">
				<br />
					 <br />
					 <h3>Solve Assignment List with Student Details</h3>
					 
					 <br />
					 
					 <table border="1" cellpadding="5">
					 <tr>
					 <th>Sr.No.</th>
					 <th>Student Number</th>
					 <th>Student Name</th>
					 <th>Operation</th>
					 
					 </tr>
					 <%
					 
					Connection con = DbConnection.getConnection();
					Statement  stm = con.createStatement();
					ResultSet rs = stm.executeQuery("select * from student");
					int no=0;
					String stud_no="",fname="",lname="",mname="",year="";
					while(rs.next())
					{
						no++;
						stud_no=rs.getString("student_no");
						fname=rs.getString("fname");
						
						
						
						%>
						<tr align="center">
						<td><%=no%></td>
						<td><%=stud_no %></td>
						<td><%=fname %>&nbsp;</td>
						
						<td><a href="solveAssignmentCompile.jsp?stud_no=<%=stud_no%>">View Assigment</a></td>
						
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