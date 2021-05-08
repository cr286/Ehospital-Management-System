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

<%@include file="Header.jsp" %>
<%@include file="menu.jsp" %>
<div class="col-md-9">
    <!-- Website Overview -->
    <%if (request.getParameter("success") == null) {
         } else if (request.getParameter("success").equals("1")) {%><div class='alert alert-success' role='button' onclick="">New Appointment Successfully added!! <button type="button" class="close" data-dismiss="alert">x</button></div>
    <%}%>
    <div class="panel panel-default">
        <div class="panel-heading main-color-bg">
            <h3 class="panel-title">My Appointments <a class="btn btn-primary" href="AppointmentAdd.jsp" role="button"> Make a Appointment</a> </h3>
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                    <th>ID</th>
                    <th>Doctor's Name</th>

                    <th>Date</th>
                    <th>Status</th>
                    <th>Action</th> 
                    </thead>
                    <tbody>
                        <%                    DoctorDAO docDao = new DoctorDAOImpl();
                            AppointmentDAO emDao = new AppointmentDAOImpl();
                            for (Appointment em : emDao.getAll()) {
                                Doctor doct = docDao.getById(em.getDoctorId());
                                if (em.getPatientId() == id) {
                        %>
                        <tr>
                            <td><%=em.getAppointmentID()%></td>
                            <td><%=doct.getDoctorFirstName()%> <%=doct.getDoctorLastName()%></td>

                            <td><%=em.getAppointmentDate()%></td>

                            <%if (em.getAppointmentStatus() == 1) {%>
                            <td>Paid</td>
                            <td><a class="btn btn-danger" href="#" role="button" disabled>Paid</a></td>
                            <%} else if (em.getAppointmentStatus() == 0) {%>
                            <td>Not Paid</td>

                            <td><a class="btn btn-info" href="#" role="button" disabled>Not Paid</a></td>
                            <%} else if (em.getAppointmentStatus() == 2) {%>
                            <td>Checked Out</td>
                            <td><a class="btn btn-primary" href="#" role="button" disabled>Checked</a></td>
                            <%

                            } else if (em.getAppointmentStatus() == 3) {%>
                            <td>Self Appointment</td>
                            <td><a class="btn btn-primary" href="#" role="button" disabled>Self</a></td>
                            <%

                                }%>
                          <!--  <td><a class="btn btn-danger" href="DeleteAppointment.jsp?id=<%=em.getAppointmentID()%>" role="button">Delete</a> <a class="btn btn-primary" href="UpdateAppointment.jsp?id=<%=em.getAppointmentID()%>" role="button">Update</a></td>
                            --></tr>     
                            <%
                                    }
                                }
                            %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


</section>
<%@include file="Footer.jsp" %>