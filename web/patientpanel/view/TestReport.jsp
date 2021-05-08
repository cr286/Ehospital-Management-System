<%@page import="edu.charmin.ehospital.entity.PatientTest"%>
<%@page import="edu.charmin.ehospital.daoo.PatientTestDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientTestDAOImpl"%>
<%@page import="edu.charmin.ehospital.entity.Doctor"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DoctorDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DoctorDAO"%>
<%@page import="edu.charmin.ehospital.entity.Checkup"%>
<%@page import="edu.charmin.ehospital.daoo.impl.CheckupDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.CheckupDAO"%>
<%@include file="Header.jsp" %>
<%@include file="menu.jsp" %>
<div class="col-md-9">
    <!-- Website Overview -->
    <div class="panel panel-default">
        <div class="panel-heading main-color-bg">
            <h3 class="panel-title">My Test Reports</h3>
        </div>
        <div class="panel-body">
            <table class="table table-striped table-hover">
                <thead>
                <th>ID</th>
                <th>Checked By</th>
                <th>Action</th>
                </thead>
                <tbody>
                    <%                           DoctorDAO docDao = new DoctorDAOImpl();
                        PatientTestDAO patTestDao = new PatientTestDAOImpl();
                        for (PatientTest patTest : patTestDao.getAll()) {
                            if (patTest.getPatientId() == id) {
                                Doctor doc = docDao.getById(patTest.getDoctorId());
                    %>
                    <tr>
                        <td><%=patTest.getPatientTestId()%></td>

                        <td><%=doc.getDoctorFirstName()%> <%=doc.getDoctorLastName()%></td>

                        <td><a class="btn btn-primary" href="TestReportSingle.jsp?ptid=<%=patTest.getPatientTestId()%>" role="button">View</a> </td>
                    </tr>     

                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>


</section>

<%@include file="Footer.jsp" %>