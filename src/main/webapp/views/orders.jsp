<%@ page import="java.sql.*" %>
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
                <li><a href="adminhome">Home</a></li>
                <li><a class="active" href="orders">Order</a></li>
                <li><a href="addProduct">Product</a></li>
                <li><a href="addCategory">Category</a></li>
                <li><a href="addStock">Stock</a></li>
                <li><a href="users">Users</a></li>
            </ul>
        </div>
        <div class="content">
            <h3>Order</h3>
            <div class="content-detail">
                <table>
                    <thead>
                    <tr>
                        <th>Date</th>
                        <th>Order Ref#</th>
                        <th>User</th>
                        <th>Amount</th>
                        <th>Payment Mode</th>
                        <th>Status</th>
                        <th>View</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <%
                        try {
                            String url = "jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway";
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection(url, "root","LK0nTR9wwyRwBq6qflc0");
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

                        <% if(rs.getInt(5) == 1){%>
                        <td>Cash</td>
                        <%}else if(rs.getInt(5)== 2){%>
                        <td>Telebirr</td>
                        <%}else if(rs.getInt(5)== 3){%>
                        <td>Bank</td>
                        <%}%>

                        <% if(rs.getInt(4) == 0){%>
                        <td>pending</td>
                        <%}else{%>
                        <td>delivered</td>
                        <%}%>

                        <td><a href="#">View</a></td>
                        <td><a href="#">Delete</a></td>
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

</main> <!-- Main Area -->

<footer>
    <div class="container">
        <div class="footer-bar">
            <div class="copyright-text">
                <p>Copryright 2023 - All Rights Reserved</p>
            </div>
        </div> <!-- Footer Bar -->
    </div>
</footer> <!-- Footer Area -->

</body>

</html>