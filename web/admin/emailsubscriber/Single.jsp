
<%@page import="edu.charmin.ehospital.daoo.EmailSubscriberDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmailSubcriberDAOImpl"%>
<%@page import="edu.charmin.ehospital.entity.EmailSubscriber"%>

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
                    EmailSubscriberDAO emDao = new EmailSubcriberDAOImpl();
                    EmailSubscriber em = emDao.getById(id);
                %>
                <tr>
                    <td>ID</td>
                    <td><%=em.getSubcriberId()%></td>
                </tr> 
                <tr>
                    <td>Email</td>
                    <td><%=em.getSubscriberEmail()%></td>
                </tr>
                <tr>
                    <td>Date</td>
                    <td><%=em.getSubscriberDate()%></td>
                </tr>
               
            </table>
        </div>
    </div>
</div>


</section>
<%@include file="../adminview/AdminFooter.jsp" %>
