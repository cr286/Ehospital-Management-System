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
<%        DoctorDAO docDao = new DoctorDAOImpl();
    PatientDAO patDao = new PatientDAOimpl();
    AppointmentDAO emDao = new AppointmentDAOImpl();

%>
<section id="main">
    <div class="container">
        <div class="row">
            <%@include file="menus.jsp" %>



            <div class="col-md-9">
                <!-- Website Overview -->
                <%if (request.getParameter("success") == null) {
                    } else if (request.getParameter("success").equals("1")) {
                        Appointment em = emDao.getById(Integer.parseInt(request.getParameter("caid")));
                        Doctor doct = docDao.getById(em.getDoctorId());
                        Patient pate = patDao.getById(em.getPatientId());
                %><div class='alert alert-success' role='button' data-toggle="modal" data-target="#myModal">Appointment Successfully Paid!! Click me to View the bill<button type="button" class="close" data-dismiss="alert">x</button></div>

                <!-- Modal -->
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div id="print_content">
                        
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Bill Payment</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="post_category">ID</label>
                                    <input type="text" class="form-control" value="<%=em.getAppointmentID()%>" disabled>
                                </div>

                                <div class="form-group">
                                    <label for="doctor_id">Doctor</label>
                                    <input type="text"  class="form-control" value="<%=doct.getDoctorFirstName()%> <%=doct.getDoctorLastName()%>" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="post_category">Patient</label>
                                    <input type="text" class="form-control" value="<%=pate.getPatientFirstName()%> <%=pate.getPatientLastName()%>" disabled>
                                </div>

                                <div class="form-group">
                                    <label for="doctor_id">Price</label>
                                    <input type="text" class="form-control" value="<%=doct.getDoctorCharge()%>" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="doctor_id">Date</label>
                                    <input type="text" class="form-control" value="<%=em.getAppointmentDate()%>" disabled>
                                </div>
                            </div>
                        </div>
                            <div class="modal-footer">
                                <a class="btn btn-primary" href="javascript:Clickheretoprint()" role="button">Print</a>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- Modal End -->

                <%}%>

                <div class="panel panel-default">
                    <div class="panel-heading main-color-bg">
                        <h3 class="panel-title">Appointment</h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                <th>ID</th>
                                <th>Doctor's Name</th>
                                <th>Patient's Name</th>
                                <th>Date</th>
                                <th>Status</th>
                                <th>Action</th> 
                                </thead>
                                <tbody>
                                    <%

                                        for (Appointment em : emDao.getAll()) {
                                            Doctor doct = docDao.getById(em.getDoctorId());
                                            Patient pate = patDao.getById(em.getPatientId());
                                    %>

                                    <tr>
                                        <td><%=em.getAppointmentID()%></td>
                                        <td><%=doct.getDoctorFirstName()%> <%=doct.getDoctorLastName()%></td>
                                        <td><%=pate.getPatientFirstName()%> <%=pate.getPatientLastName()%></td>
                                        <td><%=em.getAppointmentDate()%></td>
                                        <%if (em.getAppointmentStatus() == 1) {%>
                                        <td>Paid</td>
                                        <td><a class="btn btn-danger" href="PayAppointment.jsp?id=<%=em.getAppointmentID()%>&&status=1" role="button">Undo</a></td>
                                        <%} else if (em.getAppointmentStatus() == 0) {%>
                                        <td>Not Paid</td>


                                        <td><a class="btn btn-info" href="PayAppointment.jsp?id=<%=em.getAppointmentID()%>&&status=0" role="button">Pay</a></td>
                                        <%} else {%>
                                        <td>Checked Out</td>
                                        <td><a class="btn btn-primary" href="#" role="button" disabled>Checked</a></td>

                                        <%

                                            }%>
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




            <%@include file="../layout/Footer.jsp" %>