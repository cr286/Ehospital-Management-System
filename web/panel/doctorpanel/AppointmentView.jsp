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

<%@include file="../layout/Header.jsp" %>
<section id="main">
    <div class="container">
        <div class="row">
            <%@include file="menus.jsp" %>



            <div class="col-md-9">
                <!-- Website Overview -->
                <div class="panel panel-default">
                    <div class="panel-heading main-color-bg">
                        <h3 class="panel-title">Appointments</h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                <th>ID</th>

                                <th>Patient's Name</th>
                                <th>Date</th>

                                <th>Action</th> 
                                </thead>
                                <tbody>
                                    <% if (id != null) {
                                            DoctorDAO docDao = new DoctorDAOImpl();
                                            PatientDAO patDao = new PatientDAOimpl();
                                            AppointmentDAO emDao = new AppointmentDAOImpl();
                                            for (Appointment em : emDao.getAll()) {
                                                if (em.getAppointmentStatus() == 1 && em.getDoctorId() == id) {
                                                    Patient pate = patDao.getById(em.getPatientId());
                                    %>
                                    <tr>
                                        <td><%=em.getAppointmentID()%></td>
                                        <td><%=pate.getPatientFirstName()%> <%=pate.getPatientLastName()%></td>
                                        <td><%=em.getAppointmentDate()%></td>
                                        <td><a class="btn btn-danger" href="Test.jsp?id=<%=em.getAppointmentID()%>&&status=2" role="button">Test</a></td>

                                        <%
                                                    }
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
            <%@include file="../layout/Footer.jsp" %>