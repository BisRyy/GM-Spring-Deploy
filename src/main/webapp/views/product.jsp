<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta Tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Title -->
    <title>${product.getName()} - GM</title>
    <!-- Style Sheet -->
    <link rel="stylesheet" type="text/css" href="../views/css/style.css" />
    <!-- Javascript -->
    <script type="text/javascript" src="../views/js/jquery.min.js"></script>
    <!-- FancyBox -->
    <link rel="stylesheet" href="../views/fancybox/source/jquery.fancybox.css" type="text/css" media="screen" />
    <script type="text/javascript" src="../views/fancybox/source/jquery.fancybox.pack.js"></script>

    <!-- Optionally add helpers - button, thumbnail and/or media -->
    <link rel="stylesheet" href="../views/fancybox/source/helpers/jquery.fancybox-buttons.css" type="text/css" media="screen" />
    <script type="text/javascript" src="../views/fancybox/source/helpers/jquery.fancybox-buttons.js"></script>
    <script type="text/javascript" src="../views/fancybox/source/helpers/jquery.fancybox-media.js"></script>

    <link rel="stylesheet" href="../views/fancybox/source/helpers/jquery.fancybox-thumbs.css" type="text/css" media="screen" />
    <script type="text/javascript" src="../views/fancybox/source/helpers/jquery.fancybox-thumbs.js"></script>
    <script>
        $(document).ready(function(){
            $('.fancybox').fancybox({
                openEffect  : 'none',
                closeEffect : 'none',

                prevEffect : 'none',
                nextEffect : 'none',

                closeBtn  : false,

                helpers : {
                    title : {
                        type : 'inside'
                    },
                    buttons	: {}
                },

                afterLoad : function() {
                    this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + (this.title ? ' - ' + this.title : '');
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
                <li><a href="">Shop</a></li>
                <li> / </li>
                <li><a href="">Product</a></li>
            </ul>
        </div> <!-- End of Breadcrumb-->
        <%
            try {
                String url = "jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, "root","LK0nTR9wwyRwBq6qflc0");
                Statement stmt = con.createStatement();
                Statement stmt2 = con.createStatement();
                ResultSet rs = stmt.executeQuery("select * from products as p join categories c on c.category_id = p.category_id");

        %>
        <div class="single-product">
            <div class="images-section">
                <div class="larg-img">
                    <img src="../views/img/product/img${product.getId()}.jpg">
                </div>
                <div class="small-img">
                    <a class="fancybox" rel="group" href="../views/img/product/img${product.getId()}.jpg">
                        <img src="../views/img/product/img${product.getId()}.jpg">
                    </a>
                    <a class="fancybox" rel="group" href="../views/img/product/${product.getId()}.jpg">
                        <img src="../views/img/product/img${product.getId()}.jpg">
                    </a>
                    <a class="fancybox" rel="group" href="../views/img/product/img${product.getId()}.jpg">
                        <img src="../views/img/product/img${product.getId()}.jpg">
                    </a>
                    <a class="fancybox" rel="group" href="../views/img/product/${product.getId()}.jpg">
                        <img src="../views/img/product/img${product.getId()}.jpg">
                    </a>
                </div>
            </div> <!-- End of Images Section-->

            <div class="product-detail">
                <h2>${product.getName()}</h2>
                <div class="product-name">
                </div>
                <div class="product-price">
                    <h3>${product.getPrice()}0 Birr.</h3>
                </div>
                <hr>
                <div class="product-description">
                    <p>${product.getInfo()}</p>
                </div>
                <hr>
                <div class="product-cart">
                    <form id="cart-form" action="cart/add" method="get">
                        <div class="form-group">
                            <input type="number" class="cart-number" name="qty" value="10" min="10" step="10">
                            <input hidden="" type="number" class="cart-number" name="pid" value="${product.getId()}" min="1" max="10">
                            <input type="submit" name="addToCart" value="Add To Cart">
                        </div>
                    </form>
                    <form id="wishlist-form">
                        <div class="form-group">
                            <input type="checkbox" class="wishlist" name="wishlist"> Add To Wishlist
                        </div>
                    </form>
                </div>
                <hr>
                <div class="product-meta">
                    <p><b>Category: </b> ${product.getCategory()}</p>
                    <p><b>Share This Product: </b> Facebook, Twitter</p>
                </div>
            </div> <!-- End of Product Detail-->
        </div>
        <%
            } catch (Exception ex) {
            out.println("Exception Occurred:: " + ex.getMessage());
            }
        %>

        <hr>
        <div class="product-long-description">
            <h3>Product Description</h3>
            <p>
                ${product.getDescription()}
            </p>
        </div>
        <hr>

        <%@include file="common/recommended.jspf"%>

    </main> <!-- Main Area -->
</div>

<%@include file="common/footer.jspf"%>

</body>

</html>