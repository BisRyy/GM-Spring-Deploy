<%@page import="java.sql.*"%>
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
                <li><a class="active" href="addProduct">Product</a></li>
                <li><a href="addCategory">Category</a></li>
                <li><a href="addStock">Stock</a></li>
                <li><a href="users">Users</a></li>
            </ul>
        </div>
        <div class="content">
            <h3>Product</h3>
            <div class="content-data">
                <%
                    try {
                        String url = DBConnection;
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection(url, DBUser,DBPass);
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("select * from products order by id desc");
                        ResultSet rs1;
                %>
                <div class="content-form">
                    <form action="sendData" method="post">
                        <h4>Add a new Product</h4>
                        <div class="form-inline">
                            <%
                                if (rs.next()) {
                            %>
                            <div class="form-group" style="width: 20%;">

                                <label for="id">Id</label>
                                <input type="number" id="id" readonly="readonly" class="form-control border border-warning" name="id"  value="<%=rs.getInt(1) + 1%>">
                            </div>
                            <%
                                }
                            %>

                            <div class="form-group" style="width: 75%;">
                                <label>Product Name</label>
                                <input type="text" name="pname" required>
                            </div>
                        </div>
                        <div class="form-inline" >
                            <div class="form-group" style="width: 30%;">
                                <label>Price</label>
                                <input type="number" name="price" required>
                            </div>
                            <div class="form-group" style="width: 30%;">
                                <label>Milling Cost</label>
                                <input type="number" name="mprice" required>
                            </div>
                            <div class="form-group" style="width: 30%;">
                                <label>Quantity (Kg)</label>
                                <input type="number" name="quantity" min="10" required>
                            </div>
                        </div>
                        <div class="form-inline">
                            <div class="form-group">
                                <label>Category</label>
                                <select name="categoryid">
                                    <option>---Select a Category---</option>
                                    <%
                                        rs = stmt.executeQuery("select * from categories");
                                        while(rs.next())
                                        {
                                    %>
                                    <option selected><%= rs.getString(2) %></option>
                                    <%
                                        }
                                    %>
                                    <option>Other</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Images</label>
                                <input type="file" name="productImage" accept="image/png, image/jpeg, image/jpg" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Short Description</label>
                            <input type="text" name="sdesc" required>
                        </div>
                        <div class="form-group">
                            <label>Long Description (Optional)</label>
                            <textarea style="resize:none" name="ldesc" rows="3"></textarea>
                        </div>
                        <div class="form-group">
                            <label></label>
                            <input type="submit" name="addProduct" value="Add Product">
                        </div>

                    </form>
                </div>
                <div class="content-detail">
                    <h4>All Products</h4>
                    <table>
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Mill Cost</th>
                            <th>quantity</th>
                            <th>Category</th>
<%--                            <th>Edit</th>--%>
                            <th>Remove</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            rs = stmt.executeQuery("select * from products join categories c on c.category_id = products.category_id order by id");

                            while(rs.next())
                            {
                        %>
                        <tr>
                            <th><%= rs.getInt(1) %></th>
                            <th><%= rs.getString(2)%></th>
                            <th><%= rs.getString(3)%></th>
                            <th><%= rs.getString(4)%></th>
                            <th><%= rs.getString(6)%></th>
                            <th>
                                <%=rs.getString(11)%>
                            </th>
<%--                            <th>Edit</th>--%>
                            <th><a href="removeProduct?oid=<%=rs.getInt(1)%>">X</a></th>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
                <%
                    } catch (Exception e) {
                        System.out.println("Exception: " + e);
                    }
                %>
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