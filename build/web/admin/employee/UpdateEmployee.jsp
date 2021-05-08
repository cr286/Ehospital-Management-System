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
    int empid = Integer.parseInt(request.getParameter("id"));
    
    Employee cus = new Employee();
    EmployeeDAO cusDao = new EmployeeDAOImpl();
    cus = cusDao.getById(empid);
    if (request.getMethod().equals("POST")) {
        
        cus.setEmployeeFirstName(request.getParameter("admin_first_name"));
        cus.setEmployeeLastName(request.getParameter("admin_last_name"));
        cus.setEmployeeEmail(request.getParameter("admin_email"));
        cus.setEmployeePhone(request.getParameter("admin_phone"));
        cus.setEmployeeAddress(request.getParameter("admin_address"));
        cus.setEmployeeUsername(request.getParameter("admin_username"));
        String passEn = request.getParameter("admin_password");
        cus.setEmployeeGender("asd");
        cus.setEmployeePost(request.getParameter("admin_password"));
        cus.setEmployeeDescription("asd");
        cus.setEmployeeSalary(1212);
        cus.setEmployeeStatus("sad");
        cus.setEmployeePassword(passEn);
        cusDao.update(cus,empid);
        response.sendRedirect("index.jsp?success=2");
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
                    <input type="text" name="admin_first_name" class="form-control" required value="<%=cus.getEmployeeFirstName()%>">
                </div>
                <div class="form-group">
                    <label>Last Name</label>
                    <input type="text" name="admin_last_name" class="form-control" required value="<%=cus.getEmployeeLastName()%>">
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="admin_email" class="form-control" required value="<%=cus.getEmployeeEmail()%>">
                </div>
                <div class="form-group">
                    <label>Phone</label>
                    <input type="number" name="admin_phone" class="form-control" required value="<%=cus.getEmployeePhone()%>">
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <input type="text" name="admin_address" class="form-control" required value="<%=cus.getEmployeeAddress()%>">
                </div>
                <div class="form-group">
                    <label>Post</label>
                    <select class="form-control" name="employee_post">
                       
                        <option value="account"  <% if (cus.getEmployeePost().equals("account")) {%>default<%  }%>>Account</option>
                        <option value="receptionist" <% if (cus.getEmployeePost().equals("receptionist")) {%>default<%  }%>>Receptionist</option>
                        <option value="pathedology" <% if (cus.getEmployeePost().equals("pathedology")) {%>default<%  }%>>Patheology</option>


                    </select>
                </div>
               
                     <input type="hidden" name="admin_username" class="form-control" required value="<%=cus.getEmployeeUsername()%>">
                    <input type="hidden" name="admin_password" class="form-control" required value="<%=cus.getEmployeePassword()%>">
              


                <button type="submit" class="btn btn-primary" onclick="">Update</button>
            </form>
        </div>
    </div>
</div>



</section>
<%@include file="../adminview/AdminFooter.jsp" %>
