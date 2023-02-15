<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta Tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Title -->
    <title>My Orders - GM</title>
    <!-- Style Sheet -->
    <link rel="stylesheet" type="text/css" href="../views/css/style.css" />
    <!-- Javascript -->
    <script type="text/javascript" src="../views/js/jquery.min.js"></script>
</head>
<body>

<%@include file="common/header.jspf"%>

<div class="container">
    <main>
        <div class="breadcrumb">
            <ul>
                <li><a href="index">Home</a></li>
                <li> / </li>
                <li><a href="account">Account</a></li>
                <li> / </li>
                <li>Orders</li>
            </ul>
        </div> <!-- End of Breadcrumb-->

<%
    try {
        String url = DBConnection;
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, DBUser,DBPass);
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select id, date , price, status, pmode from `order` join users on order.userId = users.user_id where users.user_id = " + AdminController.currentUser.getId());

%>
        <div class="account-page">
            <div class="profile">
                <div class="profile-img">
                    <img src="../views/img/product/unnamed.jpg">
                    <h2>${user.getUsername()}</h2>
                    <p>${user.getEmail()}</p>
                </div>
                <ul>
                    <li><a href="account">Account <span>></span></a></li>
                    <li><a href="myOrders" class="active">My Orders <span>></span></a></li>
                    <li><a href="changepassword">Change Password <span>></span></a></li>
                    <li><a href="logout">Logout <span>></span></a></li>
                </ul>
            </div>
            <div class="account-detail">
                <h2>My Orders</h2>
                <div class="order-detail">
                    <table>
                        <thead>
                        <tr>
                            <th>Date</th>
                            <th>Order Ref#</th>
                            <th>Amount</th>
                            <th>Payment Mode</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% while (rs.next()) {%>
                        <tr>
                            <td><%= rs.getString(2)%></td>
                            <td>61231<%= rs.getInt(1)%></td>
                            <td><%= rs.getInt(3)%>.00 Birr</td>

                            <% if(rs.getInt(5) == 1){%>
                            <td>Cash</td>
                            <%}else if(rs.getInt(5)== 2){%>
                            <td>Telebirr</td>
                            <%}else if(rs.getInt(5)== 3){%>
                            <td>Bank</td>
                            <%}%>

                            <% if(rs.getInt(4) == 0){%>
                                <td>pending...</td>
                            <% }else if(rs.getInt(4) == 2){%>
                            <td>Cancelled</td>
                            <%}else{%>
                            <td>Completed</td>
                            <%}%>
                            <% if(rs.getInt(4) == 0){%>
                            <td><a href="orders/update?type=3&oid=<%= rs.getInt(1) %>">Cancel</a></td>
                            <%}%>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main> <!-- Main Area -->
</div>
<%
} catch (Exception e) {
    System.out.println("Exception: " + e);
}
%>
<%@include file="common/footer.jspf"%>

</body>

</html>