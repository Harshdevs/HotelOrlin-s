<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    </head>
    <body>
        <%@include file="header.jsp"%>
        <style>
            .jumbotron{
                background: white;
            }
        </style>
        <% if (session.getAttribute("id") != null && session.getAttribute("id").equals("1")) {%>
        <script>
            $(document).ready(function() {
                $.ajax({
                    type: 'post',
                    url: 'fetch',
                    data: 'FetchUser=Fetchuser',
                    dataType: 'json',
                    success: function(data) {
                        var table1 = $("#table");
                        if (data.jsonarray) {
                            $.each(data.jsonarray, function(key, value)
                            {
                                var rowNew = $("<tr id='delete" + value.Id + "'><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
                                rowNew.children().eq(0).text(value.Id);
                                rowNew.children().eq(1).text(value.Name);
                                rowNew.children().eq(2).text(value.Email);
                                rowNew.children().eq(3).text(value.Mobile); 
                                rowNew.children().eq(4).text(value.Date);
                                rowNew.children().eq(5).append('<button type="button" class="btn btn-danger" onclick="Delete(' + value.Id + ');">Delete</button>');
                                rowNew.appendTo(table1);
//                                $(".data").append("<div id='delete" + value.Slno + "' style='width:20%;display:inline-block'><div><label>Slno:</label>" + value.Slno + "</div><div><label>Name:</label>" + value.Name + "</div><div><label>Email:</label>" + value.Email + "</div><div><label>Mobile:</label>" + value.Mobile + "</div><div><label>Date:</label>" + value.Date + "</div><div><button type='button' class='btn btn-danger' onclick='Delete(" + value.Slno + ");'>Delete</button></div></div>");
                            });
                        } else {
                            var rowNew = $("<tr style='text-align:center'><td id='start' colspan='6'></td></tr>");
                            rowNew.children().eq(0).text(data.status);
                            rowNew.appendTo(table1);
//                            $(".data").append("<div>No data found</div>");
                        }
                    }
                });
            });

            function Delete(slno) {
                $.ajax({
                    type: 'post',
                    url: 'fetch',
                    data: 'DeleteUser=DeleteUser&&slno=' + slno,
                    dataType: 'json',
                    success: function(data) {
                        if (data.status == "Deleted") {
                            $("#delete" + slno).remove();
                            alert("Successfully Deleted");
                        }
                    }
                });
            }
        </script>
        <div class="container">
            <div class="jumbotron">
                <font color="blue" size="4">
                <h2 style="text-align:center"> Delete Users </h2>
                </font>
                <table id="table" class="table" cellspacing="0" cellpadding="0" style="margin-bottom: 10px;">
                    <tr>
                        <th>Id</th>
                        <th>Name</th> 
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Date</th>
                        <th>Delete</th>
                    </tr>
                </table>
                <!--<div class="data"></div>-->
            </div>
        </div>
        <%}%>
        
    </body>
</html>
