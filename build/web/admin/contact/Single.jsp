
<%@page import="edu.charmin.ehospital.entity.Contact"%>
<%@page import="edu.charmin.ehospital.daoo.impl.ContactDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.ContactDAO"%>

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
                    ContactDAO emDao = new ContactDAOImpl();
                    Contact em = emDao.getById(id);
                %>
                <tr>
                    <td>ID</td>
                    <td><%=em.getContactId()%></td>
                </tr> 
                <tr>
                    <td>Name</td>
                    <td><%=em.getContactName()%> </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=em.getContactEmail()%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=em.getContactSubject()%></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><%=em.getContactMessage()%></td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td><%=em.getContactAddedDate()%></td>
                </tr>
               

            </table>
        </div>
    </div>
</div>


</section>
<%@include file="../adminview/AdminFooter.jsp" %>
