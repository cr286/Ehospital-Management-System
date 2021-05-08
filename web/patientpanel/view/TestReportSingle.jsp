<%@page import="edu.charmin.ehospital.entity.PatientTest"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientTestDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientTestDAO"%>
<%@page import="edu.charmin.ehospital.entity.Doctor"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DoctorDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DoctorDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientDAOimpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientDAO"%>
<%@page import="edu.charmin.ehospital.entity.Patient"%>
<%@page import="edu.charmin.ehospital.daoo.impl.CheckupDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.CheckupDAO"%>
<%@page import="edu.charmin.ehospital.entity.Checkup"%>
<%@include file="Header.jsp" %>
<%@include file="menu.jsp" %>

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
                     Integer ptid = Integer.parseInt(request.getParameter("ptid"));
                     if(ptid == null){
                     response.sendRedirect("index.jsp");
                     }
                    DoctorDAO docDao = new DoctorDAOImpl();
                    PatientDAO patDao = new PatientDAOimpl();
                   PatientTestDAO patTestDao = new PatientTestDAOImpl();
                    PatientTest pt = patTestDao.getById(ptid);
                    int pid=pt.getPatientId();
                    Patient pat = patDao.getById(pid);
                    int did=pt.getDoctorId();
                    Doctor doc = docDao.getById(did);
                    if(pid==id){
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
                    <td>Test Description</td>
                    <td><%=pt.getTestBody()%></td>
                </tr>
                <tr>
                    <td>Tested Date</td>
                    <td><%=pt.getTestedDate()%></td>
                </tr>
                 <tr>
                    <td>Report Image</td>
                   <td><img src="../../uploads/<%=pt .getReportImage()%>" width="40%" /></td>
                </tr>
               
               
            </table>
             </div>
              <a class="btn btn-primary" href="javascript:Clickheretoprint()" role="button">Print</a> <a class="btn btn-primary" href="index.jsp" role="button">Close</a>   
        </div>
    </div>
</div>
<%}%>

</section>

<%@include file="Footer.jsp" %>
