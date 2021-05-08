<%-- 
    Document   : EmployeeAdd
    Created on : Jun 28, 2018, 4:29:19 PM
    Author     : charm_000
--%>

<%@page import="edu.charmin.ehospital.daoo.impl.TestDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.TestDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DoctorDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DoctorDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientDAOimpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientTestDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientTestDAO"%>
<%@page import="edu.charmin.ehospital.entity.PatientTest"%>
<%@page import="edu.charmin.ehospital.entity.Test"%>
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
    DoctorDAO doc = new DoctorDAOImpl();
    PatientDAO patDao = new PatientDAOimpl();
    TestDAO tes = new TestDAOImpl();
    if (request.getMethod().equals("POST")) {
        PatientTest cus = new PatientTest();
        PatientTestDAO cusDao = new PatientTestDAOImpl();
        cus.setPatientId(Integer.parseInt(request.getParameter("patient_id")));
        cus.setTestId(Integer.parseInt(request.getParameter("test")));
        cus.setDoctorId(Integer.parseInt(request.getParameter("doctor_id")));
        cus.setStatus(0);
        cusDao.insert(cus);
        response.sendRedirect("index.jsp?success=1");
    }
%>
<%@include file="../layout/Header.jsp" %>
<section id="main">
    <div class="container">
        <div class="row">
            <%@include file="menus.jsp" %>
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
                        <% for (Patient patient : patDao.getAll()) {
                        %>

                        <option value="<%=patient.getPatientId()%>"><%=patient.getPatientFirstName()%> <%=patient.getPatientLastName()%></option>
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
                <label for="doctor_id">Tests</label>
                <div class="form-group">
                    <%for (Test test : tes.getAll()) {
                    %>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="test" value="<%=test.getTestId()%>"><%=test.getTestName()%>
                    </label>
                    <%
                        }
                    %>
                </div>
             
                <button type="submit" class="btn btn-primary" onclick="">Apply</button>
            </form>
        </div>
    </div>
</div>

</section>
<%@include file="../layout/Footer.jsp" %>
