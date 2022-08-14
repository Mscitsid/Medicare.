# Capstone-Project-Medicare
Simplilearn final pproject Medicare

Capstone Project Medicare

Developer Details:
Name: Manish Machha
Email: manishmachha@hotmail.com
Date created: 23-05-2022
Program Name: Medicare
GitHub Repository: 
https://github.com/manishmachha/Capstone-Project-Medicare

Program Background :
 Medicare is a company that supplies medicines and a couple of other healthcare essentials at an affordable price. It was established in 2012 in Delhi, India. It had been serving fine all these years, however, the business analysts noticed a decline in sales since 2017. They found out that online ordering of medicines with companies, such as 100mg and mfine are gaining more profits by eliminating middlemen from the equation. As a result, the team decided to hire a Full Stack developer to develop a healthcare web application with a rich and user-friendly interface.
You are hired as the Full Stack Java developer and are asked to develop the web application. The management team has provided you with the requirements and their business model so that you can easily arrange different components of the application.
Program Features:
● Presenting the specification document which has the product’s capabilities, appearance, and user interactions
● Setting up Git and GitHub account to store and track your enhancements of the prototype 
● Explaining the Java concepts used in the project 
● Discussing the generic features of the product:
● There will be an admin to manage the website. An administrator login will be required to access the admin page.

The admin will be able to change his password if he wants, he should be able to:
● Manage the products in the store including categorizing them
● Browse the list of users who have signed up and be able to search users
● See purchase reports filtered by date and category

Tools used for development:
1.	Eclipse IDE
2.	MySQL Relation Database Management System
3.	Apache Tom-Cat 10 server
4.	Spring Boot
5.	Spring MVC
6.	Java Servlets
7.	Java Server Pages (JSP)
8.	HTML
9.	Apache Maven
10.	JDBC Java Database Connectivity
11.	CSS


Sprint Table:

SPRINT	WORK DONE	TIME PERIOD	RESULT
1	Created Databases in MySQL	20/05/2022 to 21/05/2022	Done ✓
2	Designed HTML pages	21/05/2022 to 22/05/2022	Done ✓
3	Server-side coding	22/05/2022 to 23/05/22	Done ✓
4	Testing	23/05/22 to 24/05/22	Done ✓


Source codes
1.signup

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Sign up</title>
</head>
<body>
	<div id='container'>
		<div class='signup'>
			<form action="signupAction.jsp" method="post">
				<input type="text" name="name" placeholder="Full name"> <input
					type="email" name="email" placeholder="Email ID"> <input
					type="number" name="phonenumber" placeholder="Mobile Number">
				<select name="securityQuestion" required>
					<option value="What is the name of your first pet ?">What
						is the name of your first pet ?</option>
					<option value="What is your first car ?">What is your
						first car ?</option>
					<option value="Where did you born ?">Where did you born ?</option>
					<option value="What is the name of your first school ?">What
						is the name of your first school ?</option>
				</select> <input type="text" name="answer" placeholder="Answer"> <input
					type="password" name="password" placeholder="Password"> <input
					type="submit" value="Sign Up">
			</form>
			<h2>
				<a href="login.jsp">Login</a>
			</h2>
		</div>
		<div class='whysign'>
			<%
			String msg = request.getParameter("msg");
			if ("valid".equals(msg)) {
			%>
			<h1>Successfully Registered</h1>
			<%
			}
			if ("invalid".equals(msg)) {
			%>

			<h1>Some thing Went Wrong! Try Again !</h1>
			<%
			}
			%>
			<h2>Medicare</h2>
<p>medicare is the best place where you get all types of medicines at one place</p>
		</div>
	</div>

</body>
</html>

2.Login

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
	<div id='container'>
		<div class='signup'>
			<form action="loginAction.jsp" method="post">
				<input type="text" name="email" placeholder="Email ID"> <input
					type="password" name="password" placeholder="Password"> <input
					type="submit" value="Login">
			</form>
			<h2>
				<a href="signup.jsp">SignUp</a>
			</h2>
			<h2>
				<a href="forgotPassword.jsp">Forgot Password?</a>
			</h2>
		</div>
		<div class='whysignLogin'>

			<%
			String msg = request.getParameter("msg");
			if ("notexist".equals(msg)) {
			%>
			<h1>Incorrect Username or Password</h1>
			<%
			}
			if ("invalid".equals(msg)) {
			%>
			<h1>Some thing Went Wrong! Try Again !</h1>
			<%
			}
			%>
			<h2>Medicare</h2>
<p>medicare is the best place where you get all types of medicines at one place</p>
		</div>
	</div>

</body>
</html>





3.Signup action

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobilenumber = request.getParameter("phonenumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String password = request.getParameter("password");
String address = "";
String city = "";
String state = "";
String country = "";

try {
	Connection con = ConnectionProvider.getCon();
	PreparedStatement st = con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?)");
	st.setString(1, name);
	st.setString(2, email);
	st.setString(3, mobilenumber);
	st.setString(4, securityQuestion);
	st.setString(5, answer);
	st.setString(6, password);
	st.setString(7, address);
	st.setString(8, city);
	st.setString(9, state);
	st.setString(10, country);
	st.executeUpdate();
	response.sendRedirect("signup.jsp?msg=valid");
} catch (Exception e) {
	response.sendRedirect("signup.jsp?msg=invalid");
	System.out.println(e);
}
%>



4.Login action

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
	session.setAttribute("email", email);
	response.sendRedirect("admin/adminHome.jsp");
} else {
	int z = 0;
	try {
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st
		.executeQuery("select * from users where email='" + email + "' and password='" + password + "'");
		while (rs.next()) {
	z = 1;
	session.setAttribute("email", email);
	response.sendRedirect("home.jsp");
		}
		if (z == 0) {
	response.sendRedirect("login.jsp?msg=notexist");
		}
	} catch (Exception e) {
		System.out.println(e);
		response.sendRedirect("login.jsp?msg=invalid");
	}
}
%>
 
5.Home

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sporty Shoes</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<%
String msg=request.getParameter("msg");
if("added".equals(msg))
{
%>
<h3 class="alert">Product added successfully!</h3>
<%
}
%>

<%
if("exist".equals(msg))
{
%>
<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
<%
}
%>

<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Password change successfully!</h3>
<%
}
%>
<table>
<thead>
<tr>
 <th scope="col">ID</th>
 <th scope="col">Name</th>
 <th scope="col">Category</th>
<th scope="col"><i class="fa fa-inr"></i> Price</th>
<th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
 </tr>
</thead>
<tbody>
<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from products where status='Active'");
	while(rs.next()){
%>
<tr>
 <td><%=rs.getString(1)%></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3)%></td>
<td><i class="fa fa-inr"></i><%=rs.getString(4)%></td>
<td><a href="addToCartAction.jsp?id=<%=rs.getString(1)%>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
</tr>
<%
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
</tbody>
</table>
 <br>
 <br>
 <br>

</body>
</html> 

 
6.Search Home

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<table>
 <thead>
 <tr>
 <th scope="col">ID</th>
<th scope="col">Name</th>
<th scope="col">Category</th>
 <th scope="col"><i class="fa fa-inr"></i> Price</th>
 <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
 </tr>
</thead>
 <tbody>
<%
int z=0;
String search=request.getParameter("search");
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from products where name like '%"+search+"%' or category like '%"+search+"%' and status='Active'");
	while(rs.next()){
		z=1;
%>
 <tr>
 <td><%=rs.getString(1)%></td>
 <td><%=rs.getString(2) %></td>
 <td><%=rs.getString(3)%></td>
  <td><i class="fa fa-inr"></i><%=rs.getString(4)%></td>
  <td><a href="addToCartAction.jsp?id=<%=rs.getString(1)%>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
 </tr>
<%
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
</tbody>
 </table>
<%if(z==0) {%>      	
	<h1 style="color:white; text-align: center;">Nothing to show</h1>
<%
}
%>	
 <br>
<br>
 <br>
 <div class="footer">
<p>All right reserved by BTech Days</p>
 </div>

</body>
</html>

 
7.Mycart

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
String msg=request.getParameter("msg");
if("no".equals(msg)){
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%
}
%>

<%
if("inc".equals(msg)){
%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%
}
%>

<%
if("dec".equals(msg)){
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%
}
%>

<%
if("rem".equals(msg)){
%>
<h3 class="alert">Product Successfully Removed!</h3>
<%
}
%>

<table>
<thead>
<%
int total=0;
int sno=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is null");
	while(rs.next()){
		total=rs.getInt(1);
	}
%>
<tr>
<th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%=total%> </th>
<%if(total>0){ %><th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th><%} %>
</tr>
</thead>
<thead>
<tr>
<th scope="col">S.No</th>
<th scope="col">Product Name</th>
<th scope="col">Category</th>
<th scope="col"><i class="fa fa-inr"></i> price</th>
<th scope="col">Quantity</th>
<th scope="col">Sub Total</th>
<th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
</tr>
</thead>
<tbody>
<%
ResultSet rs1=st.executeQuery("select * from products inner join cart on products.id=cart.product_id and cart.email='"+email+"' and cart.address is null");
while(rs1.next()){
%>
<tr>
<%sno=sno+1; %>
<td><%=sno%></td>
<td><%=rs1.getString(2) %></td>
<td><%=rs1.getString(3) %></td>
td><i class="fa fa-inr"></i><%=rs1.getString(4) %></td>
<td><a href="incDecQuantityAction.jsp?id=<%=rs1.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a> <%=rs1.getString(8) %> <a href="incDecQuantityAction.jsp?id=<%=rs1.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
<td><i class="fa fa-inr"></i> <%=rs1.getString(10) %></td>
<td><a href="removeFromCart.jsp?id=<%=rs1.getString(1)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
</tr>
<%
}
}
catch(Exception e){
System.out.println(e);
}
%>
</tbody>
</table>
<br>
<br>
<br>

</body>
</html>

 
8.My orders

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My orders</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Orders <i class='fab fa-elementor'></i></div>
<table>
<thead>
<tr>
<th scope="col">S.No</th>
<th scope="col">Product Name</th>
<th scope="col">category</th>
<th scope="col"><i class="fa fa-inr"></i>  Price</th>
<th scope="col">Quantity</th>
<th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
<th scope="col">Order Date</th>
<th scope="col">Expected Delivery Date</th>
<th scope="col">Payment Method</th>
<th scope="col">Status</th>
              
</tr>
</thead>
        <tbody>
<%
	int sno=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from cart inner join products where cart.product_id=products.id and cart.email='"+email+"' and cart.orderDate is not NULL");
	while(rs.next()){
		sno=sno+1;
%>
<tr>
<td><%=sno %></td>
<td><%=rs.getString(17) %></td>
<td><%=rs.getString(18) %></td>
<td><i class="fa fa-inr"></i> <%=rs.getString(19) %></td>
<td><%=rs.getString(3) %></td>
<td><i class="fa fa-inr"></i><%=rs.getString(5) %> </td>
<td><%=rs.getString(11) %></td>
<td><%=rs.getString(12) %></td>
<td><%=rs.getString(13) %></td>
<td><%=rs.getString(15) %></td>
</tr>
<%
}
}
catch(Exception e){
	System.out.println(e);
}
%>
</tbody>
</table>
<br>
<br>
<br>

</body>
</html>

 
9.Change details

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<title>Change Details</title>
<style>
hr
{width:70%;}</style>
</head>
<body>
<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
	while(rs.next()){
%>
<h3>Name:<%=rs.getString(1) %> </h3>
<hr>
 <h3>Email:<%=rs.getString(2) %> </h3>
 <hr>
 <h3>Mobile Number: <%=rs.getString(3) %></h3>
 <hr>
<h3>Security Question:<%=rs.getString(4) %> </h3>
<hr>
<br>
<br>
<br>
<%
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
</body></html>
10.Message us

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h3 style="text-align:center; color:yellow;">Message successfully sent. Our team will contact you soon!</h3>
<%
}
%>
<%
if("invalid".equals(msg))
{
%>
<h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
<%
}
%>
<form action="messageUsAction.jsp" method="post">
<input class="input-style" name="subject" type="text" placeholder="subject" required>
<hr>
<textarea class="input-style" name="body" placeholder= "Enter Your Message" required></textarea>
<hr>
<button class="button" type="submit"> Send <i class="far fa-arrow-alt-circle"></i></button>
</form>
<br><br><br></body></html>
11.About

<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">About <i class="fa fa-address-book"></i></div>
<div style="background-color: white; padding:35px; font-size: 30px;">
Medicare
<br>
The art of medicine consists in amusing the patient while nature cures the <disease></disease>
<br>

<br>
We sell all kinds of Medicines and Drugs :-
    Make Your Healthcare Advanced With Medicare
<br>
Contact us at :- medicare@gmail.com
<br>
or
<br>
contact us at Instagram :- medicare_1431
</div>

</body>
</html>

 
12.Logout

<%
session.invalidate();
response.sendRedirect("login.jsp");
%>

 
13.Add to cart action

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%
String email = session.getAttribute("email").toString();
String product_id = request.getParameter("id");
int quantity = 1;
int product_price = 0;
int product_total = 0;
int cart_total = 0;
int z = 0;
try {	
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * 	from products where id=' " + product_id + "'");
	while (rs.next()) {
		product_price = rs.getInt(4);
		product_total = product_price;
	}
	ResultSet rs1 = st.executeQuery(
	"select * from cart where product_id='" + product_id + "' and email='" + email + "' and address is NULL");
	while (rs1.next()) {
		cart_total = rs1.getInt(5);
		cart_total = cart_total + product_total;
		quantity = rs1.getInt(3);
		quantity = quantity + 1;
		z = 1;
	}

	if (z == 1) {
		st.executeUpdate("update cart set total='" + cart_total + "', quantity='" + quantity + "' where product_id="
		+ product_id + " and email='" + email + "' and address is NULL");
		response.sendRedirect("home.jsp?msg=exist");
	}
	if (z == 0) {
		PreparedStatement ps = con.prepareStatement("insert into cart(email,product_id,quantity,price,total) values(?,?,?,?,?)");
		ps.setString(1, email);
		ps.setString(2, product_id);
		ps.setInt(3, quantity);
		ps.setInt(4, product_price);
		ps.setInt(5, product_total);
		ps.executeUpdate();
		response.sendRedirect("home.jsp?msg=added");
	}
} catch (Exception e) {
	response.sendRedirect("home.jsp?msg=invalid");
	System.out.println(e);
}
%>

 
14.Increase and decrease quantity

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%
String email = session.getAttribute("email").toString();
String id = request.getParameter("id");
String incdec = request.getParameter("quantity");
int price = 0;
int total = 0;
int quantity = 0;
int final_total = 0;
try {
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(
	"select * from cart where email='" + email + "' and product_id='" + id + "' and address is null");
	while (rs.next()) {
		price = rs.getInt(4);
		total = rs.getInt(5);
		quantity = rs.getInt(3);

		if (quantity == 1 && incdec.equals("dec")) {
	response.sendRedirect("myCart.jsp?msg=no");
		} else if (quantity != 1 && incdec.equals("dec")) {
	total = total - price;
	quantity = quantity - 1;
	st.executeUpdate("update cart set total='" + total + "' , quantity='" + quantity + "' where email='" + email
			+ "' and product_id='" + id + "' and address is null");
	response.sendRedirect("myCart.jsp?msg=dec");
		} else {
	total = total + price;
	quantity = quantity + 1;
	st.executeUpdate("update cart set total='" + total + "' , quantity='" + quantity + "' where email='" + email
			+ "' and product_id='" + id + "' and address is null");
	response.sendRedirect("myCart.jsp?msg=inc");
		}
	}
} catch (Exception e) { 	System.out.println(e); }%>

15. Address for payment order

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script>
if(window.history.forward(1) != null)
	window.history.forward(1);
</script>
</head>
<body>
<br>
<table>
<thead>
<%
String email=session.getAttribute("email").toString();
int total=0;
int sno=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is null");
	while(rs.next()){
		total=rs.getInt(1);
	
%>
<tr>
<th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
<th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%=total %> </th>
</tr>
</thead>
<thead>
<tr>
<th scope="col">S.No</th>
<th scope="col">Product Name</th>
<th scope="col">Category</th>
<th scope="col"><i class="fa fa-inr"></i> price</th>
<th scope="col">Quantity</th>
<th scope="col">Sub Total</th>
</tr>
</thead>
<tbody>
<%}
ResultSet rs1=st.executeQuery("select * from products inner join cart on products.id=cart.product_id and cart.email='"+email+"' and cart.address is null");
while(rs1.next()){
%>
<tr>        
      <%sno=sno+1; %>
<td><%=sno%></td>
<td><%=rs1.getString(2) %></td>
<td><%=rs1.getString(3) %></td>
<td><i class="fa fa-inr"></i><%=rs1.getString(4) %></td>
<td> <%=rs1.getString(8) %></td>
<td><i class="fa fa-inr"></i><%=rs1.getString(10) %> </td>
</tr>
<%} 
ResultSet rs2=st.executeQuery("select * from users where email='"+email+"'");
while(rs2.next()){
%>
</tbody>
</table>
      
<hr style="width: 100%">
<form action="addressPaymentForOrderAction.jsp" method="post">
 <div class="left-div">
 <h3>Enter Address</h3>
<input class="input-style" type="text" name="address" value="<%=rs2.getString(7)%>" placeholder="Address" required>
 </div>

<div class="right-div">
<h3>Enter city</h3>
<input class="input-style" type="text" name="city" value="<%=rs2.getString(8)%>" placeholder="City" required>
</div> 

<div class="left-div">
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" value="<%=rs2.getString(9)%>" placeholder="State" required>
</div>

<div class="right-div">
<h3>Enter country</h3>
<input class="input-style" type="text" name="country" value="<%=rs2.getString(10)%>" placeholder="Country" required>
</div>
<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
 <select class="input-style" name="paymentMethod">
<option value="Cash on delivery (COD)"> Cash on delivery(COD) </option>
<option value="Online Payment">Online Payment</option>
</select>
</div>

<div class="right-div">
<h3>Pay online on this btechdays@pay.com</h3>
<input class="input-style" type="text" name="transactionID"  placeholder="Transaction ID" required>
<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input class="input-style" type="text" name="mobilenumber" value="<%=rs2.getString(3)%>" placeholder="Mobile Number" required>
<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
<button class="button" type="submit">Proceed to place order <i class='far fa-arrow-alt-circle-right'></i></button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>
<%
}
}
catch(Exception e){
	System.out.println(e);
}
%>

      <br>
      <br>
      <br>

</body>
</html>


 
16.Proceed to payment action

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<% 
String email=session.getAttribute("email").toString();
String address=request.getParameter ("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
String mobileNumber=request.getParameter("mobilenumber");
String paymentMethod=request.getParameter("paymentMethod");
String transactionId="";
transactionId=request.getParameter("transactionID");
String status="bill";
try{
Connection con=ConnectionProvider.getCon();	
PreparedStatement ps=con.prepareStatement("update users set address=?, city=?, state=?, country=?, mobilenumber=? where email=?");
ps.setString(1, address);
ps.setString(2, city);
ps.setString(3, state);
ps.setString(4, country);
ps.setString(5, mobileNumber);
ps.setString(6, email);
ps.executeUpdate();
PreparedStatement ps1=con.prepareStatement("update cart set address=?,city=?,state=?,country=?,mobilenumber=?,orderDate=now(),deliveryDate=DATE_ADD(orderDate,INTERVAL 7 DAY),paymentMethod=?,transactionID=?,status=? where email=? and address is NULL");
ps1.setString(1, address);
ps1.setString(2, city);
ps1.setString(3, state);
ps1.setString(4, country);
ps1.setString(5, mobileNumber);
ps1.setString(6, paymentMethod);
ps1.setString(7, transactionId);
ps1.setString(8, status);
ps1.setString(9, email);
ps1.executeUpdate();
response.sendRedirect("bill.jsp");
}
catch (Exception e){System.out.println(e);}%>
17.Remove from cart

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%
String email = session.getAttribute("email").toString();
String id = request.getParameter("id");
try {
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("delete from cart where email='" + email + "' and product_id='" + id + "' and address is null");
	response.sendRedirect("myCart.jsp?msg=rem");
}

catch (Exception e) {
	System.out.println(e);
}
%>








18.Continue shopping

<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String status = "processing";
try {
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("update cart set status=? where email=? and status='bill'");
	ps.setString(1, status);
	ps.setString(2, email);
	ps.executeUpdate();
	response.sendRedirect("home.jsp");
} 
catch (Exception e) {
	System.out.println(e);
}
%>








19.Change details header

<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
 <!--Header-->
<br>
<div class="topnav sticky">
<center><h2>Change Details<i class="fa fa-edit"></i></h2></center>
<%String email=session.getAttribute("email").toString(); %>
<h2><a href="home.jsp"><i class='fas fa-arrow-circle-left'>Back</i></a></h2>
<h2><a href="">Your Profile(<%=email%>) <i class='fas fa-user-alt'></i></a></h2>
<a href="changePassword.jsp">Change Password <i class='fas fa-key'></i></a>
<a href="addChangeAddress.jsp">Add or change Address <i class='fas fa-map-marker-alt'></i></a>
<a href="changeSecurityQuestion.jsp">Change Security Question <i class="fa fa-repeat"></i></a>
<a href="changeMobileNumber.jsp">Change Mobile Number <i class='fas fa-phone'></i></a>
</div>
<br>
<!--table-->







20.Change password

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("notMatch".equals(msg))
{
%>
<h3 class="alert">New password and Confirm password does not match!</h3>
<%
}
%>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Your old Password is wrong!</h3>
<%
}
%>
<%
if("done".equals(msg))
{
%>
<h3 class="alert">Password change successfully!</h3>
<%
}
%>
<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%
}
%>
<form action="changePasswordAction.jsp" method="post">
<h3>Enter Old Password</h3>
<input class="input-style" type="password" name="oldPassword" placeholder="Enter old password" required>
  <hr>
 <h3>Enter New Password</h3>
 <input class="input-style" type="password" name="newPassword" placeholder="Enter new password" required>
 <hr>
<h3>Enter Confirm Password</h3>
<input class="input-style" type="password" name="confirmPassword" placeholder="confirm new password" required>
<hr>
<button class="button" type="submit" >Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>

























21.Change password action

<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String email = session.getAttribute("email").toString();
String oldPassword = request.getParameter("oldPassword");
String newPassword = request.getParameter("newPassword");
String confirmPassword = request.getParameter("confirmPassword");

if (!confirmPassword.equals(newPassword))
response.sendRedirect("changePassword.jsp?msg=notMatch");

else {
int check = 0;
try {

	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from users where email='" + email + "' and password='" + oldPassword + "'");
while (rs.next()) {
check = 1;
st.executeUpdate("update users set password='" + newPassword + "' where email='" + email + "'");
response.sendRedirect("changePassword.jsp?msg=done");
}

if (check == 0)
response.sendRedirect("changePassword.jsp?msg=wrong");
} catch (Exception e) {
System.out.println(e);
}
}
%>





22.Change address

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add or change address</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h3 class="alert">Address Successfully Updated !</h3>
<%
}
%>
<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
<%
}
%>

<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
	while(rs.next())
	{
%>
<form action="addChangeAddressAction.jsp" method="post">
<h3>Enter Address</h3>
 <input class="input-style" type="text" name="address" value="<%=rs.getString(7) %>" placeholder="enter address" required>
 <hr>
 <h3>Enter city</h3>
 <input class="input-style" type="text" name="city" value="<%=rs.getString(8) %>" placeholder="enter city"  required>
<hr>
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" value="<%=rs.getString(9) %>" placeholder="enter state"  required>
<hr>
<h3>Enter country</h3>
<input class="input-style" type="text" name="country" value="<%=rs.getString(10) %>" placeholder="enter country"  required>
<hr>
 <button class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<%
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
</body>
<br><br><br>
</html>




















23.Change address action

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%
String email = session.getAttribute("email").toString();
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");
try {
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("update users set address=?, city=?, state=?, country=? where email=?");
	ps.setString(1, address);
	ps.setString(2, city);
	ps.setString(3, state);
	ps.setString(4, country);
	ps.setString(5, email);
	ps.executeUpdate();
	response.sendRedirect("addChangeAddress.jsp?msg=valid");
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("addChangeAddress.jsp?msg=invalid");
}
%>




24.Change mobile number

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Your Mobile Number successfully changed!</h3>
<%
}
%>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Your Password is wrong!</h3>
<%
}
%>
<form action="changeMobileNumberAction.jsp" method="post">
 <h3>Enter Your New Mobile Number</h3>
<input class="input-style" type="text" name="mobileNumber" placeholder="mobile number" required> 
 <hr>
<h3>Enter Password (For Security)</h3>
<input class="input-style" type="password" name="password" placeholder="password" required>
<hr>
 <button class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<br><br><br>
</html>
24.Change Mobile ction

<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute ("email").toString();
String mobileNumber=request.getParameter ("mobileNumber");
String password=request.getParameter("password");
int check=0;
try
{
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select *from users where email='"+email+"' and password='"+password+"'");
while (rs.next()){
check=1;
st.executeUpdate("update users set mobileNumber='"+mobileNumber+"' where email='"+email+"'");
response.sendRedirect("changeMobileNumber.jsp?msg=done");
}
if(check==0)
response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
}
catch (Exception e){
System.out.println (e);
}
%>

25.Message us action

<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String subject = request.getParameter("subject");
String body = request.getParameter("body");
try {
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("insert into message (email, subject, body) values (?,?,?)");
	ps.setString(1, email);
	ps.setString(2, subject);
	ps.setString(3, body);
	ps.executeUpdate();
	response.sendRedirect("messageUs.jsp?msg=valid");
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("messageUs.jsp?msg=invalid");
}
%>



26.Bill

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
try{
int total=0;
int sno=0;
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select sum(total) from cart where email='"+email+"' and status='bill'");
while(rs.next()){
total=rs.getInt(1);
}
ResultSet rs1=st.executeQuery("select * from users inner join cart where cart.email='"+email+"' and cart.status='bill' ");
while(rs1.next())
{
%>
<h3>Sporty Shoes Bill</h3>
<hr>
<div class="left-div"><h3>Name: <%=rs1.getString(1) %> </h3></div>
<div class="right-div-right"><h3>Email: <%=email %> </h3></div>
<div class="right-div"><h3>Mobile Number: <%=rs1.getString(20) %> </h3></div>  

<div class="left-div"><h3>Order Date: <%=rs1.getString(21) %> </h3></div>
<div class="right-div-right"><h3>Payment Method: <%=rs1.getString(23) %> </h3></div>
<div class="right-div"><h3>Expected Delivery:  <%=rs1.getString(22) %></h3></div> 

<div class="left-div"><h3>Transaction Id: <%=rs1.getString(24) %> </h3></div>
<div class="right-div-right"><h3>City:  <%=rs1.getString(17) %></h3></div> 
<div class="right-div"><h3>Address:  <%=rs1.getString(16) %></h3></div> 

<div class="left-div"><h3>State:  <%=rs1.getString(18) %></h3></div>
<div class="right-div-right"><h3>Country:  <%=rs1.getString(19) %></h3></div>  

<hr>
<%break;
}%>

	
	<br>
	
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  <%
	ResultSet rs2=st.executeQuery("select * from cart inner join products where cart.product_id=products.id and cart.email='"+email+"' and cart.status='bill'");
  while(rs2.next()){
	  sno=sno+1;
  %>
  <tr>
    <td><%=sno %></td>
    <td><%=rs2.getString(17) %></td>
    <td><%=rs2.getString(18) %></td>
    <td><%=rs2.getString(19) %></td>
    <td><%=rs2.getString(3) %></td>
     <td><%=rs2.getString(5) %></td>
  </tr>
  <tr>
<%} %>
</table>
<h3>Total: <%=total %></h3>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
<%}
	catch(Exception e)
	{
		System.out.println(e);
	}
	%>
</body>
</html>

































26.Header

<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
<%String email=session.getAttribute("email").toString(); %>
<center><h2>Sporty Shoes</h2></center>
<h2><a href=""> <%=email %><i class='fas fa-user-alt'></i></a></h2>
<a href="home.jsp">Home<i class="fa fa-institution"></i></a>
<a href="myCart.jsp">My Cart<i class='fas fa-cart-arrow-down'></i></a>
<a href="myOrders.jsp">My Orders  <i class='fab fa-elementor'></i></a>
<a href="changeDetails.jsp">Change Details <i class="fa fa-edit"></i></a>
<a href="messageUs.jsp">Message Us <i class='fas fa-comment-alt'></i></a>
<a href="about.jsp">About <i class="fa fa-address-book"></i></a>
<a href="logout.jsp">Logout <i class='fas fa-share-square'></i></a>
<div class="search-container">
<form action="searchHome.jsp" method="post">
<input type="text" name="search" placeholder="Search">
<button type="submit"><i class="fa fa-search"></i></button>             
</form>
</div></div><br><!--table-->
27.Footer

<div class="footer">
<p>All Right Reserved @ ManishMachha</p>
</div>

28.Admin Home

<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>welcome</title>
<style>
h1
{
color: white;
text-align: center;
font-size: 100px;
}</style>
</head>
<body>
<h1>welcome admin!</h1>
</body>
</html>



30.Admin header

<%@page errorPage="../error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
   <%String email=session.getAttribute("email").toString(); %>
<center><h2>Sporty Shoes</h2></center>
<a href="addNewProduct.jsp">Add New Product <i class='fas fa-plus-square'></i></a>
<a href="allProductEditProduct.jsp">All Products & Edit Products <i class='fab fa-elementor'></i></a>
<a href="messagesReceived.jsp">Messages Received <i class='fas fa-comment-alt'></i></a>
<a href="ordersReceived.jsp">Orders Received <i class="fas fa-archive"></i></a>
<a href="cancelOrders.jsp">Cancel Orders <i class='fas fa-window-close'></i></a>
<a href="deliveredOrders.jsp">Delivered Orders <i class='fas fa-dolly'></i></a>
<a href="../logout.jsp">Logout <i class='fas fa-share-square'></i></a>
</div><br><!--table-->
31.Add new product

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>

<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>

<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Product Added Successfully!</h3>
<%
}
%>

<%
if("wrong".equals(msg)){
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%
}
%>

<%
int id=1;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(id) from products");
	while(rs.next()){
		id=rs.getInt(1);
		id=id+1;
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
<form action="addNewProductAction.jsp" method="post">
<h3 style="color: yellow;">Product ID: <%=id %></h3>
<input type="hidden" name="id" value="<%=id%>">

<div class="left-div">
 <h3>Enter Name</h3>
 <input class = "input-style" type="text" name="name" placeholder="Product Name">
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
  <input class = "input-style" type="text" name="category" placeholder="Product Category">
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
  <input class = "input-style" type="text" name="price" placeholder="Product Price">
<hr>
</div>

<div class="right-div">
<h3>Status</h3>
   <select class="input-style" name="status">
   <option value="Active">Active</option>
   <option value="InActive">InActive</option>
   </select>
<hr>
</div>
<button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>





32.Add new product action

<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");
String status = request.getParameter("status");

try {
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("insert into products values(?,?,?,?,?)");
	ps.setString(1, id);
	ps.setString(2, name);
	ps.setString(3, category);
	ps.setString(4, price);
	ps.setString(5, status);
	ps.executeUpdate();
	response.sendRedirect("addNewProduct.jsp?msg=done");
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("addNewProduct.jsp?msg=wrong");
}
%>


	
33.Edit products

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
 <h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>

<%
String id=request.getParameter("id");
try{
Connection con = ConnectionProvider.getCon();
Statement st=con.createStatement();
ResultSet rs = st.executeQuery("select * from products where id='" + id + "'");
while(rs.next()){
%>

<form action="editProductAction.jsp" method="post">
<input type="hidden" name="id" value="<%=id%>">
<div class="left-div">
 <h3>Enter Name</h3>
<input class="input-style" type="text" name="name" value="<%=rs.getString(2)%>">
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 <input class="input-style"class="input-style" type="text" name="category" value="<%=rs.getString(3)%>">
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input class="input-style" type="text" name="price" value="<%=rs.getString(4)%>">
<hr>
</div>

<div class="right-div">
<h3>Status</h3>
<select class="input-style" name="status">
<option value="Active">Active</option>
<option value="InActive">InActive</option></select>
 <hr>
</div>
 <button class="button">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<%
}
} catch (Exception e) {
System.out.println(e);
}
%>


</body>
<br><br><br>
</body>
</html>








34.Edit products action

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");
String status = request.getParameter("status");

try {
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("update products set name='" + name + "' , category='" + category + "' , price='" + price + "' , status='"
	+ status + "' where id='" + id + "'");

	if (status.equals("InActive")) {
		st.executeUpdate("delete from cart where product_id='" + id + "' and address is NULL");
	}

	response.sendRedirect("allProductEditProduct.jsp?msg=yes");
} catch (Exception e) {
	response.sendRedirect("allProductEditProduct.jsp?msg=no");
	System.out.println(e);
}
%>



35.Messages received

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Messages Received <i class='fas fa-comment-alt'></i></div>
<table>
<thead>
<tr>
<th scope="col">ID</th>
<th scope="col">Email</th>
<th scope="col">Subject</th>
<th scope="col">Body</th>
</tr>
</thead>
<tbody>
 <%
try
       {
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement () ;
ResultSet rs=st.executeQuery("select *from message");
while(rs.next())
{
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
</tr>
<%
}
}
catch (Exception e){
System.out.println (e) ;
}
%>
</tbody>
</table>
<br>
<br>
<br>

</body>
</html>

















36.Orders received

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Home</title>
<style>
.th-style
{ width: 25%;}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Orders Received <i class="fas fa-archive"></i></div>
<%
String msg=request.getParameter("msg");
if("cancel".equals(msg))
{
%>
<h3 class="alert">Order Cancel Successfully!</h3>
<%
}
%>
<%
if("delivered".equals(msg))
{
%>
<h3 class="alert">Successfully Updated!</h3>
<%
}
%>
<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%
}
%>

<table id="customers">
<tr>
<th>Mobile Number</th>
<th scope="col">Product Name</th>
<th scope="col">Quantity</th>
<th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
<th>Address</th>
<th>City</th>
<th>State</th>
<th>Country</th>
<th scope="col">Order Date</th>
<th scope="col">Expected Delivery Date</th>
<th scope="col">Payment Method</th>
<th scope="col">T-ID</th>
<th scope="col">Status</th>
<th scope="col">Cancel order <i class='fas fa-window-close'></i></th>
<th scope="col">Order Delivered <i class='fas fa-dolly'></i></i></th>
</tr>
<%
int sno=0;
try
{
Connection con=ConnectionProvider.getCon ();
Statement st=con.createStatement() ;
ResultSet rs=st.executeQuery("select * from cart inner join products where cart.product_id=products.id and cart.orderDate is not NULL and cart.status='processing'");
while(rs.next())
{
sno=sno+1;
%>
       
<tr>
<td><%=rs.getString(10) %></td>
<td><%=rs.getString(17) %></td>
<td><%=rs.getString(3) %></td>
<td><i class="fa fa-inr"></i>  <%=rs.getString(5) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
<td><%=rs.getString(8) %></td>
<td><%=rs.getString(9) %></td>
<td><%=rs.getString(11) %></td>
<td><%=rs.getString(12) %></td>
<td><%=rs.getString(13) %></td>
<td><%=rs.getString(14) %></td>
<td><%=rs.getString(15) %></td>
<td><a href="cancelOrdersAction.jsp?id=<%=rs.getString(2)%>&email=<%=rs.getString(1)%>">Cancel <i class='fas fa-window-close'></i></a></td>
<td><a href="deliveredOrdersAction.jsp?id=<%=rs.getString(2)%>&email=<%=rs.getString(1)%>">Delivered <i class='fas fa-dolly'></i></i></a></td>
</tr>
<%
}
}
catch(Exception e){
	System.out.println(e);
}
%>
</table>
<br>
<br>
<br>

</body>
</html>













37.Cancel orders

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Home</title>
<style>
.th-style
{ width: 25%;}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Cancel Orders <i class='fas fa-window-close'></i></div>

<table id="customers">
<tr>
<th>Mobile Number</th>
<th scope="col">Product Name</th>
<th scope="col">Quantity</th>
<th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
<th>Address</th>
<th>City</th>
<th>State</th>
<th>Country</th>
<th scope="col">Order Date</th>
<th scope="col">Expected Delivery Date</th>
<th scope="col">Payment Method</th>
<th scope="col">T-ID</th>
<th scope="col">Status</th>
</tr>
<%
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from cart inner join products where cart.product_id=products.id and cart.orderDate is not NULL and cart.status='cancel'");
	while(rs.next())
	{
%>        
       
<tr>
<td><%=rs.getString(10) %></td>
<td><%=rs.getString(17) %></td>
<td><%=rs.getString(3) %></td>
<td><i class="fa fa-inr"></i><%=rs.getString(5) %>  </td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
<td><%=rs.getString(8) %></td>
<td><%=rs.getString(9) %></td>
<td><%=rs.getString(11) %></td>
<td><%=rs.getString(12) %></td>
<td><%=rs.getString(13) %></td>
<td><%=rs.getString(14) %></td>
<td><%=rs.getString(15) %></td>
</tr>
 <%
	}
}
catch(Exception e){
	System.out.println(e);
}
 %>
</table>
<br>
<br>
<br>

</body>
</html>






38.Cancel orders action

<%@page import="com.project.ConnectionProvider" %>
<%@page import= "java.sql.*" %>

<% 
String id=request.getParameter("id");
String email=request.getParameter ("email");
String status="Cancel";
try
{
Connection con=ConnectionProvider .getCon ();
Statement st=con.createStatement();
st.executeUpdate("update cart set status='"+status+"' where product_id='"+id+"' and email='"+email+"' and address is not NULL");
response.sendRedirect("ordersReceived.jsp?msg=delivered");
}
catch(Exception e){
	System.out.println (e);
	response.sendRedirect ("ordersReceived.jsp?msg=wrong");	
}
%>



39.Delivered orders

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Home</title>
<style>
.th-style
{ width: 25%;}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Delivered Orders <i class='fas fa-dolly'></i></div>

<table id="customers">
<tr>
<th>Mobile Number</th>
<th scope="col">Product Name</th>
<th scope="col">Quantity</th>
<th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
<th>Address</th>
<th>City</th>
<th>State</th>
<th>Country</th>
<th scope="col">Order Date</th>
<th scope="col">Expected Delivery Date</th>
<th scope="col">Payment Method</th>
<th scope="col">T-ID</th>
<th scope="col">Status</th>
</tr>
<%
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from cart inner join products where cart.product_id=products.id and cart.orderDate is not NULL and cart.status='delivered'");
	while(rs.next())
	{
%>        
       
<tr>
<td><%=rs.getString(10) %></td>
<td><%=rs.getString(17) %></td>
<td><%=rs.getString(3) %></td>
<td><i class="fa fa-inr"></i><%=rs.getString(5) %>  </td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
<td><%=rs.getString(8) %></td>
<td><%=rs.getString(9) %></td>
<td><%=rs.getString(11) %></td>
<td><%=rs.getString(12) %></td>
<td><%=rs.getString(13) %></td>
<td><%=rs.getString(14) %></td>
<td><%=rs.getString(15) %></td>
</tr>
 <%
	}
}
catch(Exception e){
	System.out.println(e);
}
 %>
</table>
<br>
<br>
<br>

</body>
</html>






40.Deliver order action

<%@page import="com.project.ConnectionProvider" %>
<%@page import= "java.sql.*" %>

<% 
String id=request.getParameter("id");
String email=request.getParameter ("email");
String status="Delivered";
try
{
Connection con=ConnectionProvider .getCon ();
Statement st=con.createStatement();
st.executeUpdate("update cart set status='"+status+"' where product_id='"+id+"' and email='"+email+"' and address is not NULL");
response.sendRedirect("ordersReceived.jsp?msg=cancel");
}
catch(Exception e){
	System.out.println (e);
	response.sendRedirect ("ordersReceived.jsp?msg=wrong");	
}
%>



Databases

Create Tables:

<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
try {
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	String q1 = "create table users(name varchar(50), email varchar(100) primary key, mobilenumber bigint, securityQuestion varchar(200), answer varchar(200), password varchar(200), address varchar(500), city varchar(100), state varchar(100), country varchar(100))";
	System.out.println(q1);
	String q2 = "create table products(id int, name varchar(100), category varchar(100), price int, status varchar(50))";
	System.out.println(q2);
	String q3="create table cart(email varchar(100), product_id int, quantity int, price int, total int, address varchar(200), city varchar(100), state varchar(100), country varchar(100), mobileNumber bigint, orderDate varchar(100), deliveryDate varchar(100), paymentMethod varchar(100), transactionID varchar(100), status varchar(100))";
	System.out.println(q3);
	String q4="create table message(id int AUTO_INCREMENT, email varchar(100), subject varchar(100), body varchar(2000), PRIMARY KEY(id))";
	System.out.println(q4);
	//st.execute(q1);
	//st.execute(q2);
	//st.execute(q3);
	st.execute(q4);
	System.out.println("Table Created");
	con.close();
} catch (Exception e) {	
	System.out.println(e);
}
%>
JDBC Connection provider:

package com.project;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
public static Connection getCon() {
try {
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerceproject", "root","2020");
return con;
}

catch (Exception e) {
System.out.println(e);
return null;
}
}
}


