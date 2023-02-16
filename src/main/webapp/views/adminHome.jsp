<%@ page import="java.sql.*" %>
<%@ page import="static com.jtspringproject.JtSpringProject.controller.AdminController.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<!-- Meta Tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Title -->
	<title>GM - Admin</title>
	<!-- Style Sheet -->
	<link rel="stylesheet" type="text/css" href="../views/css/astyle.css" />
</head>
<body>

<%@include file="common/header3.jspf"%>

<main>

	<div class="main-content">
		<div class="sidebar">
			<h3>Menu</h3>
			<ul>
				<li><a class="active" href="adminhome">Home</a></li>
				<li><a href="orders">Order</a></li>
				<li><a href="addProduct">Product</a></li>
				<li><a href="addCategory">Category</a></li>
				<li><a href="addStock">Stock</a></li>
				<li><a href="users">Users</a></li>
			</ul>
		</div>
		<div class="content dashboard">
			<h3>Dashboard</h3>
			<div class="content-data">
				<div class="content-detail">
					<h4>Low Stock Report</h4>
					<table>
						<thead>
						<tr>
							<th>Product</th>
							<th>Price</th>
							<th>Category</th>
							<th>Qty</th>
						</tr>
						</thead>
						<%
							try {
								String url = DBConnection;
								Class.forName("com.mysql.cj.jdbc.Driver");
								Connection con = DriverManager.getConnection(url, DBUser,DBPass);
								Statement stmt = con.createStatement();
								ResultSet rs = stmt.executeQuery("select * from products join categories c on c.category_id = products.category_id order by quantity");
						%>
						<tbody>
						<% for (int i =0; i < 5; i++) { rs.next(); %>
						<tr>
							<td><%= rs.getString(2)%></td>
							<td><%= rs.getInt(3)%>.00 Birr</td>
							<td><%= rs.getString(11)%></td>
							<td><%= rs.getString(6)%></td>

							<td><a href="addProduct">View</a></td>
						</tr>
						<%}%>
						</tbody>
						<%
							} catch (Exception e) {
								System.out.println("Exception: " + e);
							}
						%>
					</table>
					<br><br>
					<h4>Recent Orders</h4>
					<table>
						<thead>
						<tr>
							<th>Date</th>
							<th>Order Ref#</th>
							<th>User</th>
							<th>Amount</th>
							<th>View</th>
						</tr>
						</thead>
						<%
							try {
								String url = DBConnection;
								Class.forName("com.mysql.cj.jdbc.Driver");
								Connection con = DriverManager.getConnection(url, DBUser,DBPass);
								Statement stmt = con.createStatement();
								ResultSet rs = stmt.executeQuery("select id, date , price, status, pmode, username from `order` join users on order.userId = users.user_id ");
						%>
						<tbody>
						<% while (rs.next()) {%>
						<tr>
							<td><%= rs.getString(2)%></td>
							<td>61245231<%= rs.getInt(1)%></td>
							<td><%= rs.getString(6)%></td>
							<td><%= rs.getInt(3)%>.00 Birr</td>

							<td><a href="#">View</a></td>
						</tr>
						<%}%>
						</tbody>
						<%
							} catch (Exception e) {
								System.out.println("Exception: " + e);
							}
						%>
					</table>
				</div>
				<div class="content-detail">
					<h4>Completed Order</h4>
					<table>
						<thead>
						<tr>
							<th>Date</th>
							<th>Order Ref#</th>
							<th>User</th>
							<th>Amount</th>
<%--							<th>View</th>--%>
						</tr>
						</thead>
						<%
							try {
								String url = DBConnection;
								Class.forName("com.mysql.cj.jdbc.Driver");
								Connection con = DriverManager.getConnection(url, DBUser,DBPass);
								Statement stmt = con.createStatement();
								ResultSet rs = stmt.executeQuery("select id, date , price, status, pmode, username from `order` join users on order.userId = users.user_id where status = 1 order by date desc ");
						%>

						<tbody>
						<% while (rs.next()) {%>
						<tr>
							<td><%= rs.getString(2)%></td>
							<td>61245231<%= rs.getInt(1)%></td>
							<td><%= rs.getString(6)%></td>
							<td><%= rs.getInt(3)%>.00 Birr</td>

							<td><a href="orders">View</a></td>
						</tr>
						<%}%>
						</tbody>
						<%
							} catch (Exception e) {
								System.out.println("Exception: " + e);
							}
						%>
					</table>
				</div>
			</div>
		</div>
	</div>

</main> <!-- Main Area -->

<footer>
	<div class="container">
		<div class="footer-bar">
			<div class="copyright-text">
				<p>Proudly made by Section A Software Engineering Students.<br>
              Copyright &copy; AASTU 2023 - All Rights Reserved.<p>
			</div>
		</div> <!-- Footer Bar -->
	</div>
</footer> <!-- Footer Area -->

</body>

</html>