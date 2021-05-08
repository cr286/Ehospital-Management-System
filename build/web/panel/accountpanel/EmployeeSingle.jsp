
<%@page import="edu.charmin.ehospital.entity.Employee"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmployeeDAO"%>
<%@page import="edu.charmin.ehospital.entity.Doctor"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DoctorDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DoctorDAO"%>
<%@include file="../layout/Header.jsp" %>
<section id="main">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="list-group">
                    <a href="index.jsp" class="list-group-item active main-color-bg">
                        <span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Dashboard
                    </a>
                    <a href="Single.jsp" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>My Info<span class="badge"><?php echo $o;?></span></a>
                   
                </div>
            </div>
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
                    int eid = Integer.parseInt(request.getParameter("id"));
                    EmployeeDAO emDao = new EmployeeDAOImpl();
                    Employee em = emDao.getById(eid);
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
<%@include file="../layout/Footer.jsp" %>
