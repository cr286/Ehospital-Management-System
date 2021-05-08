<%-- 
    Document   : index
    Created on : Jun 28, 2018, 2:56:13 PM
    Author     : charm_000
--%>
  <%@page import="edu.charmin.ehospital.entity.Admin"%>
<%@page import="edu.charmin.ehospital.daoo.impl.AdminDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.AdminDAO"%>
<%

        AdminDAO adminDao = new AdminDAOImpl();

        if (request.getMethod().equals("POST")) {
            for (Admin admin : adminDao.getAll()) {
                if (admin.getAdminUsername().equals(request.getParameter("inputUserName")) && admin.getAdminPassword().equals(request.getParameter("inputUserPassword"))) {
                     session.setAttribute("aid", admin.getAdminId()); //to set session
                    response.sendRedirect("adminview/AdminView.jsp");
                } else {
                   
                    response.sendRedirect("index.jsp?success=0");
                }
            }
        }
    %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Area | Account Login</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <script src="http://cdn.ckeditor.com/4.6.1/standard/ckeditor.js"></script>
  </head>
  <body>
    <nav class="navbar navbar-default">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Admin Area</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">

        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <header id="header">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center"> Admin Area <small>Account Login</small></h1>
          </div>
        </div>
      </div>
    </header>
<%if (request.getParameter("success") == null) {
         } else if (request.getParameter("success").equals("0")) {%><div class='alert alert-danger' role='button' onclick="">Wrong Password Please Try Again!! <button type="button" class="close" data-dismiss="alert">x</button></div>
    <%}%>
    <section id="main">
      <div class="container">
        <div class="row">
          <div class="col-md-4 col-md-offset-4">
              <form id="login" action="" class="well" method="POST">
                  <div class="form-group">
                    <label>Username</label>
                    <input type="text" class="form-control" placeholder="Enter Username" name="inputUserName" required>
                  </div>
                  <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" placeholder="Password" name="inputUserPassword" required>
                  </div>
                  <button type="submit" class="btn btn-default btn-block">Login</button>
              </form>
          </div>
        </div>
      </div>
    </section>

    <footer id="footer">
      <p>Copyright Charmin Ratna Shakya, &copy; 2018</p>
    </footer>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>

