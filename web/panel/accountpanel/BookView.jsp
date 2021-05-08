
<%@page import="edu.charmin.ehospital.entity.HospitalBed"%>
<%@page import="edu.charmin.ehospital.daoo.impl.HospitalBedDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.HospitalBedDAO"%>
<%@page import="edu.charmin.ehospital.entity.Patient"%>
<%@page import="edu.charmin.ehospital.entity.Doctor"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientDAOimpl"%>

<%@page import="edu.charmin.ehospital.daoo.PatientDAO"%>

<%@page import="edu.charmin.ehospital.entity.BookBed"%>
<%@page import="edu.charmin.ehospital.daoo.impl.BookBedDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.BookBedDAO"%>
<%@include file="../layout/Header.jsp" %>
<%    PatientDAO patDao = new PatientDAOimpl();
    BookBedDAO bedDao = new BookBedDAOImpl();
    HospitalBedDAO hosDao = new HospitalBedDAOImpl();

%>
<section id="main">

    <div class="container">
        <div class="row">
            <%@include file="menus.jsp" %>
            <div class="col-md-9">
                <!-- Website Overview -->

                <%if (request.getParameter("success") == null) {
                    } else if (request.getParameter("success").equals("1")) {
                        BookBed em = bedDao.getById(Integer.parseInt(request.getParameter("caid")));
                        HospitalBed hos = hosDao.getById(em.getBedId());
                        Patient pate = patDao.getById(em.getPatientId());
                        int totalDays = (int) ((em.getDischargeDate().getTime() - em.getAddedDate().getTime()) / (1000 * 60 * 60 * 24));

                %><div class='alert alert-success' role='button' data-toggle="modal" data-target="#myModal">Patient Successfully Discharged!! Click me to View the bill<button type="button" class="close" data-dismiss="alert">x</button></div>

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
                                        <input type="text" class="form-control" value="<%=em.getBookId()%>" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label for="post_category">Patient</label>
                                        <input type="text" class="form-control" value="<%=pate.getPatientFirstName()%> <%=pate.getPatientLastName()%>" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label for="doctor_id">Total Days</label>
                                        <input type="text" class="form-control" value="<%=totalDays%>" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label for="doctor_id">Price</label>
                                        <input type="text" class="form-control" value="<%=(hos.getBedPrice() * totalDays)%>" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label for="doctor_id">Discharge Date</label>
                                        <input type="text" class="form-control" value="<%=em.getDischargeDate()%>" disabled>
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
                        <h3 class="panel-title">Patients Admitted</h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                <th>ID</th>
                                <th>Patient ID</th>
                                <th>Bed Id</th>
                                <th>Added Date</th>
                                <th>Discharge Date</th>
                                <th>Status</th>
                                <th>Action</th>
                                </thead>
                                <tbody>
                                    <%

                                        BookBedDAO emDao = new BookBedDAOImpl();
                                        for (BookBed em : emDao.getAll()) {

                                    %>
                                    <tr>

                                        <td><%=em.getBookId()%></td>
                                        <td><%=em.getPatientId()%></td>
                                        <td><%=em.getBedId()%></td>
                                        <td><%=em.getAddedDate()%></td>
                                         <td><%=em.getDischargeDate()%></td>
                                        <%if (em.getBookStatus() == 1) {
                                        %><td>Reserved</td>
                                          <td><a class="btn btn-info" href="DischargePatient.jsp?id=<%=em.getBedId()%>&&bookid=<%=em.getBookId()%>" role="button">Discharge</a></td>
                                        <%} else if (em.getBookStatus() == 0) {
                                        %><td>Discharged</td>
                                        <td><a class="btn btn-info" href="#" role="button" disabled>Discharged</a></td>
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