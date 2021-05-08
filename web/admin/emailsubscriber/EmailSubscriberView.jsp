<%@page import="edu.charmin.ehospital.daoo.impl.EmailSubcriberDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmailSubscriberDAO"%>
<%@page import="edu.charmin.ehospital.entity.EmailSubscriber"%>
<%@page import="edu.charmin.ehospital.entity.Patient"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientDAOimpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientDAO"%>

<div class="col-md-9">
    <!-- Website Overview -->
    <%if (request.getParameter("success") == null) {
         } else if (request.getParameter("success").equals("1")) {%><div class='alert alert-success' role='button' onclick="">Test Successfully added!! <button type="button" class="close" data-dismiss="alert">x</button></div>
    <%}%>
    <div class="panel panel-default">
        <div class="panel-heading main-color-bg">
            <h3 class="panel-title"><a class="btn btn-primary" href="SubscriberAdd.jsp" role="button">New Email Subscriber</a></h3>
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Date</th>
                    <th>Action</th>

                    </thead>
                    <tbody>
                        <%

                            EmailSubscriberDAO emDao = new EmailSubcriberDAOImpl();
                            for (EmailSubscriber em : emDao.getAll()) {

                        %>
                        <tr>
                            <td><%=em.getSubcriberId()%></td>
                            <td><%=em.getSubscriberEmail()%></td>
                            <td><%=em.getSubscriberDate()%></td>
                            <td><a class="btn btn-primary" href="Single.jsp?id=<%=em.getSubcriberId()%>" role="button">View</a> <a class="btn btn-danger" href="DeleteSubscriber.jsp?id=<%=em.getSubcriberId()%>" role="button">Delete</a> </td>
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