<%@page import="edu.charmin.ehospital.daoo.impl.DepartmentDAOImpl"%>
<%@page import="edu.charmin.ehospital.entity.Department"%>
<%@page import="edu.charmin.ehospital.daoo.DepartmentDAO"%>


<div class="col-md-9">
    <!-- Website Overview -->
    <%if (request.getParameter("success") == null) {
                 } else if (request.getParameter("success").equals("1")) {%><div class='alert alert-success' role='button' onclick="">Test Successfully added!! <button type="button" class="close" data-dismiss="alert">x</button></div>
    <%}%>
    <div class="panel panel-default">
        <div class="panel-heading main-color-bg">
            <h3 class="panel-title"><a class="btn btn-primary" href="DepartmentAdd.jsp" role="button">New Department</a></h3>
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-hover" id="table">
                    <thead>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Action</th> 
                    </thead>
                    <tbody>
                        <%

                            DepartmentDAO emDao = new DepartmentDAOImpl();
                            for (Department em : emDao.getAll()) {
                        %>
                        <tr>
                            <td><%=em.getDepartmentId()%></td>
                            <td><%=em.getDepartmentName()%></td>
                            <td><%=em.getDepartmentDescription()%></td>
                            <td><%=em.getDepartmentStatus()%></td>

                            <td><a class="btn btn-danger" href="DeleteDepartment.jsp?id=<%=em.getDepartmentId()%>" role="button">Delete</a> <a class="btn btn-primary" href="UpdateDepartment.jsp?id=<%=em.getDepartmentId()%>" role="button">Update</a></td>
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