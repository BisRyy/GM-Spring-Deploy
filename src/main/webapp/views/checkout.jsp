<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta Tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Title -->
    <title>E-Commerce Online Shop</title>
    <!-- Style Sheet -->
    <link rel="stylesheet" type="text/css" href="../views/css/style.css" />
    <!-- Javascript -->
    <script type="text/javascript" src="../views/js/jquery.min.js"></script>
    <script>
        $(document).ready(function(){

            $('input[type="radio"]').change(function(){

                if (this.value === 'easypaisa') {

                    $('#easypaisaText').css('display', 'block');
                }
                else {
                    $('#easypaisaText').css('display', 'none');
                }

            });
        });
    </script>
</head>
<body>

<%@include file="common/header.jspf"%>

<div class="container">
    <main>
        <div class="breadcrumb">
            <ul>
                <li><a href="index">Home</a></li>
                <li> / </li>
                <li><a href="shop">Shop</a></li>
                <li> / </li>
                <li><a href="cart">Cart</a></li>
                <li> / </li>
                <li>Checkout</li>
            </ul>
        </div> <!-- End of Breadcrumb-->

        <h2>Billing Detail</h2>
        <div class="checkout-page">
            <div class="billing-detail">
                <form class="checkout-form" action="check" method="post">
                    <h4>Shipping Detail</h4>
                    <div class="form-inline">
                        <div class="form-group">
                            <label>First Name</label>
                            <input type="text" id="fname" name="fname" required>
                        </div>
                        <div class="form-group">
                            <label>Last Name</label>
                            <input type="text" id="lname" name="lname">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Company Name (Optional)</label>
                        <input type="text" id="cname" name="cname">
                    </div>
                    <div class="form-inline">
                        <div class="form-group">
                            <label>Country</label>
                            <select id="country" name="country">
                                <option>---Select a Country---</option>
                                <option>Ethiopia</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>City</label>
                            <select id="cityy" name="cityy">
                                <option>---Select a City---</option>
                                <option>Addis Ababa</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <textarea style="resize:none" id="address" name="address" rows="3" minlength="10" required></textarea>
                    </div>
                    <h4>Login Detail</h4>
                    <div class="form-inline">
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" id="email" name="email" autocomplete="off" required>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" id="password" name="password" autocomplete="off" required>
                        </div>
                    </div>
                    <h4>Contact Detail</h4>
                    <div class="form-inline">
                        <div class="form-group">
                            <label>Tel</label>
                            <input type="text" id="tel" name="tel" minlength="11" maxlength="11">
                        </div>
                        <div class="form-group">
                            <label>Mobile</label>
                            <input type="text" id="mobile" name="mobile" minlength="11" maxlength="11">
                        </div>
                    </div>
                    <h4>Additional Information (Optional)</h4>
                    <div class="form-group">
                        <label for="note">Order Note</label>
                        <textarea style="resize:none" id="note" name="address" rows="3"></textarea>
                    </div>
            </div> <!-- End of Billing Detail-->
            <%
                try {
                    String url = "jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway";
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(url, "root","LK0nTR9wwyRwBq6qflc0");
                    Statement stmt = con.createStatement();
                    Statement stmt2 = con.createStatement();
                    ResultSet rs = stmt.executeQuery(" select * from products join cart on products.id = cart.productId join categories c on c.category_id = products.category_id where cart.userId =" + request.getAttribute("userid"));
                    int items = 0;
                    float total = 0;
                    float mtotal = 0;
            %>
            <div class="order-summary">
                <div class="checkout-total">
                    <h3>Order Summary</h3>
                    <ul>
                        <li>Number of Products  <span style="float: right;">x ${items}</span></li>
                        <li>Products Cost: <span style="float: right;">${ total }0 Birr</span></li>
                        <li>Milling Cost: <span style="float: right;">${mtotal}0 Birr</span></li>
                        <hr>
                        <li>Cart Total <span style="float: right;">${ total + mtotal }0 Birr</span></li>
                        <hr>
                        <li>Delivery Charges: <span> + ${ 0.05 * (total + mtotal) }0 Birr</span></li>
                        <li>Discount @ 10%: <span> - ${ 0.1 * (total + mtotal) }0 Birr</span></li>
                        <hr>
                        <li>Total Amount: <span> ${ 0.85 * (total + mtotal) }0 Birr</span></li>
                        <hr>
                        <input type="number" name="items" value="${items}" hidden>
                        <input type="number" name="price" value=${ 0.85 * (total + mtotal) } hidden>

                        <li><input type="radio" name="pmode" value="1" checked> Cash on Delivery</li>
                        <li><input type="radio" id="easypaisa" name="pmode" value="2"> Telebirr Account</li>
                        <li>
                            <textarea id="telebirr" rows="5" disabled="disable">Please deposit the payment in our telebirr account# 251-XXXXXXX after confirm payment kindly send us payment slip and order transaction id on above number.</textarea>
                        </li>
                        <li><input type="radio" name="pmode" value="3"> Bank Transferred</li>
                        <hr>
                        <li><input type="submit" name="order" value="Place Order"></li>
                    </ul>
                </div>
                </form> <!-- End of Checkout Form -->
            </div>
        </div>
        <%
            } catch (Exception ex) {
                out.println("Exception Occurred:: " + ex.getMessage());
            }
        %>
    </main> <!-- Main Area -->
</div>

<%@include file="common/footer.jspf"%>

</body>

</html>