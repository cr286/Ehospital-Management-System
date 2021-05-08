<%@page import="edu.charmin.ehospital.entity.BookBed"%>
<%@page import="edu.charmin.ehospital.daoo.impl.BookBedDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.BookBedDAO"%>
<%@include file="../layout/Header.jsp" %>
<section id="main">
    <div class="container">
        <div class="row">
            <%@include file="menus.jsp" %>
            <div class="col-md-9">
                <!-- Website Overview -->
                <%if (request.getParameter("success") == null) {
                } else if (request.getParameter("success").equals("1")) {%><div class='alert alert-success' role='button' onclick="">Bed is successfully booked!! <button type="button" class="close" data-dismiss="alert">x</button></div>
                <%}%>
                <div class="panel panel-default">
                    <div class="panel-heading main-color-bg">
                        <h3 class="panel-title"><a class="btn btn-primary" href="BookAdd.jsp" role="button">Reserve</a> Beds Available</h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                <th>ID</th>
                                <th>Patient ID</th>
                                <th>Bed Id</th>
                                <th>Added Date</th>
                                <th>Status</th>
                                <th>Discharge Date</th>
                                
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
                                        <%if (em.getBookStatus() == 1) {
                                        %><td>Reserved</td><%} else if (em.getBookStatus() == 0) {
                                        %><td>Discharged</td><%}%>
                                        <td><%=em.getDischargeDate()%></td>
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