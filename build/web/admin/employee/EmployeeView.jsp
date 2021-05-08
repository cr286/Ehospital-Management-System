<%@page import="edu.charmin.ehospital.entity.Employee"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmployeeDAO"%>
<div class="col-md-9">
    <!-- Website Overview -->
    <%if (request.getParameter("success") == null) {
                 } else if (request.getParameter("success").equals("1")) {%><div class='alert alert-success' role='button' onclick="">Test Successfully added!! <button type="button" class="close" data-dismiss="alert">x</button></div>
    <%}%>
    <div class="panel panel-default">
        <div class="table-responsive">
            <div class="panel-heading main-color-bg">
                <h3 class="panel-title"><a class="btn btn-primary" href="EmployeeAdd.jsp" role="button">New Employee</a></h3>
            </div>
            <div class="panel-body">
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

                            EmployeeDAO emDao = new EmployeeDAOImpl();
                            for (Employee em : emDao.getAll()) {
                        %>
                        <tr>
                            <td><%=em.getEmployeeId()%></td>
                            <td><%=em.getEmployeeFirstName()%> <%=em.getEmployeeLastName()%></td>
                            <td><%=em.getEmployeeEmail()%></td>
                            <td><%=em.getEmployeeAddress()%></td>
                            <td><%=em.getEmployeePhone()%></td>
                            <td><a class="btn btn-primary" href="Single.jsp?id=<%=em.getEmployeeId()%>" role="button">View</a> <a class="btn btn-danger" href="DeleteEmployee.jsp?id=<%=em.getEmployeeId()%>" role="button">Delete</a> <a class="btn btn-primary" href="UpdateEmployee.jsp?id=<%=em.getEmployeeId()%>" role="button">Update</a></td>
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