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
                <li><a href="orders">Order</a></li>
                <li><a href="addProduct">Product</a></li>
                <li><a class="active" href="addCategory">Category</a></li>
                <li><a href="addStock">Stock</a></li>
                <li><a href="users">Users</a></li>
            </ul>
        </div>
        <div class="content">
            <h3>Catogory</h3>
            <div class="content-data">
                <div class="content-form">

                    <form action="addCat" method="post">
                        <h4>Add Category</h4>
                            <div class="form-group">
                                <label>Category Name</label>
                                <input type="text" name="cat_name" required>
                            </div>
                        <div class="form-group">
                            <label></label>
                            <input type="submit" name="addCategory" value="Add Category">
                        </div>
                    </form>

                </div>
                <div class="content-detail">
                    <h4>All Categories</h4>
                    <table>
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Category Name</th>
<%--                            <th>Edit</th>--%>
<%--                            <th>Delete</th>--%>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            try {
                            String url = DBConnection;
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection(url, DBUser,DBPass);
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery("select * from categories");
                            ResultSet rs1;

                            while(rs.next()){
                        %>
                        <tr>
                            <td><%= rs.getInt(1)%></td>
                            <td><%= rs.getString(2)%></td>
                            <td><a href="removeCategory?oid=<%=rs.getInt(1)%>"> Remove</a> </td>
                        </tr>

                        <%}
                            } catch (Exception e) {
                                System.out.println("Exception: " + e);
                            }
                        %>
                        </tbody>
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
                <p>Copryright 2023 - All Rights Reserved</p>
            </div>
        </div> <!-- Footer Bar -->
    </div>
</footer> <!-- Footer Area -->

</body>

</html>