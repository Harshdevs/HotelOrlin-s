<%-- 
    Document   : registration
    Created on : Oct 8, 2020, 11:01:59 PM
    Author     : Hp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="register.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
        <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>

    </head>
    <body>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
        <script>
            //            jQuery.validator.addMethod( name, method [, message ] )
            //            
            // value---> "current value of the validated element".
            //elememt--->" element to be validated ".

            jQuery.validator.addMethod("checkemail", function (value, element) {
                return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
            });

            jQuery(document).ready(function ($) {
                $("#signup").validate({
                    //ignore: [],
                    rules: {
                        name: {
                            required: true
                        },
                        email: {
                            required: true,
                            checkemail: true
                        },
                        phone: {
                            required: true,
                            minlength: 10,
                            maxlength: 10
                        },
                        addr: {
                            required: true
                        },
                        pw: {
                            required: true,
                            minlength: 6
                        },
                        cp: {
                            required: true,
                            minlength: 6,
                            equalTo: "#pw"
                        }
                    },
                    messages: {
                        name: {
                            required: "* Please enter the name! *"
                        },
                        email: {
                            required: "* Please enter the email! *",
                            email: "* Please enter valid email id! *"
                        },
                        phone: {
                            required: "* Please enter the number! *",
                            minlength: "* Please enter the  10 digit number! *",
                            maxlength: "* more than 10 digits not allowed! *"
                        },
                        addr: {
                            required: "* Please enter your address! *"
                        },
                        pw: {
                            required: "* Please enter the password! *",
                            minlength: "* Please enter the password greater than or equal to  6! *",
                        },
                        cp: {
                            required: "* Please re-enter the password! *",
                            minlength: "* Please enter the password greater than or equal to 6! *",
                            equalTo: "* Password doesn't match! *"
                        }
                    }
                });
            });
        </script>

        <% if (request.getAttribute("status") != null) {%>
        <div id="msg"><%= request.getAttribute("status")%></div>
        <%}%>


        <div class="container"><br>

            <div class="col-lg-6 m-auto d-block">

                <!--<form method="POST" id ="signup" action="../login.html">-->
                <form method="POST" id ="signup" action="register">
                    <h1>REGISTER</h1>
                    <div class="form-group">
                        <label class="font-weight-bold"> NAME:  </label>
                        <input type="text" id="name" name="name" class="form-control" autocomplete="off">
                    </div> 

                    <div class="form-group">
                        <label class="font-weight-bold"> PHONE NUMBER:   </label>
                        <input type= "tel" id="phone" name="phone" class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label class="font-weight-bold"> Email:  </label>
                        <input type="email" id="email" name="email" class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label class="font-weight-bold">Address: </label>
                        <input type="text" id="addr" name="addr" class="form-control" autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label class="font-weight-bold"> Password:  </label>
                        <input type="password" id="pw" name="pw" class="form-control" autocomplete="off">
                    </div>  

                    <div class="form-group">
                        <label class="font-weight-bold"> Confirm Password:  </label>
                        <input type="password" name="cp" class="form-control" autocomplete="off">
                    </div> 

                    <input type="submit" name="register" value="Register" class="btn btn-primary" autocomplete="off">

                </form>
            </div>
        </div>
    </body>
</html>









