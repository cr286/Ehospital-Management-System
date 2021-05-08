<%-- 
    Document   : EmployeeAdd
    Created on : Jun 28, 2018, 4:29:19 PM
    Author     : charm_000
--%>

<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.impl.AdminDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmployeeDAO"%>
<%@page import="edu.charmin.ehospital.entity.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    if (request.getMethod().equals("POST")) {
        Employee cus = new Employee();
        EmployeeDAO cusDao = new EmployeeDAOImpl();
        cus.setEmployeeFirstName(request.getParameter("admin_first_name"));
        cus.setEmployeeLastName(request.getParameter("admin_last_name"));
        cus.setEmployeeEmail(request.getParameter("admin_email"));
        cus.setEmployeePhone(request.getParameter("admin_phone"));
        cus.setEmployeeAddress(request.getParameter("admin_address"));
        cus.setEmployeeUsername(request.getParameter("admin_username"));
        String passEn = request.getParameter("admin_password");
        cus.setEmployeeGender("Male");
        cus.setEmployeePost(request.getParameter("admin_password"));
        cus.setEmployeeDescription("General Employee");
        cus.setEmployeeSalary(0);
        cus.setEmployeeStatus("Working");
        cus.setEmployeePassword(passEn);
        cusDao.insert(cus);
        response.sendRedirect("index.jsp?success=1");
    }
%>
<%@include file="../adminview/AdminHeader.jsp" %>
<div class="col-md-9">
    <!-- Website Overview -->
    <div class="panel panel-default">
        <div class="panel-heading main-color-bg">
            <h3 class="panel-title"><a class="btn btn-primary" href="index.jsp" role="button">Go Back</a></h3>
        </div>
        <div class="panel-body">

            <form method="POST" action="">
                <div class="form-group">
                    <label>First Name</label>
                    <input type="text" name="admin_first_name" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Last Name</label>
                    <input type="text" name="admin_last_name" class="form-control" required>
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="admin_email" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Phone</label>
                    <input type="number" name="admin_phone" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <input type="text" name="admin_address" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Post</label>
                    <select class="form-control" name="employee_post"> 
                        <option value="account">Account</option>
                        <option value="receptionist">Receptionist</option>
                        <option value="pathedology">Pathedology</option> 
                    </select>
                </div>
                <div class="form-group">
                    <label>UserName</label>
                    <input type="text" name="admin_username" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="admin_password" class="form-control" required>
                </div> 
                <button type="submit" class="btn btn-primary" onclick="">Add</button>
            </form>
        </div>
    </div>
</div>



</section>
<%@include file="../adminview/AdminFooter.jsp" %>
