<%@page import="edu.charmin.ehospital.entity.Employee"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmployeeDAO"%>
<div class="col-md-9">
    <!-- Website Overview -->
    <div class="panel panel-default">
        <div class="panel-heading main-color-bg">
            <h3 class="panel-title">Employee </h3>
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
                    <th>View</th>
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
                            <td><a class="btn btn-primary" href="EmployeeSingle.jsp?id=<%=em.getEmployeeId()%>" role="button">View</a> </td>
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