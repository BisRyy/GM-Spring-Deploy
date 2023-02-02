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

<header>
    <div class="container">
        <div class="brand">
            <div class="logo">
                <a href="index">
                    <img src="../views/img/icons/online_shopping.png">
                    <div class="logo-text">
                        <p class="big-logo">Grain Mill</p>
                        <p class="small-logo">Market&Delivery</p>
                    </div>
                </a>
            </div> <!-- logo -->
            <div class="shop-icon">
                <div class="dropdown">
                    <img src="../views/img/icons/account.png">
                    <div class="dropdown-menu">
                        <ul>
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">Settings</a></li>
                            <li><a href="#">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div> <!-- shop icons -->
        </div> <!-- brand -->
    </div> <!-- container -->
</header> <!-- header -->

<main>

    <div class="main-content">
        <div class="sidebar">
            <h3>Menu</h3>
            <ul>
                <li><a href="adminhome">Home</a></li>
                <li><a href="orders">Order</a></li>
                <li><a href="addProduct">Product</a></li>
                <li><a href="addCategory">Category</a></li>
                <li><a href="addStock">Stock</a></li>
                <li><a class="active" href="users">Users</a></li>
            </ul>
        </div>
        <div class="content">
            <h3>Users</h3>
            <div class="content-detail">
                <table>
                    <thead>
                    <tr>
                        <th>Username</th>
                        <th>First name</th>
                        <th>Last name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Country</th>
                        <th>city</th>
                        <th>Address</th>
                    </tr>
                    </thead>
                    <%
                        try {
                            String url = "jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway";
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection(url, "root","LK0nTR9wwyRwBq6qflc0");
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery("select username, f_name, l_name, email, phone, country, city, address from users");
                    %>
                    <tbody>
                    <% while (rs.next()) {%>
                    <tr>
                        <td><%= rs.getString(1)%></td>
                        <td><%= rs.getString(2)%></td>
                        <td><%= rs.getString(3)%></td>
                        <td><%= rs.getString(4)%></td>
                        <td><%= rs.getString(5)%></td>
                        <td><%= rs.getString(6)%></td>
                        <td><%= rs.getString(7)%></td>
                        <td><%= rs.getString(8)%></td>
                        <td><%= request.getRemoteAddr()%></td>
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