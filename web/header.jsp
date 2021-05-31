<%-- 
    Document   : header
    Created on : 9 Oct, 2020, 8:42:40 PM
    Author     : Harsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <style>
        .hd ul {
            list-style-type: none;
            /*width:100%;*/
            margin: 0;
            padding: 6px;
            overflow: hidden;
            background-color: #333;
            /*background-color: #123969;*/
            /*background-image: url(./img/b1.jpg);*/
            /*background-size: cover;*/
            border: 3px solid white;
        }

        .hd li {
            float: right;
        }
        .hd li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 18px;
            text-decoration: none;
        }

        .hd li a:hover {
            background-color: #111;
        }
        .hd .uname{
            margin-top: 14px;
            color: white;
            margin-right: 10px;
        }

        .hd .btns{
            position: relative;
            right: 5%;
        }
    </style>
    <body style="margin: 0;">
        <div class="hd">

            <ul style="font-size: 25px;">
                <a href="#" style="position: relative; left:10px; top: 7px; color: white; font-size: 32px; font-style: oblique;"><strong><u>&nbsp;Hotel Orlin's&nbsp;</u></strong></a>

                <% if (session.getAttribute("uname") != null) {%>

                <li class="uname btns"><i class="fa fa-user-circle" aria-hidden="true" style="margin-right: 7px;"></i><%=session.getAttribute("uname")%></li>
                <li class="btns"><a href="register?logout=yes">Logout</a></li>
                <li class="btns"><a href="EditForm.jsp">Edit</a></li>

                <% if (session.getAttribute("id").equals("1")) {%>
                <li class="btns" style="display: none;"><a href="userbookings.jsp">Booked Rooms</a></li>
                    <%} else {%>
                <li class="btns"><a href="userbookings.jsp">Booked Rooms</a></li>
                    <%}%>


                <% if (session.getAttribute("id").equals("1")) {%>
                <li class="btns"><a href="deleteuser.jsp">Delete</a></li>
                <li class="btns"><a href="adminbookings.jsp">Bookings</a></li>
                    <%}
                    } else {%>
                <li class="btns"><a href="register.jsp">Register</a></li>
                <li class="btns"><a href="login.jsp">Login</a></li>
                    <%}
                    %>
                <!--<li class="btns"><a class="active" href="ind.jsp">Home</a></li>-->
                <!--<li class="btns" style="position: relative; right: 70%; font-size: 32px; color: white; font-style: oblique;"><a href="ind.jsp"><strong><u>&nbsp;Hotel Orlin's&nbsp;</u></strong></a></li>-->
            </ul>
        </div>
    </body>
</html>
