<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


	
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
				<li class="active"><a href="adminHome.jsp">Home</a></li>
				<li><a href="addAssignment.jsp">Add Assignment</a></li>
				<li><a>view</a>
					<div>
						<a href="adminAssignmentList.jsp">Assignment List</a> 
						<a href="adminViewSolveAssi.jsp">Solve Assignment</a>
					</div></li>
				<li><a href="viewSolveOutput.jsp">View Output</a></li>
				
				<li><a href="LogoutServlet">Logout</a></li>
			</ul>		</div>
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
					 <h3>Welcome <font style="color: red"> <%=session.getAttribute("uname") %></font></h3>
					 <br />
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
				<p>© Copyright 2023 Manes Winchester. All Rights Reserved.</p>
			</div>
		</div>
	</div>
</body>
</html>