<%-- 
    Document   : EmployeeAdd
    Created on : Jun 28, 2018, 4:29:19 PM
    Author     : charm_000
--%>

<%@page import="edu.charmin.ehospital.entity.Post"%>
<%@page import="edu.charmin.ehospital.entity.Department"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.impl.AdminDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmployeeDAO"%>
<%@page import="edu.charmin.ehospital.entity.Employee"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../adminview/AdminHeader.jsp" %>

<%
    Post cus = new Post();
    PostDAO cusDao = new PostDAOImpl();
     if (request.getMethod().equals("POST")) {

        MultipartRequest m = new MultipartRequest(request, root);

        Enumeration file = m.getFileNames();
        String name = (String) file.nextElement();
        String filename = m.getFilesystemName(name);

        cus.setPostTitle((String)m.getParameter("post_title"));
        cus.setPostCategory((String)m.getParameter("post_category"));
        cus.setPostbody((String)m.getParameter("post_body"));
        cus.setPostImage(filename);
        cusDao.insert(cus);
        response.sendRedirect("index.jsp?success=1");
    }
%>

<div class="col-md-9">
    <!-- Website Overview -->
    <div class="panel panel-default">
        <div class="panel-heading main-color-bg">
            <h3 class="panel-title"><a class="btn btn-primary" href="index.jsp" role="button">Go Back</a></h3>
        </div>
        <div class="panel-body">

            <form method="POST" action=""  enctype="multipart/form-data">
                <a href="CustomerView.jsp"></a>


                <div class="form-group" >
                    <label>Post Title</label>
                    <input type="text" name="post_title" class="form-control" >
                </div>

                <div class="form-group">
                    <label for="post_category">Category</label>
                    <select class="form-control" id="post_category" name="post_category">
                        <option value="News">News</option>
                        <option value="Event">Event</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Body</label>
                    <textarea name="post_body" class="form-control" id="postBody"></textarea>
                </div>
                <div class="form-group">
                    <label>Add Feature Image</label>
                    <input type="file" name="spost_image" class="form-control" required>
                </div>



                <button type="submit" class="btn btn-primary" name="submit" value="form" onclick="">Add</button>
            </form>

        </div>
    </div>
</div>


<script>
    CKEDITOR.replace('postBody');
</script>
</section>
<%@include file="../adminview/AdminFooter.jsp" %>
