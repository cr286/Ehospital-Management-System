
<%@page import="edu.charmin.ehospital.entity.Test"%>
<%@page import="edu.charmin.ehospital.daoo.impl.TestDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.TestDAO"%>
<%@page import="edu.charmin.ehospital.daoo.PatientTestDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientTestDAOImpl"%>
<%@page import="edu.charmin.ehospital.entity.PatientTest"%>
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
            <h3 class="panel-title"><a class="btn btn-primary" href="PatientTestView.jsp" role="button">Go Back</a></h3>
        </div>
        <div class="panel-body">
             <div id="print_content">
            <table class="table table-striped table-hover">
                <tr>
                    <th>#</th>
                    <th>Info</th>
                </tr>
                <%
                    TestDAO testDao = new TestDAOImpl();
                int ptid = Integer.parseInt(request.getParameter("id"));
                    DoctorDAO docDao = new DoctorDAOImpl();
                    PatientTestDAO emDao = new PatientTestDAOImpl();
                    PatientDAO patDao = new PatientDAOimpl();
                    PatientTest em = emDao.getById(ptid);
                    int pid=em.getPatientId();
                    int did=em.getDoctorId();
                    Patient pat = patDao.getById(pid);
                    Doctor doc = docDao.getById(did);
                     Test t = testDao.getById(em.getTestId());
                %>
                <tr>
                    <td>Patient Name</td>
                    <td><%=pat.getPatientFirstName()+" "+pat.getPatientLastName()%></td>
                </tr> 
                <tr>
                    <td>Referred By</td>
                    <td><%=doc.getDoctorFirstName()%> <%=doc.getDoctorLastName()%></td>
                </tr>
                <tr>
                    <td>Report</td>
                    <td><%=em.getTestBody()%></td>
                </tr>
                <tr>
                    <td>Tests Done</td>
                    <td><%=t.getTestName()%></td>
                </tr>
             
                  <tr>
                    <td>Report Image</td>
                    <td><img src="../../uploads/<%=em.getReportImage()%>" width="40%" /></td>
                   
                </tr>
               
                
               
            </table>
             </div>
              <a class="btn btn-primary" href="javascript:Clickheretoprint()" role="button">Print</a> <a class="btn btn-primary" href="PatientTestView.jsp" role="button">Close</a>   
        </div>
    </div>
</div>


</section>

<%@include file="../layout/Footer.jsp" %>