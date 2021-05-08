
<%@page import="edu.charmin.ehospital.utility.AppointmentStatusUpdate"%>
<%@page import="edu.charmin.ehospital.entity.Appointment"%>
<%@page import="edu.charmin.ehospital.daoo.impl.AppointmentDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.AppointmentDAO"%>
<%@page import="edu.charmin.ehospital.entity.Doctor"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DoctorDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DoctorDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientDAOimpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientDAO"%>
<%@page import="edu.charmin.ehospital.entity.Patient"%>
<%@page import="edu.charmin.ehospital.daoo.impl.CheckupDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.CheckupDAO"%>
<%@page import="edu.charmin.ehospital.entity.Checkup"%>
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
                    int appid = Integer.parseInt(request.getParameter("aid"));
                    DoctorDAO docDao = new DoctorDAOImpl();
                    PatientDAO patDao = new PatientDAOimpl();
                    CheckupDAO emDao = new CheckupDAOImpl();
                    
                    Checkup em = AppointmentStatusUpdate.GetCheckupDetailByAppId(appid);
                    int pid=em.getPatientId();
                    Patient pat = patDao.getById(pid);
                    int did=em.getDoctorId();
                    Doctor doc = docDao.getById(did);
                %>
                <tr>
                    <td>Patient Name</td>
                    <td><%=pat.getPatientFirstName()+" "+pat.getPatientLastName()%></td>
                </tr> 
                <tr>
                    <td>Checked By</td>
                    <td><%=doc.getDoctorFirstName()%> <%=doc.getDoctorLastName()%></td>
                </tr>
                <tr>
                    <td>Report</td>
                    <td><%=em.getCheckupReport()%></td>
                </tr>
                <tr>
                    <td>Tests Required</td>
                    <td><%=em.getCheckupTest()%></td>
                </tr>
                <tr>
                    <td>Recommended Medicine</td>
                    <td><%=em.getCheckupMedicine()%></td>
                </tr>
                <tr>
                    <td>Remarks</td>
                    <td><%=em.getCheckupRemarks()%></td>
                </tr>
            </table>
             </div>
              <a class="btn btn-primary" href="javascript:Clickheretoprint()" role="button">Print</a> <a class="btn btn-primary" href="AppointmentView.jsp" role="button">Close</a>   
        </div>
    </div>
</div>


</section>

<%@include file="../layout/Footer.jsp" %>