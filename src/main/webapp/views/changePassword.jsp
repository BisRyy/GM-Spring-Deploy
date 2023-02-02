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
                <li>Change Password</li>
            </ul>
        </div> <!-- End of Breadcrumb-->


        <div class="account-page">
            <div class="profile">
                <div class="profile-img">
                    <img src="../views/img/product/unnamed.jpg">
                    <h2>${user.getUsername()}</h2>
                    <p>${user.getEmail()}</p>
                </div>
                <ul>
                    <li><a href="account">Account <span>></span></a></li>
                    <li><a href="myOrders">My Orders <span>></span></a></li>
                    <li><a href="changepassword" class="active">Change Password <span>></span></a></li>
                    <li><a href="logout">Logout <span>></span></a></li>
                </ul>
            </div>
            <div class="account-detail">
                <h2>Change Password</h2>
                <div class="billing-detail">
                    <form class="checkout-form" action="changepass" method="post">
                        <div class="form-group">
                            <label>Old Password</label>
                            <input type="password" id="old_password" name="old_password" required>
                        </div>
                        <div class="form-inline">
                            <div class="form-group">
                                <label>New Password</label>
                                <input type="password" id="new_password" name="new_password" required>
                            </div>
                            <div class="form-group">
                                <label>Confirm Password</label>
                                <input type="password" id="confirm_password" name="confirm_password" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label></label>
                            <input type="submit" id="update_pass" name="update_pass" value="Update">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main> <!-- Main Area -->
</div>

<footer>
    <div class="container">
        <div class="footer-widget">
            <div class="widget">
                <div class="widget-heading">
                    <h3>Important Link</h3>
                </div>
                <div class="widget-content">
                    <ul>
                        <li><a href="about.html">About</a></li>
                        <li><a href="contact.html">Contact</a></li>
                        <li><a href="refund.html">Refund Policy</a></li>
                        <li><a href="terms.html">Terms & Conditions</a></li>
                    </ul>
                </div>
            </div>
            <div class="widget">
                <div class="widget-heading">
                    <h3>Information</h3>
                </div>
                <div class="widget-content">
                    <ul>
                        <li><a href="account.html">My Account</a></li>
                        <li><a href="orders.html">My Orders</a></li>
                        <li><a href="cart.html">Cart</a></li>
                        <li><a href="checkout.html">Checkout</a></li>
                    </ul>
                </div>
            </div>
            <div class="widget">
                <div class="widget-heading">
                    <h3>Follow us</h3>
                </div>
                <div class="widget-content">
                    <div class="follow">
                        <ul>
                            <li><a href="#"><img src="../views/img/icons/facebook.png"></a></li>
                            <li><a href="#"><img src="../views/img/icons/twitter.png"></a></li>
                            <li><a href="#"><img src="../views/img/icons/instagram.png"></a></li>
                        </ul>
                    </div>
                </div>
                <div class="widget-heading">
                    <h3>Subscribe for Newsletter</h3>
                </div>
                <div class="widget-content">
                    <div class="subscribe">
                        <form>
                            <div class="form-group">
                                <input type="text" class="form-control" name="subscribe" placeholder="Email">
                                <img src="../views/img/icons/paper_plane.png">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div> <!-- Footer Widget -->
        <div class="footer-bar">
            <div class="copyright-text">
                <p>Copyright 2021 - All Rights Reserved</p>
            </div>
            <div class="payment-mode">
                <img src="../views/img/icons/paper_money.png">
                <img src="../views/img/icons/visa.png">
                <img src="../views/img/icons/mastercard.png">
            </div>
        </div> <!-- Footer Bar -->
    </div>
</footer> <!-- Footer Area -->

</body>

</html>