<%-- 
    Document   : index
    Created on : Jun 28, 2018, 2:56:13 PM
    Author     : charm_000
--%>
<%@page import="edu.charmin.ehospital.utility.SavePatientPassWord"%>
<%@page import="edu.charmin.ehospital.daoo.PatientDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientDAOimpl"%>
<%@page import="edu.charmin.ehospital.entity.Patient"%>
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
    int pid=(Integer) (session.getAttribute("pid"));
    PatientDAO patdao = new PatientDAOimpl();
    Patient pat = patdao.getById(pid);
    if (request.getMethod().equals("POST")) {

            if (request.getParameter("inputOldPassword").equals(pat.getPatientPassword())) {
            if (request.getParameter("inputNewPassword").equals(request.getParameter("inputConfirmPassword"))) {
              SavePatientPassWord.savePass(request.getParameter("inputNewPassword"),pid);
                response.sendRedirect("view/");
              
            } else {
                response.sendRedirect("ChangePass.jsp?success=0");
            }
        } else {
            response.sendRedirect("ChangePass.jsp?success=1");
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Patient Panel Area | Account Login</title>
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
                        <span class="iaon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Change Password</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">

                </div><!--/.nav-collapse -->
            </div>
        </nav>

        <header id="header">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="text-center"> Change Password <small>Patient</small></h1>
                    </div>
                </div>
            </div>
        </header>
        <%if (request.getParameter("success") == null) {
            } else if (request.getParameter("success").equals("0")) {%><div class='alert alert-danger' role='button' onclick="">Password Does not match. Please Try Again!! <button type="button" class="close" data-dismiss="alert">x</button></div>
        <%}%>
        <%if (request.getParameter("success") == null) {
               } else if (request.getParameter("success").equals("1")) {%><div class='alert alert-danger' role='button' onclick="">Wrong Password Entered. <button type="button" class="close" data-dismiss="alert">x</button></div>
        <%}%>
        <section id="main">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <form id="login" action="" class="well" method="POST">

                            <div class="form-group">
                                <label>Old Password</label>
                                <input type="password" class="form-control" placeholder="Old Password" name="inputOldPassword" required>
                            </div>
                            <div class="form-group">
                                <label>New Password</label>
                                <input type="password" class="form-control" placeholder="New Password" name="inputNewPassword" id="check" required>
                            </div>
                            <div class="form-group">
                                <label>Confirm Password</label>
                                <input type="password" class="form-control" placeholder="Confirm Password" name="inputConfirmPassword" id='confirm' required>
                            </div>
                            <button type="submit"  class="btn btn-default btn-block">Submit</button>
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
        <script src="../admin/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>



    </body>
</html>

