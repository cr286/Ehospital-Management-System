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
<%@include file="../layout/Header.jsp" %>
<section id="main">
    <div class="container">
        <div class="row">
            <%@include file="menus.jsp" %>

            <div class="col-md-9">
                <!-- Website Overview -->
                <div class="panel panel-default">
                    <div class="panel-heading main-color-bg">
                        <h3 class="panel-title"><a class="btn btn-primary" href="PatientTestAdd.jsp" role="button">Add</a></h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <tr>
                                    <th>ID</th>

                                    <th>Patient's Name</th>
                                    <th>Referred By:</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                    <th>Action</th> 
                                </tr>
                                <%                    TestDAO testDao = new TestDAOImpl();
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
                                    <td><a class="btn btn-danger" href="#" role="button" disabled>Paid</a></td>
                                    <%} else if (em.getStatus() == 0) {%>
                                    <td>Not Paid</td>

                                    <td><a class="btn btn-info" href="#" role="button" disabled>Not Paid</a></td>
                                    <%} else if (em.getStatus() == 2) {%>
                                    <td>Checked Out</td>
                                    <td><a class="btn btn-primary" href="#" role="button" disabled>Checked</a></td>
                                    <%

                        }%>
                                </tr>     
                                <%
                                    }
                                %>

                            </table>
                        </div>
                    </div>
                </div>
            </div>


            </section>
            <%@include file="../layout/Footer.jsp" %>