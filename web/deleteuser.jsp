<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.student"%>
<%@page import="model.registration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Delete</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <style>
        body{
            background-color: teal;
        }
        .errmsg{
            background: green;
            padding: 6px;
            width: 50%;
            color: white;
            font-weight: bold;
        }
        .jumbotron{
            background-color: white;
        }
        #search
        {
            width: 50%; 
        }

    </style>
    <body>
        <%@include file="header.jsp"%>
    <center>
        <br>
        <font color="blue" size="4">
        <h2 style="color: black; font-size: 40px; text-decoration: underline;"> Delete User </h2>
        </font>
        <% if (request.getAttribute("status") != null) {%>
        <h1 class="errmsg"> <%= request.getAttribute("status")%></h1>
        <%}%>
        <div class="container ">
            <div class="jumbotron" style="background-color: teal; font-size: 18px;">
                <input class="form-control" id="search" type="text" placeholder="Search.." style="font-size: 18px;">
                <table class="table"  style="background-color: #1adfe6;">
                    <thead>
                        <tr style="background-color: lightblue;">
                    <br>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Date</th>
                    <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody id="table">
                        <% if (session.getAttribute("id") != null && session.getAttribute("id").equals("1")) {
                                registration reg = new registration(session);
                                ArrayList<student> mydata = reg.getuserdata();

                                Iterator<student> itr = mydata.iterator();
                                while (itr.hasNext()) {
                                    student s = itr.next();
                        %>
                        <tr>
                            <td><%=s.getId()%></td>
                            <td><%=s.getName()%></td>
                            <td><%=s.getemail()%></td>
                            <td><%=s.getphone()%></td>
                            <td><%=s.getaddress()%></td>
                            <td><%=s.getdate()%></td>
                            <td>
                                <form action="delete" method="POST">
                                    <input type="hidden" name="userid" value="<%=s.getId()%>"/>
                                    <input type="submit" class="btn btn-danger" value="Delete" />
                                </form>
                            </td>
                        </tr> 

                        <%}
                            }%> 
                    </tbody>
                </table>
            </div>
        </div>
    </center>

    <script>
        $(document).ready(function () {
            $("#search").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#table tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > 0)
                });
            });
        });
    </script>


</body>
</html>
