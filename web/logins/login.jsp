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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
  integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="./login.css">
</head>
<body >
    <% if(request.getAttribute("status")!=null) {%>
<div id="msg"><%= request.getAttribute("status")%></div>
<%}%>

    <div class="row justify-content-center">
      <div class="col-12 col-sm-6 col-md-4">
            <h1>Welcome to Orlin's</h1>

            <form method="POST" id="login" action="../index.html" class="form-container">

                <h2>LOGIN</h2>
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
                     
                    <a href="forgotpassword.html">Forgot password?</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="register.html">Create account!</a><br>
                    <a href="adminlogin.html">Login as admin</a>
                   
                   </small><br></br><hr>
                    <p>
                     <a class="facebook" href="#"><i class="fa fa-facebook fa-lg"></i></a> 
                     <a class="instagram" href="#"><i class="fa fa-instagram fa-lg"></i></a>
                     <a href="#" class="tripad"><i class="fab fa-tripadvisor fa-lg"></i></a>
                    </p>
                
                   
            </form>
        
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


</body>
</html>
