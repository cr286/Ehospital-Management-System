
<%@page import="edu.charmin.ehospital.entity.Department"%>
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
                <%                    int id = Integer.parseInt(request.getParameter("id"));
                    DoctorDAO emDao = new DoctorDAOImpl();
                    Doctor em = emDao.getById(id);
                    DepartmentDAO depDao = new DepartmentDAOImpl();
                    Department depp = depDao.getById(em.getDepartment_id());
                %>
                <tr>
                    <td>ID</td>
                    <td><%=em.getDoctorId()%></td>
                </tr> 
                <tr>
                    <td>Name</td>
                    <td><%=em.getDoctorFirstName()%> <%=em.getDoctorLastName()%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=em.getDoctorEmail()%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=em.getDoctorAddress()%></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><%=em.getDoctorPhone()%></td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td><%=em.getDoctorStatus()%></td>
                </tr>
                <tr>
                    <td>Post</td>
                    <td><%=em.getDoctorPost()%></td>
                </tr>
                <tr>
                    <td>Added Date</td>
                    <td><%=em.getDoctorAddedDate()%></td>
                </tr>
                <tr>
                    <td>Specification</td>
                    <td><%=em.getDoctorspecification()%></td>
                </tr>
                <tr>
                    <td>Salary</td>
                    <td><%=em.getDoctorSalary()%></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><%=em.getDoctorDescription()%></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><%=em.getDoctorGender()%></td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td><%=depp.getDepartmentName()%></td>
                </tr>
                <tr>
                    <td>Profile Image</td>
                    
                    <td><img src="../../uploads/<%=em.getDoctorImage()%>" width="40%" /></td>
                </tr>


            </table>
        </div>
         </div>
</div>


</section>
<%@include file="../adminview/AdminFooter.jsp" %>
