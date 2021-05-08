<%-- 
    Document   : EmployeeAdd
    Created on : Jun 28, 2018, 4:29:19 PM
    Author     : charm_000
--%>

<%@page import="edu.charmin.ehospital.daoo.impl.EmailSubcriberDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmailSubscriberDAO"%>
<%@page import="edu.charmin.ehospital.entity.EmailSubscriber"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.impl.AdminDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmployeeDAO"%>
<%@page import="edu.charmin.ehospital.entity.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
       <%
       
            if (request.getMethod().equals("POST")) {
                EmailSubscriber em = new EmailSubscriber();
                EmailSubscriberDAO emDao = new EmailSubcriberDAOImpl();
                em.setSubscriberEmail(request.getParameter("email"));
                emDao.insert(em);
                response.sendRedirect("index.jsp?success=1");
            }
        %>
<%@include file="../adminview/AdminHeader.jsp" %>
<div class="col-md-9">
            <!-- Website Overview -->
            <div class="panel panel-default">
              <div class="panel-heading main-color-bg">
                 <h3 class="panel-title"><a class="btn btn-primary" href="SubscriberAdd.jsp" role="button">Add</a></h3>
              </div>
              <div class="panel-body">
      
            <form method="POST" action="">
                


               
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                
                <button type="submit" class="btn btn-primary" onclick="">Add</button>
            </form>
        </div>
                    </div>
              </div>
         
        
     
    </section>
  <%@include file="../adminview/AdminFooter.jsp" %>
