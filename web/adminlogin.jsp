<%-- 
    Document   : adminlogin
    Created on : Oct 9, 2020, 2:48:05 AM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
        <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="./adminlogin.css">
    </head>
    <body >

        <% if (request.getAttribute("status") != null) {%>
        <div id="msg"><%= request.getAttribute("status")%></div>
        <%}%>

        <div class="container-fluid bg">
            <div class="row justify-content-center">
                <div class="col-12 col-sm-6 col-md-3">
                    <h1>Welcome to Orlin's</h1>

                    <form method="POST" id="login" action="../ind.html" class="form-container">

                        <h2><b> Admin Login  </b></h2>
                        <br>
                        <div class="form-group">
                            <label> Admin ID: </label>
                            <input type="text" name="name" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label> Password: </label>
                            <input type="password" name="pw" class="form-control" required>
                        </div>

                        <input type="submit" name="submit" value="submit" class="btn btn-primary" >
                        <br>
                        <small>
                            <a href="forgotpassword.html">Forgot password?</a>
                        </small>  
                    </form>

                </div>
            </div>
        </div>
        <!--<footer>
            <a href="https://www.sookshmas.com/" target="_blank" class="copyright">&copy; Copyright 2020 Sookshmas
                Internship</a>
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
                    
                    <li>
                        <a href="#" class="tripad">
                            <i class="fab fa-tripadvisor"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </footer>-->






    </body>
</html>
