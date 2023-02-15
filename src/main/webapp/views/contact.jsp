<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact - GM</title>
    <link rel="stylesheet" type="text/css" href="../views/css/style.css" />
</head>
<body>

<%@include file="common/header2.jspf"%>

<div class="container">
    <main>
        <div class="contact">
            <h2 class="heading">Contact Form</h2>
            <p class="text" align="center">Please fill out the form below to contact us. We will get back to you as soon as possible.</p>
            <form class="checkout-form" action="https://formcarry.com/s/JPjySD07Nl" method="POST">

                <div class="form-inline">
                    <div class="form-group">
                        <label for="fname">First Name</label>
                        <input type="text" id="fname" name="fname" required>
                    </div>
                    <div class="form-group">
                        <label for="lname">Last Name</label>
                        <input type="text" id="lname" name="lname">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="message">Your Message</label>
                    <textarea name="message" id="message" rows="10" required></textarea>
                </div>
                <div class="form-group">
                    <label for="contact"></label>
                    <input type="submit" id="contact" name="contact" value="Send">
                </div>
            </form>
        </div>
    </main> <!-- Main Area -->
</div>

<%@include file="common/footer.jspf"%>

</body>

</html>