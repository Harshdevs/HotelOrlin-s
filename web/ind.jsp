<%-- 
    Document   : ind
    Created on : 9 Oct, 2020, 8:21:32 PM
    Author     : Harsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Hotel Orlin's</title>
        <!--Font awesome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
        <!--Scroll reveal CDN-->
        <!-- <script src="https://unpkg.com/scrollreveal"></script> -->
        <link rel="stylesheet" href="css/style.css">
        <!-- <link rel="prerender" href="./photogallery/dist/index.html"> -->
        <!-- Bootstrap -->
        <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    </head>

    <body>
        <%@include file="header.jsp"%>
        <header>
            <section class="sect">

                <div class="cont">
                    <!--<div class="logo">-->

                    <!--<a href="#" class="name"><strong>&nbsp;Hotel Orlin's&nbsp;</strong></a>-->

                    <!-- <img src="./images/logo-rosa.png"> -->
                    <!-- <a href="">
                        <img src="./logo/log1.png">
                    </a> -->
                    <!--<div class="sym">-->
                    <!--<a href="log/login.jsp" target="_blank" id="login" >Login</a>-->
                    <!--</div>-->
                    <!--</div>-->
                    <div class="navigation">
                        <div class="ham-btn" onclick="showNav()">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>

                        <div class="links">
                            <!-- <div class="link">
                                <p href="#"><img src="./images/text_shadow - Copy.png" style="transform: rotate(180deg);">
                                </p>
                            </div> -->
                            <div class="link">
                                <a href="#" onclick="a()">Home</a>
                            </div>
                            <div class="link">
                                <a href="#orlin-booking" onclick="a()">Rooms & Suites</a>
                            </div>
                            <div class="link">
                                <a href="#orlin-gallery" onclick="a()">Gallery</a>
                            </div>
                            <div class="link">
                                <a href="#orlin-rest" onclick="a()">Dinning</a>
                            </div>
                            <div class="link">
                                <a href="#abtus" onclick="a()">About Us</a>
                            </div>
                            <div class="link">
                                <a href="#cntus" onclick="a()">Contact Us</a>
                            </div>
                            <br>
                            <!-- <div class="link">
                                <p href="#"><img src="./images/text_shadow.png"></p>
                            </div> -->
                        </div>
                    </div>
                    <!-- </div> -->

                    <div class="itms">

                        <div id="video">
                            <video id="myvid" poster="img/h0.jpg">
                                <source src="img/video/vid.mp4">
                                Video can't be played
                            </video>
                            <button id="v-btn">
                                Play</button>
                        </div>

                        <div class="sidebox">
                            <p><strong><u class="wlc">Welcome to Orlin's</u><br><br>Lorem ipsum dolor sit amet consectetur
                                    adipisicing elit. Hic quos autem, dolore
                                    repudiandae nisi nobis architecto id officia sint debitis consectetur minus iusto
                                    aliquam natus laborum doloribus minima amet! Velit?</strong></p>

                        </div>
                    </div>
                </div>
            </section>

            <br>
            <hr>

            <!-- book now starts -->
            <section id="orlin-booking" class="bknw">
                <div class="bnct">
                    <i class='fas fa-bed' style='font-size:36px; position: relative; right: 32%; top: 35%;'></i>
                    <i class='fas fa-umbrella-beach' style='font-size:36px; position: relative; right: 24%; top: 35%;'></i>
                    <i class='fas fa-suitcase-rolling'
                       style='font-size:36px; position: relative; right: 16%; top: 35%;'></i>
                    <i class='fas fa-hotel' style='font-size:36px; position: relative; right: 8%; top: 35%;'></i>
                    <a href="booknow.jsp">
                        <h1>Book Now</h1>
                    </a>
                    <i class='fas fa-glass-martini-alt' style='font-size:36px; position: relative; left: 8%; top: 35%;'></i>
                    <i class='fas fa-utensils' style='font-size:36px; position: relative; left: 16%; top: 35%;'></i>
                    <i class='fas fa-coffee' style='font-size:36px; position: relative; left: 24%; top: 35%;'></i>
                    <i class='fas fa-wifi' style='font-size:36px; position: relative; left: 32%; top: 35%;'></i>
                </div>
            </section>
            <!-- book now ends -->

            <hr>
            <br>

            <section id="orlin-gallery" class="sect ,pgrid">

                <a href="photogallery/index.html" target="_blank">
                    <h1 class="ph1">Photo Gallery</h1>
                </a>
                <br>

                <div id="slider">
                    <div class="slides">
                        <div class="slider">
                            <div class="legend"></div>
                            <div class="content">
                                <div class="content-txt">
                                    <h2>Lorem ipsum dolor</h2>
                                    <h3>Nam ultrices pellentesque facilisis. In semper tellus mollis nisl pulvinar vitae
                                        vulputate lorem consequat. Fusce odio tortor, pretium sit amet auctor ut, ultrices
                                        vel nibh.</h3>
                                </div>
                            </div>
                            <div class="image">
                                <img src="img/i1.jpg" alt="">
                            </div>
                        </div>

                        <div class="slider">
                            <div class="legend"></div>
                            <div class="content">
                                <div class="content-txt">
                                    <h2>Lorem ipsum dolor</h2>
                                    <h3>Nam ultrices pellentesque facilisis. In semper tellus mollis nisl pulvinar vitae
                                        vulputate lorem consequat. Fusce odio tortor, pretium sit amet auctor ut, ultrices
                                        vel nibh.</h3>
                                </div>
                            </div>
                            <div class="image">
                                <img src="img/hotel4.png" alt="">

                            </div>
                        </div>

                        <div class="slider">
                            <div class="legend"></div>
                            <div class="content">
                                <div class="content-txt">
                                    <h2>Lorem ipsum dolor</h2>
                                    <h3>Nam ultrices pellentesque facilisis. In semper tellus mollis nisl pulvinar vitae
                                        vulputate lorem consequat. Fusce odio tortor, pretium sit amet auctor ut, ultrices
                                        vel nibh.</h3>
                                </div>
                            </div>
                            <div class="image">
                                <img src="img/i2.jpg" alt="">
                            </div>
                        </div>

                        <div class="slider">
                            <div class="legend"></div>
                            <div class="content">
                                <div class="content-txt">
                                    <h2>Lorem ipsum dolor</h2>
                                    <h3>Nam ultrices pellentesque facilisis. In semper tellus mollis nisl pulvinar vitae
                                        vulputate lorem consequat. Fusce odio tortor, pretium sit amet auctor ut, ultrices
                                        vel nibh.</h3>
                                </div>
                            </div>
                            <div class="image">
                                <img src="img/p1.png" alt="">
                            </div>
                        </div>

                    </div>
                    <div class="switch">
                        <ul>
                            <li>
                                <div class="on"></div>
                            </li>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>
                </div>
                <br>
                <br>
            </section>

            <br>
            <hr>

            <section id="orlin-rest" class="sect ,rest">
                <a href="./restaurant/demo.html" target="_blank">
                    <h1>Restaurant</h1>
                </a>
                <div class="r-container">
                    <div class="r r-cnt">
                        <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. A magni ut suscipit doloremque dolor
                            laboriosam itaque reiciendis fuga culpa cupiditate facilis, distinctio at. Sit nisi quae modi
                            porro nostrum nulla
                        </p>
                    </div>
                    <div class="r r-img"></div>
                </div>
                <br>
            </section>

            <br>
            <hr>
            <br>

            <section class="sect ,about" id="abtus">
                <br>
                <h1>About Us</h1>
                <br>
                <div class="abt-us">
                    <div class="abt a-img">

                    </div>
                    <div class="abt a-cnt">
                        <h2>Hotel Orlin's</h2>
                        <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore repellendus consequatur odit
                            sint possimus temporibus voluptatibus nostrum, magnam ea repudiandae libero deleniti praesentium
                            quae doloremque quasi eos ducimus, fugiat aperiam, blanditiis suscipit numquam in rerum. Eos
                            voluptate dicta aut non.
                        </p>
                    </div>
                    <!-- <div class="abt user-ratings">
                        ratings
                    </div> -->
                </div>

                <br>
                <br>

                <div class="container">
                    <div class="card">
                        <img src="img/avatar_boy.jpg"
                             alt="Person" class="card__image">
                        <p class="card__name">Natesh S</p>
                        <div class="grid-container">

                            <div class="grid-child-posts">
                                Full Stack Web Developer
                            </div>

                            <div class="grid-child-followers">
                                @RRCE
                            </div>

                        </div>
                        <br>
                        <a>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consectetur, quisquam?</a>
                        <ul class="social-icons">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        </ul>
                        <button class="btn draw-border">Follow</button>
                    </div>

                    <div class="card">
                        <img src="img/avatar_girl1.jpg"
                             alt="Person" class="card__image">
                        <p class="card__name">Chandana S</p>
                        <div class="grid-container">

                            <div class="grid-child-posts">
                                Full Stack Web Developer
                            </div>

                            <div class="grid-child-followers">
                                @RRCE
                            </div>

                        </div>
                        <br>
                        <a>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consectetur, quisquam?</a>
                        <ul class="social-icons">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        </ul>
                        <button class="btn draw-border">Follow</button>
                    </div>

                    <div class="card">
                        <img src="img/avatar_boy.jpg"
                             alt="Person" class="card__image">
                        <p class="card__name">Harsh K Jain</p>
                        <div class="grid-container">

                            <div class="grid-child-posts">
                                Full Stack Web Developer
                            </div>

                            <div class="grid-child-followers">
                                @RRCE
                            </div>

                        </div>
                        <br>
                        <a>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consectetur, quisquam?</a>
                        <ul class="social-icons">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        </ul>
                        <button class="btn draw-border">Follow</button>
                    </div>

                    <div class="card">
                        <img src="img/avatar_girl2.jpg"
                             alt="Person" class="card__image">
                        <p class="card__name">Kavya G S</p>
                        <div class="grid-container">

                            <div class="grid-child-posts">
                                Full Stack Web Developer
                            </div>

                            <div class="grid-child-followers">
                                @RRCE
                            </div>

                        </div>
                        <br>
                        <a>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consectetur, quisquam?</a>
                        <ul class="social-icons">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        </ul>
                        <button class="btn draw-border">Follow</button>
                    </div>

                    <div class="card">
                        <img src="img/avatar_boy.jpg"
                             alt="Person" class="card__image">
                        <p class="card__name">Ganesh D Bhagwat</p>
                        <div class="grid-container">

                            <div class="grid-child-posts">
                                Full Stack Web Developer
                            </div>

                            <div class="grid-child-followers">
                                @RRCE
                            </div>

                        </div>
                        <br>
                        <a>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consectetur, quisquam?</a>
                        <ul class="social-icons">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        </ul>
                        <button class="btn draw-border">Follow</button>
                    </div>

                </div>

                <br>
                <hr>
            </section>

            <section class="contact" id="cntus">
                <h1>Contact Us</h1>
                <h3>&DoubleLeftArrow;&nbsp;Hover on me</h3>
                <div class="container_">
                    <div class="container__image">
                        <div class="container__info container__author">
                            <i class="fa fa-phone-square fa-2x icons"></i>&nbsp;&nbsp;
                            <a class="c-link"><strong>:- +00 1234567891</strong>
                            </a>
                            <br>
                            <br>
                            <i class="fa fa-envelope-square fa-2x icons"></i>&nbsp;&nbsp;
                            <a class="c-link"><strong>:- luxuryhotel @ orlins.com</strong>
                            </a>
                            <br>
                            <br>
                            <i class="fa fa-address-book fa-2x icons"></i>&nbsp;&nbsp;
                            <a class="c-link"><strong>:- #1 ,East Avenue ,Hotel Orlin's ,ABC-000123</strong>
                            </a>
                        </div>
                    </div>
                </div>
                <br>
                <br>
            </section>

        </header>

        <footer>
            <a href="https://www.sookshmas.com/" target="_blank" class="copyright">&copy; 2020 Sookshmas | A project by
                Sookshmas E-Learning Pvt. Ltd.</a>
            <div class="soc">
                <ul>
                    <li>
                        <a href="#" class="fb">
                            <i class="fab fa-facebook"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="insta">
                            <i class="fab fa-instagram"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="twi">
                            <i class="fab fa-twitter"></i>
                        </a>
                    </li>
                    <!-- <li>
                        <a href="#" class="what">
                            <i class="fab fa-whatsapp"></i>
                        </a>
                    </li> -->
                    <li>
                        <a href="#" class="tripad">
                            <i class="fab fa-tripadvisor"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </footer>

        <!-- script part -->
        <script src="js/main.js"></script>

    </body>

</html>