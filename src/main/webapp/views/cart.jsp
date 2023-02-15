<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="common/meta.jspf"%>
    <title>My Cart - GM</title>
    <script>
        $(document).ready(function(){

            $('.prev').on("click", function(){

                var prev = $(this).closest('.qty').find("input").val();

                if (prev <= 10) {
                    $(this).closest('.qty').find("input").val('10');
                }else{
                    var prevVal = prev - 10;
                    $(this).closest('.qty').find("input").val(prevVal);
                }
            });
            $('.next').on("click", function(){

                var next = $(this).closest('.qty').find("input").val();

                if (next >= 1000) {
                    $(this).closest('.qty').find("input").val('10');
                }else{
                    var nextVal = parseInt(next) + 10;
                    $(this).closest('.qty').find("input").val(nextVal);
                }
            });
        });
    </script>
</head>
<body>

<%@include file="common/header.jspf"%>
<%
    try {
        String url = DBConnection;
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, DBUser,DBPass);
        Statement stmt = con.createStatement();
        Statement stmt2 = con.createStatement();
        ResultSet rs = stmt.executeQuery(" select * from products join cart on products.id = cart.productId join categories c on c.category_id = products.category_id where cart.userId =" + request.getAttribute("userid"));
        int items = 0;
        float total = 0;
        float mtotal = 0;
%>
<div class="container">
    <main>
        <div class="breadcrumb">
            <ul>
                <li><a href="index">Home</a></li>
                <li> / </li>
                <li><a href="shop">Shop</a></li>
                <li> / </li>
                <li>Cart</li>
            </ul>
        </div> <!-- End of Breadcrumb-->

        <h2>Shopping Cart</h2>
        <div class="cart-page">
            <div class="cart-items">
                <table>
                    <tbody>

                    <%
                        while (rs.next()){
                            items++;
                            total += rs.getInt(3) * rs.getInt(13);
                            mtotal += rs.getInt(4) * rs.getInt(13);
                    %>
                    <tr>
                        <td style="width: 20%;"><img src="../views/img/product/img<%= rs.getInt(1) %>.jpg"></td>
                        <td style="width: 60%;">
                            <h2><%=rs.getString(2)%></h2>
                            <p><%= rs.getString(8)%></p>
                            <br>
                            <h3>Price: <%= rs.getInt(3)%> Birr</h3>
                            <span style="float: right; position: relative; right: 30%; bottom: 18px;">Milling Cost: <%= rs.getInt(4)%> Birr</span>
                            <br>
                            <a href="cart/remove?cid=<%= rs.getInt(10) %>">x</a> Remove
                        </td>
                        <td class="qty" style="width: 15%;">
                            <div class="prev">-</div>
                            <div class="next">+</div>
                            <input type="number" name="cartNumber" class="cartNumber" value="<%= rs.getInt(13)%>" min="0" step="10">
                            <br><br>
                            <h3><%= (float) rs.getInt(3) * rs.getInt(13)%> Birr</h3>
                        </td>
                    </tr>
                    <%}%>

                    </tbody>
                    <thead>
                    <tr>
                        <th colspan="3">Cart Items</th>
                    </tr>
                    </thead>
                </table>
                <div class="pagination">
                    <ul>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                    </ul>
                </div>
            </div>
            <div class="cart-summary">
                <div class="checkout-total">
                    <h3>Cart Summary</h3>
                    <ul>
                        <li>Number of Products  <span style="float: right;">x <%= items %></span></li>
                        <br>
                        <li>Products Cost: <span style="float: right;"><%= total %>0 Birr</span></li>
                        <br>
                        <li>Milling Cost: <span style="float: right;"><%= mtotal %>0 Birr</span></li>
                        <br>
                        <li>Cart Total <span style="float: right;"><%= total + mtotal %>0 Birr</span></li>
                        <li><a href="checkout?items=<%= items %>&total=<%= total %>&mtotal=<%= mtotal %>">Go to Checkout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </main> <!-- Main Area -->
</div>
<%
    } catch (Exception ex) {
    out.println("Exception Occurred:: " + ex.getMessage());
    }
%>
<%@include file="common/footer.jspf"%>

</body>

</html>