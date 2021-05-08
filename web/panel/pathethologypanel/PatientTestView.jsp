<%@page import="edu.charmin.ehospital.entity.Test"%>
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

<%@include file="../layout/Header.jsp" %>
<section id="main">
    <div class="container">
        <div class="row">
            <%@include file="menus.jsp" %>

            <div class="col-md-9">
                <!-- Website Overview -->
                <div class="panel panel-default">
                    <div class="panel-heading main-color-bg">
                        <h3 class="panel-title">Tests</h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                <th>ID</th>
                                <th>Test Name</th>
                                <th>Patient's Name</th>
                                <th>Referred By:</th>
                                <th>Date</th>
                                <th>Status</th>
                                <th>Action</th> 
                                </thead>
                                <tbody>
                                    <%  TestDAO testDao = new TestDAOImpl();
                                        DoctorDAO docDao = new DoctorDAOImpl();
                                        PatientDAO patDao = new PatientDAOimpl();
                                        PatientTestDAO emDao = new PatientTestDAOImpl();
                                        for (PatientTest em : emDao.getAll()) {
                                            Doctor doct = docDao.getById(em.getDoctorId());
                                            Patient pate = patDao.getById(em.getPatientId());
                                            Test t = testDao.getById(em.getTestId());
                                            if (em.getStatus() == 1||em.getStatus()==2){
                                    %>
                                    <tr>
                                        <td><%=em.getPatientTestId()%></td>
                                        <td><%=t.getTestName()%></td>
                                        <td><%=pate.getPatientFirstName()%> <%=pate.getPatientLastName()%></td>
                                        <td>Dr. <%=doct.getDoctorFirstName()%> <%=doct.getDoctorLastName()%></td>
                                        <td><%=em.getAddedDate()%></td>
                                        <%if (em.getStatus() == 1) {%>
                                        <td>Paid</td>
                                        <td><a class="btn btn-danger" href="PatientTestAdd.jsp?id=<%=em.getPatientTestId()%>" role="button">Test</a></td>

                                        <%} else if (em.getStatus() == 2) {%>
                                        <td>Tested</td>
                                        <td><a class="btn btn-primary" href="#" role="button" disabled>Tested</a> <a class="btn btn-info" href="Report.jsp?id=<%=em.getPatientTestId()%>" role="button">View</a></td>
                                        <%

                                        } else {%>
                                        <td>Not Paid</td>
                                        <td><a class="btn btn-primary" href="#" role="button" disabled>Not Paid</a></td>
                                        <%

                                        }%>    
                                    </tr>     
                                    <%
                                        }}
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>


            </section>
            <%@include file="../layout/Footer.jsp" %>