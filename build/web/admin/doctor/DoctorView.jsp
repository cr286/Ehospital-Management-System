<%@page import="edu.charmin.ehospital.entity.Doctor"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DoctorDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DoctorDAO"%>

<div class="col-md-9">
    <!-- Website Overview -->
    <%if (request.getParameter("success") == null) {
                 } else if (request.getParameter("success").equals("1")) {%><div class='alert alert-success' role='button' onclick="">New Doctor Successfully added!! <button type="button" class="close" data-dismiss="alert">x</button></div>
    <%}%>
    <div class="panel panel-default">
        <div class="panel-heading main-color-bg">
            <h3 class="panel-title"><a class="btn btn-primary" href="DoctorAdd.jsp" role="button">New Doctor</a></h3>
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
                    <th>Charge</th>
                    <th>Action</th>
                    </thead>
                    <tbody>
                        <%
                            DoctorDAO emDao = new DoctorDAOImpl();
                            for (Doctor em : emDao.getAll()) {
                        %>
                        <tr>
                            <td><%=em.getDoctorId()%></td>
                            <td><%=em.getDoctorFirstName()%> <%=em.getDoctorLastName()%></td>
                            <td><%=em.getDoctorEmail()%></td>
                            <td><%=em.getDoctorAddress()%></td>
                            <td><%=em.getDoctorPhone()%></td>
                            <td><%=em.getDoctorCharge()%></td>
                            <td><a class="btn btn-primary" href="Single.jsp?id=<%=em.getDoctorId()%>" role="button">View</a> <a class="btn btn-danger" href="DeleteDoctor.jsp?id=<%=em.getDoctorId()%>" role="button" onclick="ondelete()">Delete</a> <a class="btn btn-primary" href="UpdateDoctor.jsp?id=<%=em.getDoctorId()%>" role="button">Update</a></td>
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