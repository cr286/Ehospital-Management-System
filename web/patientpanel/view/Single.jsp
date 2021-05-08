
<%@page import="edu.charmin.ehospital.entity.Patient"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientDAOimpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientDAO"%>
<%@page import="edu.charmin.ehospital.entity.Doctor"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DoctorDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DoctorDAO"%>
<%@include file="Header.jsp" %>
<%@include file="menu.jsp" %>
<div class="col-md-9">
    <!-- Website Overview -->
    <div class="panel panel-default">
        <div class="panel-heading main-color-bg">
            <h3 class="panel-title"><a class="btn btn-primary" href="index.jsp" role="button">Go Back</a></h3>
        </div>
        <div class="panel-body">
            <table class="table table-striped table-hover">
                <tr>
                    <th>#</th>
                    <th>Info</th>

                </tr>
                <%
                    PatientDAO emDao = new PatientDAOimpl();
                    Patient em = emDao.getById(id);
                %>
                <tr>
                    <td>ID</td>
                    <td><%=em.getPatientId()%></td>
                </tr> 
                <tr>
                    <td>Name</td>
                    <td><%=em.getPatientFirstName()%> <%=em.getPatientLastName()%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=em.getPatientEmail()%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=em.getPatientAddress()%></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><%=em.getPatientPhone()%></td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td><%=em.getPatientStatus()%></td>
                </tr>

                <tr>
                    <td>Added Date</td>
                    <td><%=em.getPatientAddedDate()%></td>
                </tr>
                <tr>
                    <td>DOB</td>
                    <td><%=em.getPatientDateOfBirth()%></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><%=em.getPatientGender()%></td>
                </tr>
                <tr>
                    <td>Profile Image</td>
                   <td><img src="../../uploads/<%=em.getPatientImage()%>" width="40%" /></td>
                </tr>


            </table>
        </div>
    </div>
</div>


</section>
<%@include file="Footer.jsp" %>
