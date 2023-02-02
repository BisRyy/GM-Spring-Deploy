<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org"
      xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
      xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<%--    --%>
<%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"--%>
<%--          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">--%>
<%--    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"--%>
<%--          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">--%>
<%--    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>--%>
<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>--%>
<%--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>--%>
<%--    --%>
    <title>GM - Home</title>

    <link rel="stylesheet" type="text/css" href="../views/css/style.css" />

    <script type="text/javascript" src="../views/js/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
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
                    String url = "jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway";
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(url, "root","LK0nTR9wwyRwBq6qflc0");
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
            <div class="men-collection">
                <h2>Grain Collection</h2>
            </div>
            <div class="women-collection">
                <h2>Rice Collection</h2>
            </div>
        </div> <!-- Collection Section -->

        <%@include file="common/recommended.jspf"%>

    </main> <!-- Main Area -->
</div>

<%@include file="common/footer.jspf"%>

</body>
</html>