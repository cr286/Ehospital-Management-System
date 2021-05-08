
<%@page import="edu.charmin.ehospital.entity.Post"%>
<%@page import="edu.charmin.ehospital.entity.Doctor"%>

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
                  PostDAO emDao = new PostDAOImpl();
                   Post em =emDao.getById(id);
                     %>
                <tr>
                    <td>ID</td>
                    <td><%=em.getPostId()%></td>
                </tr> 
                <tr>
                    <td>Title</td>
                    <td><%=em.getPostTitle()%></td>
                </tr>
                <tr>
                    <td>Category</td>
                   <td><%=em.getPostCategory()%></td>
                </tr>
                <tr>
                    <td>Body</td>
                    <td><p style="max-width: 200px;"><%=em.getPostbody()%></p></td>
                </tr>
                 <tr>
                    <td>Feature Image</td>
                    <td><img src="../../uploads/<%=em.getPostImage()%>" width="40%" /></td>
                </tr>
            
            </table>
        </div>
    </div>
</div>


</section>
<%@include file="../adminview/AdminFooter.jsp" %>
