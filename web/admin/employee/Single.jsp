
<%@page import="edu.charmin.ehospital.entity.Employee"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmployeeDAO"%>
<%@page import="edu.charmin.ehospital.entity.Doctor"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DoctorDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DoctorDAO"%>
<%@include file="../adminview/AdminHeader.jsp" %>
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
                    int id = Integer.parseInt(request.getParameter("id"));
                    EmployeeDAO emDao = new EmployeeDAOImpl();
                    Employee em = emDao.getById(id);
                %>
                <tr>
                    <td>ID</td>
                    <td><%=em.getEmployeeId()%></td>
                </tr> 
                <tr>
                    <td>Name</td>
                    <td><%=em.getEmployeeFirstName()%> <%=em.getEmployeeLastName()%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=em.getEmployeeEmail()%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=em.getEmployeeAddress()%></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><%=em.getEmployeePhone()%></td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td><%=em.getEmployeeStatus()%></td>
                </tr>
                <tr>
                    <td>Post</td>
                    <td><%=em.getEmployeePost()%></td>
                </tr>
                <tr>
                    <td>Added Date</td>
                    <td><%=em.getEmployeeAddedDate()%></td>
                </tr>
                <tr>
                    <td>Salary</td>
                    <td><%=em.getEmployeeSalary()%></td>
                </tr>
              <tr>
                    <td>Status</td>
                    <td><%=em.getEmployeeStatus()%></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><%=em.getEmployeeDescription()%></td>
                </tr>
            </table>
        </div>
    </div>
</div>


</section>
<%@include file="../adminview/AdminFooter.jsp" %>
