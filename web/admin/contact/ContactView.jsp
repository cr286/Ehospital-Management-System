<%@page import="edu.charmin.ehospital.daoo.impl.ContactDAOImpl"%>
<%@page import="edu.charmin.ehospital.entity.Contact"%>
<%@page import="edu.charmin.ehospital.daoo.ContactDAO"%>
<%@page import="edu.charmin.ehospital.entity.Employee"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmployeeDAO"%>
<div class="col-md-9">
    <!-- Website Overview -->
    <%if (request.getParameter("success") == null) {
         } else if (request.getParameter("success").equals("1")) {%><div class='alert alert-success' role='button' onclick="">Test Successfully added!! <button type="button" class="close" data-dismiss="alert">x</button></div>
    <%}%>
    <div class="panel panel-default">
        <div class="panel-heading main-color-bg">
            <h3 class="panel-title"><a class="btn btn-primary" href="AddContact.jsp" role="button">Add New Contact</a> <img role="button" src="../../uploads/excel.png" style="width:5%;" onclick="tableToExcel('table', 'W3C Example Table')" /></h3>
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-hover" id="table">
                    <thead>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Subject</th>
                    <th>Action</th>
                    </thead>
                    <tbody>
                        <%

                            ContactDAO emDao = new ContactDAOImpl();
                            for (Contact em : emDao.getAll()) {
                        %>
                        <tr>
                            <td><%=em.getContactId()%></td>
                            <td><%=em.getContactName()%></td>
                            <td><%=em.getContactEmail()%></td>
                            <td><%=em.getContactSubject()%></td>
                            <td><a class="btn btn-primary" href="Single.jsp?id=<%=em.getContactId()%>" role="button">View</a> <a class="btn btn-danger" href="DeleteContact.jsp?id=<%=em.getContactId()%>" role="button">Delete</a> <a class="btn btn-primary" href="UpdateContact.jsp?id=<%=em.getContactId()%>" role="button">Update</a></td>
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