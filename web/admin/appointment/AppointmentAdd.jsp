<%-- 
    Document   : EmployeeAdd
    Created on : Jun 28, 2018, 4:29:19 PM
    Author     : charm_000
--%>

<%@page import="edu.charmin.ehospital.entity.Appointment"%>
<%@page import="edu.charmin.ehospital.entity.Doctor"%>
<%@page import="edu.charmin.ehospital.entity.Patient"%>
<%@page import="edu.charmin.ehospital.entity.Post"%>
<%@page import="edu.charmin.ehospital.entity.Department"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.impl.AdminDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmployeeDAO"%>
<%@page import="edu.charmin.ehospital.entity.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   PatientDAO patDao = new PatientDAOimpl();
    DepartmentDAO depDao = new DepartmentDAOImpl();
    if (request.getMethod().equals("POST")) {
        Appointment cus = new Appointment();
        AppointmentDAO cusDao = new AppointmentDAOImpl();
        cus.setPatientId(Integer.parseInt(request.getParameter("patient_id")));
        cus.setDoctorId(Integer.parseInt(request.getParameter("doctor_id")));
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
                    <label for="post_category">Patient</label>
                    <select class="form-control" id="post_category" name="patient_id">
                        <% for(Patient patient:patDao.getAll() ){
                          %>
                        
                          <option value="<%=patient.getPatientId()%>"><%=patient.getPatientFirstName()%> <%=patient.getPatientLastName()%></option>
                        <%  
                        }%>
                    </select>
                </div>
                <div class="form-group">
                    <label for="Department">Department</label>
                    <select class="form-control" name="department_id">
                        <% for (Department depp : depDao.getAll()) {
                        %>

                        <option value="<%=depp.getDepartmentId()%>"><%=depp.getDepartmentName()%></option>
                        <%
                                        }%>
                    </select>
                </div>
                <div class="form-group">
                    <label for="doctor_id">Doctor</label>
                    <select class="form-control" name="doctor_id">
                        <% for(Doctor doct:doc.getAll() ){
                          %>
                        
                          <option value="<%=doct.getDoctorId()%>"><%=doct.getDoctorFirstName()%> <%=doct.getDoctorLastName()%></option>
                        <%  
                        }%>
                    </select>
                </div>
                 <div class="form-group">
                    <label for="Department">Date</label>
                    <input type="date" name="date" class="form-control">
                </div>    
               
                <button type="submit" class="btn btn-primary" onclick="">Get Appointment</button>
            </form>
        </div>
    </div>
</div>

</section>
<%@include file="../adminview/AdminFooter.jsp" %>
