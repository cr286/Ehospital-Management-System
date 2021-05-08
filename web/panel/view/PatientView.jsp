<%@page import="edu.charmin.ehospital.entity.Patient"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientDAOimpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientDAO"%>

<div class="col-md-9">
    <!-- Website Overview -->
    <div class="panel panel-default">
        <div class="panel-heading main-color-bg">
            <h3 class="panel-title">Patients</h3>
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Action</th>

                    </thead>
                    <tbody>
                        <%

                            PatientDAO emDao = new PatientDAOimpl();
                            for (Patient em : emDao.getAll()) {

                        %>
                        <tr>
                            <td><%=em.getPatientId()%></td>
                            <td><%=em.getPatientFirstName()%> <%=em.getPatientLastName()%></td>
                            <td><%=em.getPatientEmail()%></td>
                            <td><%=em.getPatientAddress()%></td>
                            <td><%=em.getPatientPhone()%></td>
                            <td><a class="btn btn-primary" href="PatientSingle.jsp?id=<%=em.getPatientId()%>" role="button" >View</a> </td>
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