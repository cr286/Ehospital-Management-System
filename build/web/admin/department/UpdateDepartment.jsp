<%-- 
    Document   : EmployeeAdd
    Created on : Jun 28, 2018, 4:29:19 PM
    Author     : charm_000
--%>

<%@page import="edu.charmin.ehospital.entity.Department"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.impl.AdminDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmployeeDAO"%>
<%@page import="edu.charmin.ehospital.entity.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
       <%
         int departid = Integer.parseInt(request.getParameter("id"));
          Department cus = new Department();
          DepartmentDAO cusDao = new DepartmentDAOImpl();
          cus = cusDao.getById(departid);
            if (request.getMethod().equals("POST")) {
               
                cus.setDepartmentName(request.getParameter("department_name"));
                cus.setDepartmentDescription(request.getParameter("department_description"));
                cus.setDepartmentStatus(request.getParameter("department_status"));
                
                cusDao.update(cus,departid);
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
                <a href="CustomerView.jsp"></a>


                <div class="form-group">
                    <label>Department Name</label>
                    <input type="text" name="department_name" class="form-control" required value="<%=cus.getDepartmentName()%>">
                </div>
                <div class="form-group">
                    <label>Description</label>
                    <input type="text" name="department_description" class="form-control" required value="<%=cus.getDepartmentDescription()%>">
                </div>
               
                <div class="form-group">
                    <label>Status</label>
                    <input type="text" name="department_status" class="form-control" required value="<%=cus.getDepartmentStatus()%>">
                </div>
                
                <button type="submit" class="btn btn-primary" onclick="">Update</button>
            </form>
        </div>
                    </div>
              </div>
         
        
     
    </section>
  <%@include file="../adminview/AdminFooter.jsp" %>
