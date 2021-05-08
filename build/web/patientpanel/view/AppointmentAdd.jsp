<%-- 
    Document   : EmployeeAdd
    Created on : Jun 28, 2018, 4:29:19 PM
    Author     : charm_000
--%>

<%@page import="edu.charmin.ehospital.utility.AppointmentStatusUpdate"%>
<%@page import="java.sql.Date"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DepartmentDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DepartmentDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DoctorDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DoctorDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.AppointmentDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.AppointmentDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientDAOimpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientDAO"%>
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
<%@include file="Header.jsp" %>
<%@include file="menu.jsp" %>
<%    DoctorDAO doc = new DoctorDAOImpl();
 int docId;
    Date date;
    DepartmentDAO depDao = new DepartmentDAOImpl();
    if (request.getMethod().equals("POST")) {
        docId =Integer.parseInt(request.getParameter("doctor_id"));
        date =Date.valueOf(request.getParameter("date"));
        Appointment cus = new Appointment();
        AppointmentDAO cusDao = new AppointmentDAOImpl();
        cus.setPatientId(id);
        cus.setAppointmentStatus(3);
        cus.setDoctorId(docId);
        if(AppointmentStatusUpdate.DoctorAppointmentLimitCheck(date , docId)){
         cusDao.insert(cus);
        response.sendRedirect("index.jsp?success=1");}else{
        response.sendRedirect("AppointmentAdd.jsp?success=0");}
       
    }
%>


<div class="col-md-9">
    <!-- Website Overview -->
      <%if (request.getParameter("success") == null) {
         } else if (request.getParameter("success").equals("0")) {%><div class='alert alert-danger' role='button' onclick="">Appointment Limit for Doctor is maxed. Please try next day!! <button type="button" class="close" data-dismiss="alert">x</button></div>
    <%}%>
    <div class="panel panel-default">
        <div class="panel-heading main-color-bg">
            <h3 class="panel-title"><a class="btn btn-primary" href="index.jsp" role="button">Go Back</a></h3>
        </div>
        <div class="panel-body">

            <form method="POST" action="">
                <div class="form-group">
                    <label for="Department">Department</label>
                    <select class="form-control" name="department_id">
                        <% for (Department dep : depDao.getAll()) {
                        %>

                        <option value="<%=dep.getDepartmentId()%>"><%=dep.getDepartmentName()%></option>
                        <%
                                        }%>
                    </select>
                </div>

                <div class="form-group">
                    <label for="doctor_id">Doctor</label>
                    <select class="form-control" name="doctor_id">
                        <% for (Doctor doct : doc.getAll()) {

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
<%@include file="Footer.jsp" %>
