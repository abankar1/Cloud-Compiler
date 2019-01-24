<%@page import="com.souce.GlobalFunction"%>
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
<title><%@ include file="projectTitle.jsp" %></title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<%
if(request.getParameter("sent")!=null)
{
out.print("<script>alert('Message Sent Successfully')</script>");
}


%>

<body>

	<div id="header">
		<div class="clearfix">
			<div class="logo">
				<h2><%@ include file="projectTitle.jsp" %></h2>
			</div>
			<ul class="navigation">
				<li class="active"><a href="studentHome.jsp">Home</a></li>

				<li><a>Assignment</a>
					<div>
						<a href="studNewAssignment.jsp">New Assignment</a> <a
							href="studSolveAssignment.jsp">Solve Assignment</a>
					</div></li>
				<li><a>Forum</a>
					<div>
						<a href="studForum.jsp">Inbox</a> <a
							href="studForumSentbox.jsp">Sentbox</a>
					</div></li>

				<li><a href="studResult.jsp">Result</a></li>
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
				<br />
				<h3>Sentbox</h3>
					<br /> 
					<a href="studNewMsg.jsp">New Massage </a>
					<br /> 
					<br /> 
					<table border="1" cellspacing="4" cellpadding="5">
					<tr align="center">
					<th>Sr. No.</th>
					<th>To </th>
					<th>Message</th>
					
					</tr>
					
					<%
					String stud_id =session.getAttribute("stud_no").toString();
					
					Connection con=DbConnection.getConnection();
					PreparedStatement ps=con.prepareStatement("select * from forum where from_msg='"+stud_id+"'Order BY msg_id DESC");
					ResultSet rs=ps.executeQuery();
					int sr_no=0;
					String tomsg="",fname="",lname="";
					
					while(rs.next())
					{
						sr_no++;

						GlobalFunction gf=new GlobalFunction();
						tomsg=rs.getString("to_msg");
						 fname=gf.getFname(tomsg);
						lname=gf.getLname(tomsg);
					
					%>
					
					
					<tr align="center">
					<td><%=sr_no %> </td>
					<td><%=fname %>&nbsp;&nbsp;<%=lname%>&nbsp;&nbsp;(<%=tomsg %>)</td>
					<td align="left"><%=rs.getString("msg") %></td>
					
					
					</tr>
					<%} %>
					</table>
					
					<br />
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