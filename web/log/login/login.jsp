<%-- 
    Document   : login
    Created on : Oct 9, 2020, 2:37:25 AM
    Author     : Hp
--%>

<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
        <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="login.css">
    </head>
    <body >
        
        <% if (request.getAttribute("status") != null) {%>
        <div id="msg"><%= request.getAttribute("status")%></div>
        <%}%>


        <div class="container-fluid bg">
            <div class="row justify-content-center">
                <div class="col-12 col-sm-6 col-md-3">
                    <h1>Welcome to Orlin's</h1>

                    <form method="POST" id="login" action="../index.html" class="form-container">

                        <h2 class="login">Login</h2>
                        <br>
                        <div class="form-group">
                            <label> Email ID: </label>
                            <input type="email" name="name" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label> Password: </label>
                            <input type="password" name="pw" class="form-control" required>
                        </div>

                        <input type="submit" name="submit" value="submit" class="btn btn-primary" >
                        <br>
                        <small>
                            <a href="forgotpassword.jsp">Forgot password?</a><br>
                            <a href="registration.jsp">Create account</a><br>
                            <a href="adminlogin.jsp">Login as admin</a>
                        </small>  
                    </form>

                </div>
            </div>
        </div>
    </body>
</html>