<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Now</title>
        <!--<link rel="stylesheet" href="css/style.css">-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

        <style>
            *{
                margin:0;
                padding:0;
                box-sizing: border-box;
            }
            body{
                font-family: 'Poppins', sans-serif;
                /*background-color: black;*/
                background: linear-gradient(to right, #fa575d, #ffcb53, #8cffba);
            }
            /*            .header{
                            background: radial-gradient(#fff,#ffd2d2);
                        }
                        .header .row{
                            margin-top: 60px;
                        }*/

            .container{
                max-width: 1300px;
                margin:auto;
                padding-left: 25px;
                padding-right: 25px;
            }
            .row{
                display: flex;
                align-items:center;
                flex-wrap: wrap;
                justify-content:space-around;
            }

            .categories{
                margin: 40px 0;
            }
            .categories .col-3{
                flex-basis: 30%;
                min-width: 250px;
                margin-bottom: 50px;
                text-align: center;
                padding: 30px 10px;
                box-shadow: 0px 0px 10px 5px black;
                cursor: pointer;
                transition: transform 0.5s;

            }
            .categories .col-3 img{
                width: 350px;
                height: 400px;
                margin-top: 20px;
                border-radius: 15%;
            }
            .categories .col-3:hover{
                transform: translateY(-10px);
            }
            .small-container{
                max-width: 1600px;
                margin: auto;
                padding-left: 25px;
                padding-right: 25px;
            }
            .title{
                text-align: center;
                margin: 0 auto 10px;
                position: relative;
                line-height: 60px;
                color: #fff;
                font-size: 40px;
                color: black;
            }
            .title::after{
                content: '';
                background: orangered;
                width: 180px;
                height: 3px;
                border-radius: 5px;
                position: absolute;
                bottom: 0;
                left: 50%;
                transform: translateX(-50%);
            }
            s3{
                color: #111;
                font-size: 32px;
                font-style: oblique;
                font-weight: bold;
            }    


        </style>
    </head>

    <body>
        <%@include file="header.jsp"%>

        <div class="categories">
            <div class="small-container">
                <h2 class="title">Categories</h2>
                <br>
                <br>
                <div class="row">
                    <div class="col-3">
                        <a href="booking.jsp?room=room1"> <img src="img/r1.jpg"><br><s3>Junior Suite</s3></a>
                    </div>

                    <div class="col-3">
                        <a href="booking.jsp?room=room2">  <img src="img/r2.jpg"><br><s3>Master Suite</s3></a>
                    </div>

                    <div class="col-3">
                        <a href="booking.jsp?room=room3">   <img src="img/r3.jpg"><br><s3>Luxury Suite</s3></a>
                    </div>

                    <!--                    <div class="col-3">
                                            <a href="booking.jsp?room=room4">   <img src="img/r4.jpeg"><br><s3>Room 4</s3></a>
                                        </div>-->

                    <div class="col-3">
                        <a href="booking.jsp?room=room4">   <img src="img/r5.jpeg"><br><s3>Sea-Side View</s3></a>
                    </div>

                    <div class="col-3">
                        <a href="booking.jsp?room=room5">   <img src="img/r6.jpeg"><br><s3>Villa</s3></a>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
