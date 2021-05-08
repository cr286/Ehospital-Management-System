<%@page import="edu.charmin.ehospital.entity.Post"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PostDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.PostDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DepartmentDAOImpl"%>
<%@page import="edu.charmin.ehospital.entity.Department"%>
<%@page import="edu.charmin.ehospital.daoo.DepartmentDAO"%>


<div class="col-md-9">
    <!-- Website Overview -->
    <%if (request.getParameter("success") == null) {
                 } else if (request.getParameter("success").equals("1")) {%><div class='alert alert-success' role='button' onclick="">Post Successfully added!! <button type="button" class="close" data-dismiss="alert">x</button></div>
    <%}%>
    <div class="panel panel-default">
        <div class="panel-heading main-color-bg">
            <h3 class="panel-title"><a class="btn btn-primary" href="PostAdd.jsp" role="button">New Post</a></h3>
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Category</th>
                    <th>Body</th>
                    <th>Action</th> 
                    </thead>
                    <tbody>
                        <%

                            PostDAO emDao = new PostDAOImpl();
                            for (Post em : emDao.getAll()) {
                        %>
                        <tr>
                            <td><%=em.getPostId()%></td>
                            <td><%=em.getPostTitle()%></td>
                            <td><%=em.getPostCategory()%></td>
                            <td><p><%=em.getPostbody()%></p></td>


                            <td><a class="btn btn-primary" href="Single.jsp?id=<%=em.getPostId()%>" role="button">Show</a> <a class="btn btn-danger" href="DeletePost.jsp?id=<%=em.getPostId()%>" role="button">Delete</a> <a class="btn btn-primary" href="UpdateDepartment.jsp?id=<%=em.getPostId()%>" role="button">Update</a></td>
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