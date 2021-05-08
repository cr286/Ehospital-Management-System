<%@page import="edu.charmin.ehospital.entity.Doctor"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DoctorDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DoctorDAO"%>

<div class="col-md-9">
    <!-- Website Overview -->
    <div class="panel panel-default">
        <div class="panel-heading main-color-bg">
            <h3 class="panel-title">Doctors</h3>
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
                            DoctorDAO emDao = new DoctorDAOImpl();
                            for (Doctor em : emDao.getAll()) {
                        %>
                        <tr>
                            <td><%=em.getDoctorId()%></td>
                            <td><%=em.getDoctorFirstName()%> <%=em.getDoctorLastName()%></td>
                            <td><%=em.getDoctorEmail()%></td>
                            <td><%=em.getDoctorAddress()%></td>
                            <td><%=em.getDoctorPhone()%></td>
                            <td><a class="btn btn-primary" href="DoctorSingle.jsp?id=<%=em.getDoctorId()%>" role="button">View</a> </td>
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