<%@page import="edu.charmin.ehospital.entity.Test"%>
<%@page import="edu.charmin.ehospital.daoo.impl.TestDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.TestDAO"%>



<div class="col-md-9">
    <!-- Website Overview -->
    <%if (request.getParameter("success") == null) {
                } else if (request.getParameter("success").equals("1")) {%><div class='alert alert-success' role='button' onclick="">Test Successfully added!! <button type="button" class="close" data-dismiss="alert">x</button></div>
    <%}%>
    <div class="panel panel-default">
        <div class="panel-heading main-color-bg">
            <h3 class="panel-title"><a class="btn btn-primary" href="TestAdd.jsp" role="button">New Test</a></h3>
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Action</th> 
                    </thead>
                    <tbody>
                        <%
                            TestDAO emDao = new TestDAOImpl();
                            for (Test em : emDao.getAll()) {
                        %>
                        <tr>
                            <td><%=em.getTestId()%></td>
                            <td><%=em.getTestName()%></td>
                            <td><%=em.getTestReport()%></td>
                            <td><%=em.getTestStatus()%></td>

                            <td><a class="btn btn-danger" href="DeleteTest.jsp?id=<%=em.getTestId()%>" role="button">Delete</a> <a class="btn btn-primary" href="UpdateTest.jsp?id=<%=em.getTestId()%>" role="button">Update</a></td>
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