<%-- 
    Document   : index
    Created on : Jun 28, 2018, 2:56:13 PM
    Author     : charm_000
--%>
  <%@page import="edu.charmin.ehospital.daoo.impl.DoctorDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DoctorDAO"%>
<%@page import="edu.charmin.ehospital.entity.Doctor"%>
<%@page import="edu.charmin.ehospital.entity.Admin"%>
<%@page import="edu.charmin.ehospital.daoo.impl.AdminDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.AdminDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmployeeDAO"%>
<%@page import="edu.charmin.ehospital.entity.Employee"%>

<%
       String i="";
        String post=request.getParameter("inputPost");
        DoctorDAO adminDAO = new DoctorDAOImpl();
        EmployeeDAO adminDao = new EmployeeDAOImpl();
        if (request.getMethod().equals("POST")) {
            for (Doctor admin : adminDAO.getAll()) {
                if (admin.getDoctorUsername().equals(request.getParameter("inputUserName")) && admin.getDoctorPassword().equals(request.getParameter("inputUserPassword"))) {
                   if(post.equals("doctor")){
                       i="1";
                       session.setAttribute("id", admin.getDoctorId()); //to set session
                       session.setAttribute("panel", "doctor"); //to set panel session
                    response.sendRedirect("doctorpanel/");
                   }
                }
            }
            for (Employee admin : adminDao.getAll()) {
                if (admin.getEmployeeUsername().equals(request.getParameter("inputUserName")) && admin.getEmployeePassword().equals(request.getParameter("inputUserPassword"))) {
                   if(admin.getEmployeePost().equals(post)&&post.equals("employee")){  
                       i="1";
                     session.setAttribute("id", admin.getEmployeeId()); //to set session
                       session.setAttribute("panel", "employee"); //to set panel session
                    response.sendRedirect("employeepanel/");
                   }
                    if(admin.getEmployeePost().equals(post)&&post.equals("account")){  
                        i="1";
                       session.setAttribute("id", admin.getEmployeeId()); //to set session
                         session.setAttribute("panel", "account"); //to set panel session
                    response.sendRedirect("accountpanel/");
                   }
                    if(admin.getEmployeePost().equals(post)&&post.equals("receptionist")){  
                        i="1";
                       session.setAttribute("id", admin.getEmployeeId()); //to set session
                         session.setAttribute("panel", "receptionist"); //to set panel session
                    response.sendRedirect("reciptionpanel/");
                   }
                     if(admin.getEmployeePost().equals(post)&&post.equals("pathedology")){  
                         i="1";
                       session.setAttribute("id", admin.getEmployeeId()); //to set session
                         session.setAttribute("panel", "pathedology"); //to set panel session
                    response.sendRedirect("pathethologypanel/");
                   }
                } 
            }
             if(i.equals("0")){
             response.sendRedirect("index.jsp?success=0");
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
    <link href="../admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="../admin/css/style.css" rel="stylesheet">
  
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
          <a class="navbar-brand" href="#">Login Area</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">

        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <header id="header">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center"> Login Area <small>Account Login</small></h1>
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
                    <label>Login As </label>
                    <select class="form-control" name="inputPost">
                        <option value="account">Account</option>
                        <option value="doctor">Doctor</option>
                        <option value="employee">Employee</option>
                        <option value="receptionist">Receptionist</option>
                        <option value="pathedology">Pathethology</option>
                      </select>
                  </div>
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
      <p>Copyright Charmin Ratna Shakya, &copy; 2017</p>
    </footer>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
  </body>
</html>

