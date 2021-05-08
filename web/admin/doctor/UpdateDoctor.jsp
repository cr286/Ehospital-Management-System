<%-- 
    Document   : EmployeeAdd
    Created on : Jun 28, 2018, 4:29:19 PM
    Author     : charm_000
--%>

<%@page import="edu.charmin.ehospital.entity.Department"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DoctorDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DoctorDAO"%>
<%@page import="edu.charmin.ehospital.entity.Doctor"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.impl.AdminDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmployeeDAO"%>
<%@page import="edu.charmin.ehospital.entity.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
       <%
           int docid = Integer.parseInt(request.getParameter("id"));
           Doctor cus = new Doctor();
           DoctorDAO cusDao = new DoctorDAOImpl();
           cus = cusDao.getById(docid);
       
            if (request.getMethod().equals("POST")) {
                
                cus.setDoctorFirstName(request.getParameter("admin_first_name"));
                cus.setDoctorLastName(request.getParameter("admin_last_name"));
                cus.setDoctorEmail(request.getParameter("admin_email"));
                cus.setDoctorPhone(request.getParameter("admin_phone"));
                cus.setDoctorAddress(request.getParameter("admin_address"));
                cus.setDoctorUsername(request.getParameter("admin_username"));
                String passEn = request.getParameter("admin_password");
                cus.setDoctorGender("Male");
                cus.setDoctorPost("");
                cus.setDoctorDescription("asd");
                cus.setDoctorSalary(Double.parseDouble(request.getParameter("admin_salary")));
                cus.setDoctorStatus("true");
                cus.setDoctorPassword(passEn);
                cus.setDoctorspecification("");
                cus.setDepartment_id(Integer.parseInt(request.getParameter("department_id")));
                cus.setDoctorCharge(Double.parseDouble(request.getParameter("doctor_charge")));
                cusDao.update(cus,docid);
                response.sendRedirect("index.jsp");
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
                    <label>First Name</label>
                    <input type="text" name="admin_first_name" class="form-control" required value="<%=cus.getDoctorFirstName()%>">
                </div>
                <div class="form-group">
                    <label>Last Name</label>
                    <input type="text" name="admin_last_name" class="form-control" required value="<%=cus.getDoctorLastName()%>">
                </div>
               
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="admin_email" class="form-control" required value="<%=cus.getDoctorEmail()%>">
                </div>
                <div class="form-group">
                    <label>Phone</label>
                    <input type="number" name="admin_phone" class="form-control" id="phone" required value="<%=cus.getDoctorPhone()%>">
                </div>
                 <div class="form-group">
                    <label>Address</label>
                    <input type="text" name="admin_address" class="form-control" required value="<%=cus.getDoctorFirstName()%>">
                </div>
                
                     <input type="hidden" name="admin_username" class="form-control" required value="<%=cus.getDoctorUsername()%>">
                    <input type="hidden" name="admin_password" class="form-control" required value="<%=cus.getDoctorPassword()%>">
                
                 <div class="form-group">
                    <label>Salary</label>
                    <input type="number" name="admin_salary" class="form-control" required value="<%=cus.getDoctorSalary()%>">
                </div>
              
               <div class="form-group">
                    <label for="doctor_id">Department</label>
                    <select class="form-control" name="department_id">
                        <% for(Department doct:dep.getAll() ){
                          %>
                        
                          <option value="<%=doct.getDepartmentId()%>"><%=doct.getDepartmentName()%></option>
                        <%  
                        }%>
                    </select>
                </div>
                      <div class="form-group">
                    <label>Doctor Charge</label>
                    <input type="number" name="doctor_charge" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary" onclick="checkPhone()">Update</button>
            </form>
        </div>
                    </div>
              </div>
         
        
     
    </section>
  <%@include file="../adminview/AdminFooter.jsp" %>
