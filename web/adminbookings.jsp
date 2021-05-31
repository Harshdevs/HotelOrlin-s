<%@page contentType="text/html"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.registration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.rooms"%>
<%@page import="model.bookings"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Bookings</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 17px;
            }
            .container{
                max-width: 1500px;
/*                margin:auto;
                padding-left: 25px;
                padding-right: 25px;*/
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                min-width: 1000px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {        
                padding-bottom: 15px;
                background: #35475e;
                color: #fff;
                padding: 16px 30px;
                min-width: 100%;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title img{
                float: left;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn-group {
                float: right;
            }

            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }	
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: white;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .bookmore{
                display: inline-block;
                position: relative;
                left: 18%;
            }
            .bookedrms{
                display: inline-block;
                position: relative;
                left: 40%;
            }
            .cost{
                float: right;
                font-size: 25px;
                color: black;
                padding-top: 30px;
                padding-right: 300px;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <!--<div class="container">-->
                <%@include file="header.jsp"%>
            <!--</div>-->
        </div>

        <div class="container">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-12">
                                <center><h2><b><u>User Bookings</u></b></h2></center>
                            </div>
                        </div>
                    </div>  
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Image</th>
                                <th>Room Name</th>
                                <th>User Name</th>
                                <th>Arrival Day</th>
                                <th>Room cost</th>
                                <th>Dwell Days</th>
                                <th>Total</th>
                                <th>Accept</th>
                                <th>Reject</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% int tcost = 0;
                                int grandtotal = 0;
                                registration s1 = new registration(session);
                                ArrayList<bookings> ar = s1.adminbookings();
                                Iterator<bookings> itr = ar.iterator();
                                while (itr.hasNext()) {
                                    bookings s = itr.next();
                                    tcost = (Integer.parseInt(s.getB_cost()) * (s.getStay()));
                                    grandtotal = grandtotal + tcost;
                            %> 
                            <tr>
                                <td><img src="imgs/<%=s.getB_img()%>" width="150px" height="100px"></td>
                                <td><%=s.getB_name()%></td>
                                <td><%=s.getUname()%></td>
                                <td><%=s.getArrival()%></td>
                                <td>&#x20B9; <%=s.getB_cost()%></td>
                                <td><%=s.getStay()%></td>
                                <td>&#x20B9; <%=tcost%></td>
                                <td>
                                    <form action="booknow" method="post">
                                        <input type="hidden" name="b_id" value="<%=s.getB_id()%>"/>
                                        <button type="submit" name="accept">Accept</button>
                                    </form>
                                </td>
                                <td>
                                    <form action="booknow" method="post">
                                        <input type="hidden" name="b_id" value="<%=s.getB_id()%>"/>
                                        <button type="submit" name="reject">Reject</button>
                                    </form>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>

                <div class="cost">
                    Grand Total: &#x20B9; <%=grandtotal%>
                </div>

                <br>

                <div class="bookmore">
                    <a href="ind.jsp"><button type="button" class="btn btn-warning"> Go Back </button></a>
                </div>
                
                <div class="bookedrms">
                    <a href="cnfbooked.jsp"><button type="button" class="btn btn-warning"> Booked Rooms </button></a>
                </div>

            </div>
        </div>

        <br>

        <%@include file="footer.jsp"%>
        <script>
            function cnf() {
                alert("You will receive a mail regarding booking confirmation shortly!!");
            }
        </script>
    </body>
</html>
