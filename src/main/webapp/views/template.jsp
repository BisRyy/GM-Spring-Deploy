<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Date"%>
<%@ page import="com.jtspringproject.JtSpringProject.Modal.Location_Use_Bean" %>
<%@ page import="com.jtspringproject.JtSpringProject.Modal.Test" %>

<html lang="en" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>

    <title>GM - Template</title>

</head>
<body>

<header>
    <div class="container">
        <div class="brand">
            <div class="logo">
                <a href="/home">
                    <img src="../views/img/icons/online_shopping.png">
                    <div class="logo-text">
                        <p class="big-logo" style="line-height: 1;">Grain Mill</p>
                        <p class="small-logo" style="line-height: 1;">market  & delivery</p>
                    </div>
                </a>
            </div> <!-- logo -->

            <div class="menu">
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="/shop">Shop</a></li>
                    <li><a href="/about">About</a></li>
                    <li><a href="/contact">Contact</a></li>
                </ul>
            </div> <!-- menu -->
        </div> <!-- brand -->

    </div> <!-- container -->
</header> <!-- header -->



<div class="container" >
    <main >
        <%
            String ip = request.getHeader("x-forwarded-for");
            if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("Proxy-Client-IP");
            }
            if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("WL-Proxy-Client-IP");
            }
            if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getRemoteAddr();
            }

            var obj_Get_Location_From_IP=new Test();

            Location_Use_Bean obj_Location_Use_Bean=obj_Get_Location_From_IP.get_ip_Details(ip);

        %>

        Location details of User<br>

        1--IP Address--<%=ip %><br>
        2--Country Code--<%=obj_Location_Use_Bean.getCountry_code() %><br>
        3--Country--<%=obj_Location_Use_Bean.getCountry() %><br>
        4--State--<%=obj_Location_Use_Bean.getState() %><br>
        5--City--<%=obj_Location_Use_Bean.getCity() %><br>
        6--ZIP--<%=obj_Location_Use_Bean.getZip() %><br>
        7--Lat--<%=obj_Location_Use_Bean.getLat() %><br>
        8--Lon--<%=obj_Location_Use_Bean.getLon() %><br>
        9--Offset--<%=obj_Location_Use_Bean.getUtc_offset() %><br>


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
                        <li><a href="/about">About</a></li>
                        <li><a href="/contact">Contact</a></li>
                        <li><a href="/refund">Refund Policy</a></li>
                        <li><a href="/terms">Terms & Conditions</a></li>
                    </ul>
                </div>
            </div>
            <div class="widget">
                <div class="widget-heading">
                    <h3>Information</h3>
                </div>
                <div class="widget-content">
                    <ul>
                        <li><a href="/account">My Account</a></li>
                        <li><a href="/orders">My Orders</a></li>
                        <li><a href="/cart">Cart</a></li>
                        <li><a href="/checkout">Checkout</a></li>
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
                <p>Copyright 2023 - All Rights Reserved</p>
            </div>
            <div class="payment-mode">
                <img src="../views/img/icons/paper_money.png" alt="">
                <img src="../views/img/icons/visa.png" alt="">
                <img src="../views/img/icons/mastercard.png" alt="">
            </div>
        </div> <!-- Footer Bar -->
    </div>
</footer> <!-- Footer Area -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>