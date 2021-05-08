
<%@page import="edu.charmin.ehospital.entity.Patient"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientDAOimpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientDAO"%>
<%@page import="edu.charmin.ehospital.entity.Checkup"%>
<%@page import="edu.charmin.ehospital.daoo.impl.CheckupDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.CheckupDAO"%>
<%@page import="edu.charmin.ehospital.entity.Employee"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmployeeDAO"%>
<%@page import="edu.charmin.ehospital.entity.Doctor"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DoctorDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DoctorDAO"%>
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
            <div id="print_content">
            <table class="table table-striped table-hover">
                <tr>
                    <th>#</th>
                    <th>Info</th>

                </tr>
                <%
                    int cid = Integer.parseInt(request.getParameter("cid"));
                    PatientDAO patDao = new PatientDAOimpl();
                      CheckupDAO checkDao = new CheckupDAOImpl();
                    Checkup checkup = checkDao.getById(cid);
                    Patient pat = patDao.getById(checkup.getPatientId());
                %>
                <tr>
                    <td>ID</td>
                    <td><%=checkup.getCheckupId()%></td>
                </tr> 
                <tr>
                    <td>Patient Name</td>
                    <td><%=pat.getPatientFirstName()+" "+pat.getPatientLastName()%></td>
                </tr>
                <tr>
                    <td>Report Description</td>
                    <td><%=checkup.getCheckupReport()%></td>
                </tr>
                <tr>
                    <td>Medicine</td>
                    <td><%=checkup.getCheckupMedicine()%></td>
                </tr>
                <tr>
                    <td>Test</td>
                    <td><%=checkup.getCheckupTest()%></td>
                </tr>
                <tr>
                    <td>Remarks</td>
                    <td><%=checkup.getCheckupRemarks()%></td>
                </tr>
               
            </table>
                </div>
                 <a class="btn btn-primary" href="javascript:Clickheretoprint()" role="button">Print</a> <a class="btn btn-primary" href="index.jsp" role="button">Close</a>   
        </div>
    </div>
</div>
</section>

<%@include file="../layout/Footer.jsp" %>
