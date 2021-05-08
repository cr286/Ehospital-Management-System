<%@page import="edu.charmin.ehospital.entity.Patient"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientDAOimpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientDAO"%>

<div class="col-md-9">
    <!-- Website Overview -->
    <%if (request.getParameter("success") == null) {
                 } else if (request.getParameter("success").equals("1")) {%><div class='alert alert-success' role='button' onclick="">New Patient Successfully added!! <button type="button" class="close" data-dismiss="alert">x</button></div>
    <%}%>
    <div class="panel panel-default">
        <div class="panel-heading main-color-bg">
            <h3 class="panel-title"><a class="btn btn-primary" href="PatientAdd.jsp" role="button">New Patient</a></h3>
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
                        <td><a class="btn btn-primary" href="Single.jsp?id=<%=em.getPatientId()%>" role="button">View</a> <a class="btn btn-danger" href="DeletePatient.jsp?id=<%=em.getPatientId()%>" role="button">Delete</a> <a class="btn btn-primary" href="UpdatePatient.jsp?id=<%=em.getPatientId()%>" role="button">Update</a></td>
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