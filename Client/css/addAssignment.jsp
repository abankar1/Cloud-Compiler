<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title><%@ include file="projectTitle.jsp" %></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<%
if(request.getParameter("add")!=null)
{
	out.print("<script>alert('Assignment Added Successfully')</script>");

}
%>
<body>
	<div id="header">
		<div class="clearfix">
			<div class="logo">
				<h2><%@ include file="projectTitle.jsp" %></h2>
			</div>
<ul class="navigation">
				<li><a href="adminHome.jsp">Home</a></li>
				<li class="active"><a href="addAssignment.jsp">Add Assignment</a></li>
				<li><a>view</a>
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
					<br /> <br />
					<br />
					 <br /> 
					 <h3>Add Assignment</h3>
					 <br />
					<form action="AddAssignment" method="post">
						<table border="1" cellpadding="5" cellspacing="3">
							
							<tr>
								<td>Assignment<input type="hidden" name="year" value="NULL" ></td>
								<td><textarea rows="6" cols="30" name="assignment" placeholder="Type Assignment Here" required></textarea></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" value="Add Assignment"></td>
							</tr>
							


						</table>

					</form>
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