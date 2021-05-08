<%@page import="edu.charmin.ehospital.entity.PatientTest"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientTestDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientTestDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.TestDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.TestDAO"%>
<%@page import="edu.charmin.ehospital.entity.Patient"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientDAOimpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientDAO"%>
<%@page import="edu.charmin.ehospital.entity.Doctor"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DoctorDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DoctorDAO"%>
<%@page import="edu.charmin.ehospital.entity.Appointment"%>
<%@page import="edu.charmin.ehospital.daoo.impl.AppointmentDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.AppointmentDAO"%>
<%@page import="edu.charmin.ehospital.entity.Post"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PostDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.PostDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DepartmentDAOImpl"%>
<%@page import="edu.charmin.ehospital.entity.Department"%>
<%@page import="edu.charmin.ehospital.daoo.DepartmentDAO"%>


<div class="col-md-9">
    <!-- Website Overview -->
    <%if (request.getParameter("success") == null) {
        } else if (request.getParameter("success").equals("1")) {%><div class='alert alert-success' role='button' onclick="">New Patient Test Successfully added!! <button type="button" class="close" data-dismiss="alert">x</button></div>
    <%}%>
    <div class="panel panel-default">
        <div class="panel-heading main-color-bg">
            <h3 class="panel-title"><a class="btn btn-primary" href="PatientTestAdd.jsp" role="button">New Patient Test</a> <img role="button" src="../../uploads/excel.png" style="width:5%;" onclick="tableToExcel('table', 'W3C Example Table')" /></h3>
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-hover" id="table">
                    <thead>
                    <th>ID</th>

                    <th>Patient's Name</th>
                    <th>Referred By:</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Action</th> 
                    </thead>
                    <tbody>
                        <%
                            TestDAO testDao = new TestDAOImpl();
                            DoctorDAO docDao = new DoctorDAOImpl();
                            PatientDAO patDao = new PatientDAOimpl();
                            PatientTestDAO emDao = new PatientTestDAOImpl();
                            for (PatientTest em : emDao.getAll()) {
                                Doctor doct = docDao.getById(em.getDoctorId());
                                Patient pate = patDao.getById(em.getPatientId());
                        %>
                        <tr>
                            <td><%=em.getPatientTestId()%></td>

                            <td><%=pate.getPatientFirstName()%> <%=pate.getPatientLastName()%></td>
                            <td>Dr. <%=doct.getDoctorFirstName()%> <%=doct.getDoctorLastName()%></td>
                            <td><%=em.getAddedDate()%></td>
                            <%if (em.getStatus() == 1) {%>
                            <td>Paid</td>
                            <%} else if (em.getStatus() == 0) {%>
                            <td>Not Paid</td>
                            <%} else {%>
                            <td>Checked Out</td>
                            <%}%>
                            <td><a class="btn btn-danger" href="DeletePatientTest.jsp?id=<%=em.getPatientTestId()%>" role="button">Delete</a> <a class="btn btn-primary" href="UpdatePatientTest.jsp?id=<%=em.getPatientTestId()%>" role="button">Update</a></td>
                        </tr>     
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


</section>