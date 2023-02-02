<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

<%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"--%>
<%--          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">--%>
<%--    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"--%>
<%--          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">--%>
<%--    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>--%>
<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>--%>
<%--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>--%>

    <title>GM - Register</title>

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

<%@include file="common/header2.jspf"%>

<div class="container" style="align-content: center;">
    <main style="width: 80%;">
        <div class="account-detail">
            <h2>Create New Account</h2>
            <div class="billing-detail">
                <form class="checkout-form" action="newuserregister" method="post">
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="username">User Name (Required)</label>
                            <input type="text" id="username" name="username" required>
                        </div>
                        <div class="form-group">
                            <label for="age">Age (Required)</label>
                            <input type="number" id="age" name="age" min="18" required>
                        </div>
                    </div>
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="fname">First Name</label>
                            <input type="text" id="fname" name="f_name" placeholder="E.g. Bisrat" required>
                        </div>
                        <div class="form-group">
                            <label for="lname">Last Name</label>
                            <input type="text" id="lname" name="l_name" placeholder="E.g. Kebere" required>
                        </div>
                    </div>
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" placeholder="E.g dev@bisrat.tech" required>
                        </div>
                    </div>

                    <div class="form-inline">
                        <div class="form-group">
                            <label>Password (Required)</label>
                            <input type="password" id="password" name="password" placeholder="+8 characters lower, UPPER, Speci@l and Number " required>
                        </div>
                        <div class="form-group">
                            <label for="confirm_password">Confirm Password (Required)</label>
                            <input type="password" id="confirm_password" name="confirm_password" placeholder="Repeat your Password" required>
                        </div>
                    </div>
                    <div class="form-group" >
                        <label for="register"></label>
                        <input type="submit" id="register" name="Register" value="REGISTER">
                    </div>
                </form>
                <div style="padding-top: 20px;">
                    Already Have an Account? <a href="login"> Login</a>
                </div>
            </div>
        </div>
    </main> <!-- Main Area -->
</div>

<%@include file="common/footer.jspf"%>

<script>
    function showPassword() {
        var x = document.getElementById("password");
        if (x.type === "password") {
            x.type = "text";
        } else {
            x.type = "password";
        }
    }
</script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>