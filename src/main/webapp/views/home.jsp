<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>GM - Home</title>
    <link rel="stylesheet" type="text/css" href="../views/css/style.css" />
    <script type="text/javascript" src="../views/js/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<body>

<%@include file="common/header.jspf"%>

<div class="container">
    <main>
        <div class="slider">
            <div class="slide-1">
                <img src="../views/img/gallery/1.jpg">
                <div class="slider-text">
                    <h3>Sale 40% off</h3>
                    <h2>Fresh Grains</h2>
                    <a href="shop#grains">Shop Now</a>
                </div>
            </div>
            <div class="slide-2">
                <img src="../views/img/gallery/2.jpg">
                <div class="slider-text">
                    <h3>Sale 20% off</h3>
                    <h2>Organic Beans</h2>
                    <a href="shop">Shop Now</a>
                </div>
            </div>
            <div class="slide-3">
                <img src="../views/img/gallery/3.jpg">
                <div class="slider-text">
                    <h3>Sale 50% off</h3>
                    <h2>Variety Flour</h2>
                    <a href="shop">Shop Now</a>
                </div>
            </div>
        </div> <!-- slider -->

        <div class="new-product-section">
            <div class="product-section-heading">
                <h2>Tranding Products <img src="../views/img/icons/increase.png"></h2>
                <h3>Most selling product for the month</h3>
            </div>

            <div class="product-content">
            <%
                try {
                    String url = DBConnection;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(url, DBUser,DBPass);
                    Statement stmt = con.createStatement();
                    Statement stmt2 = con.createStatement();
                    ResultSet rs = stmt.executeQuery("select * from products join categories c on c.category_id = products.category_id");
            %>
            <%
                for (int i=0; i < 4; i++) {
                    rs.next();
            %>
                <div class="product">
                    <a href="product?pid=<%= rs.getString(1) %>">
                        <img src="../views/img/product/img<%= rs.getString(1)%>.jpg">
                    </a>
                    <div class="product-detail">
                        <h3>
                            <%= rs.getString(11) %>
                        </h3>
                        <h2>
                            <%= rs.getString(2) %>
                        </h2>
                        <a href="cart/add?pid=<%= rs.getString(1) %>&qty=10">Add to Cart</a>
                        <p>
                            <%= rs.getInt(3) %> Birr.
                        </p>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div> <!-- New Product Section -->
                <%
                } catch (Exception ex) {
                out.println("Exception Occurred:: " + ex.getMessage());
                }
                %>

        <div class="collection">
            <div class="grain-collection">
                <h2>Grain Collection</h2>
            </div>
            <div class="rice-collection">
                <h2>Rice Collection</h2>
            </div>
        </div> <!-- Collection Section -->

        <%@include file="common/recommended.jspf"%>

    </main> <!-- Main Area -->
</div>

<%@include file="common/footer.jspf"%>

<script>
    $(document).ready(function(){
        $('.slider').bxSlider({
            auto: true,
            autoControls: true,
            stopAutoOnClick: true,
            pager: true
        });
    });
</script>
</body>
</html>