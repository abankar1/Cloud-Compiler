<%@page import="com.util.DbConnection"%>
<%@page import="com.souce.GlobalFunction"%>
<%@page import="java.sql.*" %>

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
						<a href="adminAssignmentList.jsp">Assignment List</a> <a
							href="adminViewSolveAssi.jsp">Solve Assignment</a>
					</div></li>
				<li><a>Forum</a>
					<div>
						<a href="adminForumInbox.jsp">Inbox</a> <a
							href="adminForumSentbox.jsp">Sentbox</a>
					</div></li>

				<li><a href="studRecord.jsp">Record</a></li>
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
					<br />
					<h3>Inbox</h3>
					<br />
					<a href="adminNewMsg.jsp">New Message</a>
					 <br /> <br />
					<table border="1" cellspacing="4" cellpadding="5">
						<tr align="center"> 
							<th>Sr. No.</th>
							<th>From</th>
							<th>Message</th>
							<th>Operation</th>

						</tr>

						<%
						String uname=session.getAttribute("uname").toString();
						
						Connection con=DbConnection.getConnection();
						PreparedStatement ps=con.prepareStatement("select * from forum where to_msg='"+uname+"' Order By msg_id DESC  ");
						ResultSet rs=ps.executeQuery();
						int sr_no=0;
						String msg_from="";
						String lname="",fname="";
						while(rs.next())
						{
						sr_no++;
						
						msg_from=rs.getString("from_msg");
						GlobalFunction gf=new GlobalFunction();
						fname=gf.getFname(msg_from);
						lname=gf.getLname(msg_from);
						
						
						
						%>


						<tr align="center">
							<td><%=sr_no %></td>
							
							
							<td><%=fname %>&nbsp;<%=lname%>&nbsp;&nbsp;(<%=msg_from %>)</td>
							<td><%=rs.getString("msg") %></td>
							<td><a href="adminReply.jsp?stdno=<%=rs.getString("from_msg") %>">Reply</a></td>
						</tr>
						<%} %>
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