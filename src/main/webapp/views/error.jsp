<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="UTF-8">
    <title>GM - 404 Error </title>
    <link rel="stylesheet" type="text/css" href="../views/css/style.css" />
</head>
<body>

<%@include file="common/header3.jspf"%>

<div class="container1">
    <h1 class="first-four">4</h1>
    <div class="cog-wheel1">
        <div class="cog1">
            <div class="top"></div>
            <div class="down"></div>
            <div class="left-top"></div>
            <div class="left-down"></div>
            <div class="right-top"></div>
            <div class="right-down"></div>
            <div class="left"></div>
            <div class="right"></div>
        </div>
    </div>

    <div class="cog-wheel2">
        <div class="cog2">
            <div class="top"></div>
            <div class="down"></div>
            <div class="left-top"></div>
            <div class="left-down"></div>
            <div class="right-top"></div>
            <div class="right-down"></div>
            <div class="left"></div>
            <div class="right"></div>
        </div>
    </div>
    <h1 class="second-four">4</h1>
    <h3 class="wrong-para">Uh Oh! Page not found! Lost your way?</h3>
</div>
<div class="container" style="align-items: center; justify-content: center; ">
    <a href="home" class="back_home" style="position: relative; left: 37%; top: 50px; font-size: 2em; padding: 10px; border-radius: 20px;">Back to Home</a>
</div>

<!-- partial -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/3.3.1/gsap.min.js'></script>
<script >
    let t1 = gsap.timeline();
    let t2 = gsap.timeline();
    let t3 = gsap.timeline();

    t1.to(".cog1",
        {
            transformOrigin:"50% 50%",
            rotation:"+=360",
            repeat:-1,
            ease:Linear.easeNone,
            duration:8
        });

    t2.to(".cog2",
        {
            transformOrigin:"50% 50%",
            rotation:"-=360",
            repeat:-1,
            ease:Linear.easeNone,
            duration:8
        });

    t3.fromTo(".wrong-para",
        {
            opacity:0
        },
        {
            opacity:1,
            duration:1,
            stagger:{
                repeat:-1,
                yoyo:true
            }
        });
</script>

</body>
</html>
