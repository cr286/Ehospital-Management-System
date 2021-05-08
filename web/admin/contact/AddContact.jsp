<%-- 
    Document   : EmployeeAdd
    Created on : Jun 28, 2018, 4:29:19 PM
    Author     : charm_000
--%>

<%@page import="edu.charmin.ehospital.daoo.impl.ContactDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.ContactDAO"%>
<%@page import="edu.charmin.ehospital.entity.Contact"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.impl.AdminDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmployeeDAO"%>
<%@page import="edu.charmin.ehospital.entity.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
       <%
       
            if (request.getMethod().equals("POST")) {
                Contact cus = new Contact();
                ContactDAO cusDao = new ContactDAOImpl();
                cus.setContactName(request.getParameter("name"));
                cus.setContactSubject(request.getParameter("subject"));
                cus.setContactEmail(request.getParameter("email"));
                cus.setContactMessage(request.getParameter("message"));
         
                cusDao.insert(cus);
                response.sendRedirect("index.jsp?success=1");
            }
        %>
<%@include file="../adminview/AdminHeader.jsp" %>
<div class="col-md-9">
            <!-- Website Overview -->
            <div class="panel panel-default">
              <div class="panel-heading main-color-bg">
                 <h3 class="panel-title"><a class="btn btn-primary" href="AddContact.jsp" role="button">Add</a></h3>
              </div>
              <div class="panel-body">
      
            <form method="POST" action="">

                <div class="form-group">
                    <label>Name</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Subject</label>
                    <input type="text" name="subject" class="form-control" required>
                </div>
               
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Message</label>
                    <textarea class="form-control" name="message" required></textarea>
                </div>
                 
             
               
                <button type="submit" class="btn btn-primary" onclick="" >Add</button>
            </form>
        </div>
                    </div>
              </div>
         
        
     
    </section>
  <%@include file="../adminview/AdminFooter.jsp" %>
