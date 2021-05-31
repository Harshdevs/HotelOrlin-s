<%@page import="model.rooms"%>
<%@page import="model.registration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" ></script>

        <link href="css/fancy.css" rel="stylesheet">

        <!-- Add jQuery library -->
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

        <!-- Add mousewheel plugin (this is optional) -->
        <script type="text/javascript" src="/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>

        <!-- Add fancyBox -->
        <link rel="stylesheet" href="/fancybox/source/jquery.fancybox.css?v=2.1.7" type="text/css" media="screen" />
        <script type="text/javascript" src="/fancybox/source/jquery.fancybox.pack.js?v=2.1.7"></script>

        <!-- Optionally add helpers - button, thumbnail and/or media -->
        <link rel="stylesheet" href="/fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" type="text/css" media="screen" />
        <script type="text/javascript" src="/fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
        <script type="text/javascript" src="/fancybox/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>

        <link rel="stylesheet" href="/fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" type="text/css" media="screen" />
        <script type="text/javascript" src="/fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>


        <title>Booking</title>
        <style>
            *{
                margin:0;
                padding:0;
                box-sizing: border-box;
            }
            body{
                font-family: 'Poppins', sans-serif;
                background: radial-gradient(white, lightpink, pink, lightskyblue);
            }
            h1{
                font-size: 48px; 
                justify-content: center; 
                font-style: oblique; 
                text-decoration: underline;
            }
            .img-head{
                color: black;
                font-size: 38px;
                font-style: oblique;
                text-decoration: underline;
                position: relative;
                left:45%;
            }
            .imgs{
                margin-left: 10%;
                margin-right: 10%;
                display: flex;
                flex-wrap: wrap;
                padding: 5px;
                justify-content: space-evenly;
            }
            .img{
                width: 25vw;
                height: 35vh;
                border: 5px solid #333;
                margin: 5px;
            }

            .imgs1{
                margin-left: 25%;
                margin-right: 10%;
                display: flex;
                flex-wrap: wrap;
                padding: 5px;
                justify-content: space-between;
            }
            .img1{
                width: 25vw;
                height: 35vh;
                border: 5px solid #333;
                margin: 5px;
            }
            
            .but{
                display: inline-block;
                background: #ff523b;
                color: #fff;
                padding: 8px 30px;
                /*margin: 30px 0;*/
                border-radius: 30px;
                text-decoration: none;
                margin-bottom: 2%;
            }
            #first-group{
                margin-left:10%;
            }
            #content{
                float: left;
                width: 400px;
                height: 115px;
                border: 3px solid #fff;
                margin: 15px;
                margin-left: 30px;
                padding: 12px;
                background-color: #555;
                margin-bottom: 10px;
            }
            #content #input-group{
                border:none;
                font-size: 30px;
                outline: none;
                background:transparent;
                margin-left: 24px;
                width: 280px;
                color: white;
            }
            .option1{
                font-weight: bolder;
                font-size: 20px;
                color: #222;
            }
            ::placeholder{
                color:#fff;
                font-size: 115%;
                text-align: center;
                text-transform: uppercase;
            }
            .fa{
                display: inline-block;
                color:white;
                font-size: 280%;
                border-right: 2px solid white;
                padding:8px;
            }

            label{
                color: white;
                font-size: 24px;
                font-weight: 900;
                font-style: oblique;
            }

            .form-control{
                width: 85%;
            }
        </style>
    </head>
    <body>
        <div class="header">

            <%@include file="header.jsp"%>
            <!--<div class="container">-->
            <%registration s1 = new registration(session);
                ArrayList<rooms> ar = s1.get_productinfo(request.getParameter("room"));
                Iterator<rooms> itr = ar.iterator();
                while (itr.hasNext()) {
                    rooms s = itr.next();%> 

            <form action="booknow" method="POST">
                <div class="container1">
                    <center>
                        <h1><b><%=s.getR_name()%></b></h1><br>

                        <div class="row">

                            <div class="col-md-12">
                                <div id="first-group">
                                    <div id="content">
                                        <label for="input-group"> ARRIVAL DAY : </label>
                                        <input type="text" onfocus= "(this.type = 'date')" placeholder="ARRIVAL DAY" id="arrivaldate" name="arrivaldate" class="form-control" style="text-transform: uppercase;" required>
                                    </div>

                                    <div id="content">
                                        <label> NO. OF GUESTS : </label>
                                        <input type="number" placeholder="NO. OF GUESTS" id="guests" name="guests" class="form-control" required>
                                    </div>

                                    <div id="content">
                                        <label> NO. OF STAY DAYS : </label>
                                        <input type="number" placeholder="NO. OF STAY DAYS" id="stay" name="stay" class="form-control" required>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <br>
                                <p class="price" style=" font-size: 32px;"><b><u>Price:</u><i style="font-size: 28px; color: #eb196e;">&nbsp; &#8377 <%=s.getR_cost()%>/-</i></b></p>
                            </div>
                        </div>
                        <input type="hidden" name="r_id" value="<%=s.getR_id()%>">
                        <% if (session.getAttribute("uname") != null) {%>
                        <button type="submit" name="booknow" class="but"> Book Now </button>
                        <%} else {%>
                        <a href="login.jsp" class="but">Book Now</a>
                        <%}%>

                        <br>
                        <div class="row">
                            <div class="img-head"><b>Images:</b></div>
                            <div class="imgs">
                                <a class="fancybox" rel="group" href="imgs/<%=s.getR_img1()%>" >
                                    <img src="imgs/<%=s.getR_img1()%>" class="img">
                                </a>

                                <br>
                                <a class="fancybox" rel="group" href="imgs/<%=s.getR_img2()%>" >
                                    <img src="imgs/<%=s.getR_img2()%>" class="img">
                                </a>
                                <br>

                                <a class="fancybox" rel="group" href="imgs/<%=s.getR_img3()%>" >
                                    <img src="imgs/<%=s.getR_img3()%>" class="img">
                                </a>
                                <a title="Close" class="fancybox-item fancybox-close" href="javascript:;"></a>
                            </div>

                            <div class="imgs1">
                                <a class="fancybox" rel="group" href="imgs/<%=s.getR_img4()%>" >
                                    <img src="imgs/<%=s.getR_img4()%>" class="img1">
                                </a>
                                <br>

                                <a class="fancybox" rel="group" href="imgs/<%=s.getR_img5()%>" >
                                    <img src="imgs/<%=s.getR_img5()%>" class="img1">
                                </a>
                            </div>

                            <div class="col-md-12">
                                <br>
                                <p style="position: relative; left: -33%; font-size: 36px; text-decoration: underline;"><b>Description:</b></p>
                                <br>
                                <p style="font-size: 28px; padding: 0 11%; text-align: justify; color: #333; font-style: oblique;"><%=s.getR_desc()%></p>
                                <br>
                                <p style="position: relative; left: -33%; font-size: 32px; text-decoration: underline;"><b>Services:</b></p>
                                <p style="font-size: 28px; text-align: justify; padding: 0 15%;"><%=s.getR_serv()%></p>
                                <br>
                                <p class="price" style=" font-size: 32px;"><b><u>Price:</u><i style="font-size: 28px; color: #eb196e;">&nbsp; &#8377 <%=s.getR_cost()%>/day</i></b></p>
                                <br>
                                <br>
                            </div>
                        </div>

                    </center>
                </div>
            </form>
            <%}%>
        </div>
        <script src="js/fancy.js"></script>
        <script type="text/javascript">
                                            $(document).ready(function () {
                                                $(".fancybox").fancybox();
                                            });
        </script>
        <%@include file="footer.jsp"%>
    </body>
</html>
