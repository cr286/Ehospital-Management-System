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
            <h3 class="panel-title"><a class="btn btn-primary" href="CheckUpView.jsp" role="button">Go Back</a></h3>
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
                    DoctorDAO docDao = new DoctorDAOImpl();
                    PatientDAO patDao = new PatientDAOimpl();
                    CheckupDAO emDao = new CheckupDAOImpl();
                    Checkup em = emDao.getById(cid);
                    int did=em.getDoctorId();
                    Doctor doc = docDao.getById(did);
                    
                %>
              
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
              <a class="btn btn-primary" href="javascript:Clickheretoprint()" role="button">Print</a> <a class="btn btn-primary" href="index.jsp" role="button">Close</a>   
        </div>
    </div>
</div>


</section>

<%@include file="Footer.jsp" %>
