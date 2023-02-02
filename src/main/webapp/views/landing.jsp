<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
</head>
<body background="../images/banner.jpeg" link="#000" alink="#017bf5" vlink="#000" style="margin: 0; padding:0;">
    <nav >
        <table align="center" cellspacing="0" cellpadding="0" width="100%" border="0" height="40">
            <thead>
                <tr>
                  <td width="50"></td>
                    <td align="right">
                        <h3 align="center">
                            <font face="sans-serif" size="6" color="#2c3e50">LOGO</font>
                        </h3>
                    </td>
                    <td width="20%">
                    </td>
                    <td align="right">
                        <h3 align="center">
                            <font face="sans-serif" size="4.5">
                                <a href="# ">HOME</a>&nbsp; |
                                <a href="#about ">ABOUT US</a>&nbsp; |
                                <a href="#products ">PRODUCTS</a>&nbsp; |
                                <a href="#features ">SERVICES</a>&nbsp; |
                                <a href="#gallery ">TESTIMONIALS</a>&nbsp; |
                                <a href="#team ">TEAM</a>&nbsp; |
                                <a href="login.html">SIGN IN</a>&nbsp; |
                                <a href="#contact ">CONTACT US</a>&nbsp;&nbsp;
                              </font>
                        </h3>
                    </td>
                </tr>
            </thead>
        </table>
    </nav>
    <header>
        <div align="center">
          <!-- <video width="400" controls align="left" autoplay muted>
            <source src="./images/video.mp4" type="video/mp4">
            <source src="movie.ogg" type="video/ogg">
             Your browser does not support the video tag.
          </video> -->
          <!-- <img src="./images/unnamed.jpg " height="300" alt=""> -->

          <video width="400" height="300" controls align="left" autoplay muted>
            <source src="../images/video.mp4" type="video/mp4">
            <source src="movie.ogg" type="video/ogg">
             Your browser does not support the video tag.
          </video>

      </div>
      <h1 align="center">
          <font face="verdana" color="#2980b9" size="7">
            <em>Grain-Mill Market and Delivery</em>
          </font>
      </h1>
      <h3 align="center">
          <font face="Lato" color="#000" size="5">
             <i> Get it Milled.</i>
          </font>
      </h3>
      <br />
      <h3 align="center">
          <a href="market.html">
              <font face="Lato" color="#000" size="4">
              GO TO MARKET
              </font>
          </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="register.html">
              <font face="Lato" color="#f00" size="4">JOIN US</font>
          </a>
      </h3>
    </header>
    <br><br><br><br><br>

    <!-- About -->
    <h3 id="about" align="center">
        <table align="center"border="0">
          <tr>
            <td> <img src="../images/about.png" width="600" align="center" alt="about" draggable="false" usemap="#image-map">
            <!-- Image Map Generated by http://www.image-map.net/ -->
              <map name="image-map">
                  <area target="" alt="ater" title="ater" href="products.html" coords="293,452,91" shape="circle">
                  <area target="" alt="misr" title="misr" href="products2.html" coords="476,378,81" shape="circle">
                  <area target="" alt="bakela" title="bakela" href="market.html" coords="114,341,91" shape="circle">
                  <area target="" alt="boleke" title="boleke" href="products.html" coords="225,136,113" shape="circle">
                  <area target="" alt="shimbra" title="shimbra" href="products2.html" coords="409,207,82" shape="circle">
                  <area target="_blank" alt="kitel" title="kitel" href="login.html" coords="236,325,279,340,318,344,364,344,380,313,348,278,314,256,263,252,212,265" shape="poly">
              </map>
            </td>
            <td>
            <hr color="#fff" width="20%">
            <p align="center">
              <font face="sans-serif" color="#2ecc17" size="6">
                ABOUT US
              </font>
            </p>
            <hr color="#fff" width="20%">
              <p>
                <font color="#267494" size="5"> We strive to offer excellent services to our prestigious customers & are known for trusted & superior quality of products. All the products are stored safely in our clean & updated store. Understanding our customer’s need & demand, we provide a wide variety of pulses & cereals of high nutritional value. With the professional approach to a traditional niche, we offer prompt & on-time services.</font>
              </p>
            </td>
            <td width="100px"></td>
          </tr>
        </table>
    </h3>
    <br><br><br>

  <!-- Products -->
  <div id="products">
    <table align="center" width="100%" border="0"  bgcolor="white">
      <tr>
        <td colspan="12">
          <br>
          <hr color="#0ff" width="20%" >
          <p align="center"><font face="sans-serif" color="#2ecc17" size="6">PRODUCTS</font></p>
          <hr color="#0ff" width="20%">
        </td>
      </tr>
      <tr>
        <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
      </tr>
      <tr>
        <td colspan="12"  align="center">
          <font size="5">
            Cereals and Pulses
          </font>
        </td>
      </tr>
      <tr align="center">
        <td colspan="3">
          <a href="products2.html"><img src="../images/beans.png" alt="" height="200px"></a>
        </td>
        <td colspan="3">
          <a href="products2.html"><img src="../images/lentils.png" alt="" height="200px"></a>
        </td>
        <td colspan="3">
          <a href="products2.html"><img src="../images/wheat.png" alt="" height="200px"></a>
        </td>
        <td colspan="3">
          <a href="products2.html"><img src="../images/rice.png" alt="" height="200px"></a>
        </td>
      </tr>
      <tr align="center">
          <td colspan="3"><a href="products2.html"><font face="sans-serif" size="5">Beans</font></a></td>
          <td colspan="3"><a href="products2.html"><font face="sans-serif" size="5">Lentils</font></a></td>
          <td colspan="3"><a href="products2.html"><font face="sans-serif" size="5">Wheat</font></a></td>
          <td colspan="3"><a href="products2.html"><font face="sans-serif" size="5">Rice</font></a></td>
      </tr>
      <tr>
        <td colspan="12"  align="center">
          <font size="5">
            Other Grains
          </font>
        </td>
      </tr>
      <tr>
        <td colspan="2"><a href="products2.html"><img width="100%" src="../images/Grains/Popcorn__62655.png" alt=""></a></td>
        <td colspan="2"><a href="products2.html"><img width="100%" src="../images/Grains/Hulled-Sunflower-Seeds__93071.png" alt=""></a></td>
        <td colspan="2"><a href="products2.html"><img width="100%" src="../images/Grains/Quinoa__99452.png" alt=""></a></td>
        <td colspan="2"><a href="products2.html"><img width="100%" src="../images/Grains/Green-Lentils__66814.png" alt=""></a></td>
        <td colspan="2"><a href="products2.html"><img width="100%" src="../images/Grains/Wild-Rice__04031.png" alt=""></a></td>
        <td colspan="2"><a href="products2.html"><img width="100%" src="../images/Grains/Red-Quinoa__21736.png" alt=""></a></td>
      </tr>
      <tr>
        <td colspan="12" align="center">
          <a href="products.html">AND MORE...</a>
          <br><br><hr color="white"><hr color="white"><hr color="white">
        </td>
      </tr>
    </table>
  </div>

  <!-- features -->
  <div id="features" ><br>
    <hr color="#fff" width="20%" >
    <p align="center"><font face="sans-serif" color="#2ecc17" size="6">FEATURES</font></p>
    <hr color="#fff" width="20%">
    <table align="center" cellspacing="10" cellpadding="15" border="0">
      <tr>
        <td valign="top">
            <h3> Automated Delivery System</h3>
            <p>
                Our automated delivery system allows customers to order their grains and mill products with ease and convenience. We offer fast and reliable delivery services to ensure that your orders arrive on time.
            </p>
        </td>
          <td>
              <img src="https://w1.pngwing.com/pngs/546/859/png-transparent-food-icon-delivery-icon-sushi-pizza-delivery-scooter-courier-food-delivery-text.png" height="220">
          </td>
          <td>
              <img src="../images/beans.jpg" height="220">
          </td>
          <td valign="top">
              <h3> Variety of Grains and Mill Products </h3>
              <p>
                  We offer a wide selection of grains and mill products, from wheat to barley, oats to rye, and more. Our selection is sure to meet all your needs for baking, cooking, or brewing.
              </p>
          </td>
      </tr>
        <tr>
            <td valign="top">
                <h3>  Quality Assurance </h3>
                <p>
                    All of our grains and mill products are sourced from trusted suppliers who guarantee the highest quality standards in the industry. We take pride in providing our customers with the best products available.
                </p>
            </td>
            <td>
                <img src="https://png.pngtree.com/png-clipart/20210312/original/pngtree-quality-icon-certified-check-mark-vector-sign-award-and-warranty-png-image_6076769.jpg"  height="220">
            </td>
            <td>
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBKYTTk3k7RepxfYNgRGdzgBeuc0ohmYWl9tpnsSEEtQ&s"   height="220">
            </td>
            <td valign="top">
                <h3> Secure Payment System</h3>
                <p>
                    We use a secure payment system that ensures your information is kept safe and secure at all times. You can rest assured that your transactions are safe with us.
                </p>
            </td>
        </tr>
      <tr>
        <th colspan="4" rowspan="2"><a href="#">AND MORE...</a></th>
      </tr>
    </table>
  </div>

<!-- gallery -->
  <div id="gallery">
  <br>

    <hr color="#fff" width="20%">
    <p align="center"><font face="sans-serif" color="#2ecc17" size="6">GALLERY</font></p>
    <hr color="#fff" width="20%">
    <div class=" imgRow " align="center">
      <img src="img/gallery/1.jpg" alt="" width="30%">&nbsp;&nbsp;&nbsp;
      <img src="img/gallery/2.jpg" alt="" width="30%">&nbsp;&nbsp;&nbsp;
      <img src="img/gallery/3.jpg" alt="" width="30%">&nbsp;&nbsp;&nbsp;
    </div>
  </div>

  <!-- Testimonials -->
  <div align="center" id="testimonials">
    <br>
    <hr color="#fff" width="20%">
    <p align="center"><font face="sans-serif" color="#2ecc17" size="6">TESTIMONIALS</font></p>
    <hr color="#fff" width="20%">
    <table>
      <tr>
        <td>
          <p><img src="../images/symbols/quotation.png" alt="" width="40"></p>
          <font face="sans-serif" color="#017bf5" size="6">
            <q >
              Delivered my order on time. <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Appreciate their service!
            </q>
          </font>
          <hr width="20%">
          <h3 align="center"><font color="" size="5"><em>Abera Dibaba</em></font></h3>
        </td>
        <td width="20%"></td>
        <td>
          <p><img src="../images/symbols/quotation.png" alt="" width="40"></p>
          <audio controls>
            <source src="../images/audio.mp3" type="audio/mp3">
            <source src="horse.mp3" type="audio/mpeg">
            Your browser does not support the audio element.
          </audio><br>
          <hr width="20%">
          <h3 align="center"><font color="" size="5"><em>Zenebech Gelalcha</em></font></h3>
        </td>
      </tr>
    </table>

  </div>
  <br>
  <!-- <br><br><br><br> -->

  <!-- Team -->
  <div id="team">
    <table align="center" cellspacing="0" cellpadding="10" border="0" width="100%" bgcolor="#24a39b">
      <tr >
        <td colspan="6">
          <hr color="#fff" width="20%">
          <p align="center"><font face="sans-serif" color="#2ecc17" size="6">OUR TEAM</font></p>
          <hr color="#fff" width="20%">
        </td>
      </tr>
      <tr>
        <td align="center">
          <img src="../images/unnamed.jpg" width="200">
          <p>Ararsa Derese</p>
            <p>
              Back End Developer
            </p>
        </td>

        <td align="center">
          <img src="../images/unnamed.jpg" width="200">
          <p>Birhanu Worku</p>
            <p>
              Front End Engineer
            </p>
        </td>


        <td align="center">
          <img src="../images/unnamed.jpg" width="200">
          <p>Biruk Mesfin</p>
            <p>
              System Designer
            </p>
        </td>

      </tr>
      <tr>
        <td align="center">
          <img src="../images/unnamed.jpg" width="200">
          <p>Bisrat Kebere</p>
            <p>
              Product Manager
            </p>
        </td>

        <td  align="center">
          <img src="../images/unnamed.jpg" width="200">
          <p>Biyaol Mesay</p>
            <p>
              Graphics Designer
            </p>
        </td>


        <td align="center" height="300px">
          <img src="../images/unnamed.jpg" width="200">
          <p>Dagim Tezerawork</p>

            <p>
              Pentester
            </p>
        </td>
      </tr>
    </table>
  </div>

  <!-- contact us -->
  <div id="contact"width="1350">
    <br>
    <hr color="#000" width="20%">
    <p align="center">
      <font face="sans-serif" color="#017bf5" size="6">CONTACT US</font>
    </p>
    <hr color="#000" width="20%">

    <form name="f1" id="contact-form">
      <table align="center" cellpadding="5" cellspacing="10" border="0" bgcolor="white">
        <tr>
          <td rowspan="5" align="center">
            <img src="../images/symbols/location.png" alt="" height="40px">
            <pre>
    Our Office Address
    Ethiopia, Addis Ababa, Kality, AASTU road
            </pre>
            <img src="../images/symbols/mail.png" alt="" height="40px">
            <pre>
    General Enquiries
    contact@millers.com
            </pre>
            <img src="../images/symbols/phone.png" alt="" height="40px">
            <pre>
    Call Us
    +251(9)25698349
    +251(7)25698349
            </pre>
            <img src="../images/symbols/time.png" alt="" height="40px">
            <pre>
    Office Hours
    Mon - Sun : 07:00 AM - 09:00 PM
            </pre>
          </td>
          <td rowspan="5">
            <h2>
              <!-- Or -->
            </h2>
          </td>
          <td>
            <label for="first_name">First Name </label><br>
            <input type="text" name="first_name" placeholder="e.g: Abebe" required  />
          </td>
          <td>
            <label for="last_name">Last Name </label><br>
            <input type="text" name="Last_name" placeholder="e.g: Debebe" required  />
          </td>
        </tr>
        <tr>
            <td colspan="2">
            <label for="email">Email</label><br>
            <input type="email" name="email" placeholder="Your Email Address" required />
          </td>
        </tr>
        <tr>
          <td colspan="2"><input type="text" name="subject" placeholder="Subject" value="" required /></td>
        </tr>
        <tr>
          <th colspan="2">
            <textarea placeholder="Enter Message" required="" rows="18" cols="50" ></textarea>
          </th>
        </tr>
        <tr>
          <th colspan="2">
            <input type="submit" name="contact-submit" value="SEND">
          </th>
        </tr>
      </table>
    </form>
  </div>
  <br><br><br><br><br>

  <footer>
    <table align="center" cellspacing="10" cellpadding="0" width="100%" border="0" bgcolor="lightblue">
      <tr align="right">
        <td colspan="4"><h3><a href="#">GO TO TOP</a></h3></td>
      </tr>
      <tr>
        <td>
          <p align="center">
            <a href="landing.html"><font face="sans-serif" size="7" color="#f00">LOGO</font></a>
          </p>
        </td>
        <td >
          <h3 >Important Links</h3>
          <ul class="layout">
              <li><a href="landing.html">HOME</a></li>
              <li><a href="market.html">MARKET</a></li>
              <li><a href="products.html">PRODUCTS</a></li>
              <li><a href="#about">ABOUT US</a></li>
              <li><a href="#team">TEAM</a></li>
              <li><a href="#contact">CONTACT US</a></li>
          </ul>
        </td>
        <td>
          <h3>Follow Us</h3>
          <ul class="layout">
              <li><a href="https://www.facebook.com" target="_blank">Facebook</a></li>
              <li><a href="https://www.twitter.com" target="_blank">Twitter</a></li>
              <li><a href="https://www.instagram.com" target="_blank">Instagram</a></li>
              <li><a href="https://www.linkedin.com" target="_blank">Linked In</a></li>
          </ul>
        </td>
        <td>
          <h3>Legal</h3>
          <ul class="layout">
            <li><a href="" target="_blank">Privacy Policy</a></li>
            <li><a href="" target="_blank">Terms and Conditions</a></li>
            <li><a href="" target="_blank">Refund rules</a></li>
            <li><a href="" target="_blank">Regulations</a></li>
          </ul>
        </td>

      </tr>
      <tr>
        <td colspan="4">
          <p align="center">
            <font face="sans-serif" size="4" color="#000">
              Proudly made by Section A Software Engineering Students.<br>
              Copyright &copy; AASTU 2022 All Rights Reserved.
            </font>
          </p>
        </td>
      </tr>
    </table>

  </footer>

</body>
</html>