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
<%
                            TestDAO testDao = new TestDAOImpl();
                                        DoctorDAO docDao = new DoctorDAOImpl();
                                        PatientDAO patDao = new PatientDAOimpl();
                                        PatientTestDAO emDao = new PatientTestDAOImpl();
%>
            <div class="col-md-9">
                <!-- Website Overview -->
              
                  <%if (request.getParameter("success") == null) {
                    } else if (request.getParameter("success").equals("1")) {
                        PatientTest em = emDao.getById(Integer.parseInt(request.getParameter("caid")));
                        Doctor doct = docDao.getById(em.getDoctorId());
                        Patient pate = patDao.getById(em.getPatientId());
                        Test t = testDao.getById(em.getTestId());
                %><div class='alert alert-success' role='button' data-toggle="modal" data-target="#myModal">Patient Test Successfully Paid!! Click me to View the bill<button type="button" class="close" data-dismiss="alert">x</button></div>

                <!-- Modal -->
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                           
                        
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Bill Payment</h4>
                            </div>
                             <div id="print_content">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="post_category">Test Name</label>
                                    <input type="text" class="form-control" value="<%=t.getTestName()%>" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="post_category">ID</label>
                                    <input type="text" class="form-control" value="<%=em.getPatientTestId()%>" disabled>
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
                                    <input type="text" class="form-control" value="<%=em.getTestedDate()%>" disabled>
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
                        <h3 class="panel-title">Tests</h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
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
                                        <td><a class="btn btn-danger" href="PayTest.jsp?id=<%=em.getPatientTestId()%>&&status=1" role="button">Undo</a></td>
                                        <%} else if (em.getStatus() == 0) {%>
                                        <td>Not Paid</td>

                                        <td><a class="btn btn-info" href="PayTest.jsp?id=<%=em.getPatientTestId()%>&&status=0" role="button">Pay</a></td>
                                        <%} else {%>
                                        <td>Checked Out</td>
                                        <td><a class="btn btn-primary" href="#" role="button" disabled>Checked</a></td>
                                        <%}%>

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