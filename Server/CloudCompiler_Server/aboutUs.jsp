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
			
		</div>
	</div>
	<div id="contents">
		<div id="adbox">
			<div class="clearfix">
				<div align="right">
				</div>
				<div align="center">
					<br /> <br /> <br /> <br />
					<br />
					<h3>About Us</h3>
					<table border="1" cellpadding="5">
						<tr>
							<th>Roll. No.</th>
							<th>Class</th>
							<th>Name</th>
							<th>Contact</th>
							<!-- <th>Status</th> -->

						</tr>
						<tr align="center">
							<td>405001</td>
							<td>B.E.</td>
							<td>Akshay Agrawal</td>
							<td>+91 776705715</td>							
						</tr>
						<tr align="center">
							<td>405005</td>
							<td>B.E.</td>
							<td>Aneesh Ashtikar</td>
							<td>+91 9594199363</td>							
						</tr>
						<tr align="center">
							<td>405007</td>
							<td>B.E.</td>
							<td>Akshay Bankar</td>
							<td>+91 8888086018</td>							
						</tr>
						<tr align="center">
							<td>405056</td>
							<td>B.E.</td>
							<td>Pranesh Meher</td>
							<td>+91 9822511412</td>							
						</tr>
					</table>
					<center>
					<h4>Guided By : S. C. Suryawanshi</h4>
					</center>
				</div>

				<br /><br />

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