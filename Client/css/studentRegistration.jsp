<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
				<li class="active"><a href="index.jsp">Home</a></li>
				<li><a>Student</a>
					<div>
						<a href="studentRegistration.jsp">Registration</a> <a
							href="studentLogin.jsp">Login</a>
					</div></li>
				<!-- <li><a href="adminLogin.jsp">Teacher</a></li> -->
				<li><a href="aboutUs.jsp">About Us</a></li>
			</ul>
		</div>
	</div>
	<div id="contents">
		<div id="adbox">
			<div class="clearfix">

				<div align="center">
					<br /> 
					<h3>Student Registration</h3>
					<br />
					<%
					DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
					Date dateobj = new Date();
					System.out.println(df.format(dateobj));
					
					%>
					
					<form action="StudentRegistration" method="post">
						<table border="1" cellpadding="5" cellspacing="3">
							<tr>
								<td>Student Name</td>
								<td><input type="text" name="fname" required></td>
								<td><input type="text" name="mname" required></td>
								<td><input type="text" name="lname" required></td>
							</tr>

							<tr>
								<td>Date Of Birth</td>
								<td><input type="text" name="dob" id="dob" required></td>
								<td>Gender</td>
								<td>&nbsp;Male&nbsp;<input type="radio" name="gender"
									id="gender" value="Male"></input> &nbsp;Female&nbsp;<input
									type="radio" name="gender" id="gender" value="Female"></input></td>
							</tr>

							<tr>
								<td>Class</td>
								<td><select name="year" style="width: 145px; height: 30px" required>
								<option value="First Year">--Select--</option>
										<option value="First Year">First Year</option>
										<option value="Second Year">Second Year</option>
										<option value="Third Year">Third Year</option>
										<option value="Final Year">Final Year</option>
								</select></td>
								<td>Reg. Date</td>
								<td><input type="text" name="reg_date" readonly="readonly" value="<%=dateobj %>" required></td>
								
							</tr>
							<tr>
								<td>Email Id</td>
								<td><input type="text" name="email" id="email" required></td>
								<td>Mobile No</td>
								<td><input type="text" name="mobile" id="mobile" required></td>
							</tr>
							
							

							<tr>
								<td>Student Number</td>
								<td><input type="text" name="stud_no" id="stud_no" required></td>
							</tr>
							<tr>
								<td>Password</td>
								<td><input type="password" name="pwd" id="pwd" required></td>
								<td>Confirm Password</td>
								<td><input type="password" name="pwd" id="c_pwd" required></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" value="Register"></td>
								<td><input type="reset" value="Reset"></td>
							</tr>



						</table>

					</form>
					<br /> 
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