<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.student"%>
<%@page import="model.registration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Form</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
    </head>
    <style>
        html{
            width: 100%;
            height: 100%;
            background-color: teal;
        }
        td input{
            display:block;
        }
        .jumbotron{
            background-color: teal;
            /*background-image: url(./img/b1.jpg);*/
            /*background-size: cover;*/
            padding: 2rem 1rem;
        }
        h2{
            color: black;
            text-decoration: underline;
            font-size: 42px;
        }
        label{
            font-size: 22px;
            color: black;
        }
    </style>
    <body>
        <%@include file="header.jsp"%>
    <center style="background-color: teal;">
        <% if (session.getAttribute("uname") != null) {
                registration reg = new registration(session);
                student s = reg.getInfo();%>

        <font color="blue" size="5"><br>
        <h2> Edit Profile</h2>
        </font>
        <form action='update' method='POST'>
            <div class="container ">
                <div class="jumbotron">
                    <div class="form-group col-md-4">
                        <label >Name :</label>
                        <input type="text" class="form-control"  name="name" value="<%=s.getName()%>">
                    </div>
                    <div class="form-group col-md-4">
                        <label >Phone Number :</label>
                        <input type="number" class="form-control"  name="pno" value="<%=s.getphone()%>">
                    </div>
<!--                    <div class="form-group col-md-4">
                        <label >Email :</label>
                        <input type="email" class="form-control"  name="email" value="<%=s.getemail()%>">
                    </div>-->
                    <div class="form-group col-md-4">
                        <label >Address :</label>
                        <input type="text" class="form-control"  name="addr" value="<%=s.getaddress()%>">
                    </div>
                    <button type="submit" class="btn btn-primary" name="submit">Update</button>
                </div>
            </div>
        </form>
        <%}%> 
    </center>
    
</body>
</html>
