

<%@page import="edu.charmin.ehospital.daoo.impl.TestDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.TestDAO"%>
<%@page import="edu.charmin.ehospital.entity.Test"%>
<%@page import="edu.charmin.ehospital.entity.Patient"%>
<%@page import="edu.charmin.ehospital.entity.Checkup"%>
<%@page import="edu.charmin.ehospital.daoo.impl.CheckupDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.CheckupDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientDAOimpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DoctorDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DoctorDAO"%>
<%@include file="../layout/Header.jsp" %>
<section id="main">
    <div class="container">
        <div class="row">
            <%@include file="menus.jsp" %>



            <div class="col-md-9">
                <!-- Website Overview -->
                <div class="panel panel-default">
                    <div class="panel-heading main-color-bg">
                        <h3 class="panel-title">Reports</h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                <th>ID</th>
                                <th>Patient's Name</th>
                                <th>Remarks</th>
                                <th>Action</th> 
                                </thead>
                                <tbody>
                                    <%                    PatientDAO patDao = new PatientDAOimpl();
                                        CheckupDAO checkDao = new CheckupDAOImpl();
                                       
                                        for (Checkup checkup : checkDao.getAll()) {
                                            if (checkup.getDoctorId() == id) {
                                                Patient pate = patDao.getById(checkup.getPatientId());
                                               
                                    %>
                                    <tr>
                                        <td><%=checkup.getCheckupId()%></td>
                                        <td><%=pate.getPatientFirstName()%> <%=pate.getPatientLastName()%></td>
                                        <td><%=checkup.getCheckupRemarks()%></td>
                                        <td><a class="btn btn-danger" href="ReportSingle.jsp?cid=<%=checkup.getCheckupId()%>" role="button">View</a></td>

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
            <%@include file="../layout/Footer.jsp" %>