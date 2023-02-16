<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta Tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Title -->
    <title>My Account - GM</title>
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
                <li>Account</li>
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
                    <li><a href="account" class="active">Account <span>></span></a></li>
                    <li><a href="myOrders">My Orders <span>></span></a></li>
                    <li><a href="changepassword">Change Password <span>></span></a></li>
                    <li><a href="logout">Logout <span>></span></a></li>
                </ul>
            </div>
            <div class="account-detail">
                <h2>Account</h2>
                <div class="billing-detail">
                    <form class="checkout-form" action="updateuser" method="post">
                        <div class="form-inline">
                            <div class="form-group">
                                <label for="username">User Name (Required)</label>
                                <input type="text" id="username" name="username" value="${user.getUsername()}" required>
                            </div>
                            <div class="form-group">
                                <label for="age">Age (Required)</label>
                                <input type="number" id="age" name="age" min="18" value="18" required>
                            </div>
                        </div>
                        <div class="form-inline">
                            <div class="form-group">
                                <label>First Name</label>
                                <input type="text" id="fname" name="fname" value="${user.getFirstName()}">
                            </div>
                            <div class="form-group">
                                <label>Last Name</label>
                                <input type="text" id="lname" name="lname" value="${user.getLastName()}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Email Address</label>
                            <input type="email" id="cname" name="email" value="${user.getEmail()}">
                        </div>
                        <div class="form-inline">
                            <div class="form-group">
                                <label for="country">Country</label>
                                <select id="country" name="country">
                                    <option >---Select a Country---</option>
                                    <option selected value="pakistan">Ethiopia</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="country">State</label>
                                <select id="state" name="state">
                                    <option >---Select a State---</option>
                                    <option selected value="Addis">Addis Ababa</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="city">City</label>
                                <select id="city" name="city">
                                    <option >---Select a City---</option>
                                    <option selected value="Addis">Addis Ababa</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-inline">
                            <div class="form-group">
                                <label>Mobile</label>
                                <input type="text" id="phone" name="phone" minlength="9" maxlength="12" placeholder="251-XXXXXXX" value="${user.getPhone()}">
                            </div>
                            <div class="form-group">
                                <label>Images</label>
                                <input type="file" name="image" multiple>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="address">Address</label>
                            <textarea style="resize:none" id="address" name="address" rows="3">${address} </textarea>
                        </div>
                        <div class="form-group">
                            <label></label>
                            <input type="submit" id="update" name="update" value="Update">
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
                        <li><a href="about">About</a></li>
                        <li><a href="contact">Contact</a></li>
                        <li><a href="refund">Refund Policy</a></li>
                        <li><a href="terms">Terms & Conditions</a></li>
                    </ul>
                </div>
            </div>
            <div class="widget">
                <div class="widget-heading">
                    <h3>Information</h3>
                </div>
                <div class="widget-content">
                    <ul>
                        <li><a href="account">My Account</a></li>
                        <li><a href="orders">My Orders</a></li>
                        <li><a href="cart">Cart</a></li>
                        <li><a href="checkout">Checkout</a></li>
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
                            <li><a href="#"><img src="../views/img/icons/facebook.png" alt=""></a></li>
                            <li><a href="#"><img src="../views/img/icons/twitter.png" alt=""></a></li>
                            <li><a href="#"><img src="../views/img/icons/instagram.png" alt=""></a></li>
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
                <p>Proudly made by Section A Software Engineering Students.<br>
                    Copyright &copy; AASTU 2023 - All Rights Reserved.<p>
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