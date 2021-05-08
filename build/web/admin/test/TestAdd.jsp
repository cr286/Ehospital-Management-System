<%-- 
    Document   : EmployeeAdd
    Created on : Jun 28, 2018, 4:29:19 PM
    Author     : charm_000
--%>

<%@page import="edu.charmin.ehospital.entity.Test"%>
<%@page import="edu.charmin.ehospital.entity.Department"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
       <%
       
            if (request.getMethod().equals("POST")) {
                Test  cus = new Test();
                TestDAO cusDao = new TestDAOImpl();
                cus.setTestName(request.getParameter("test_name"));
                cus.setTestReport(request.getParameter("test_report"));
                cus.setTestStatus(request.getParameter("test_status"));
                cusDao.insert(cus);
                 
                response.sendRedirect("index.jsp?success=1");
            }
        %>
<%@include file="../adminview/AdminHeader.jsp" %>
<div class="col-md-9">
            <!-- Website Overview -->
            <div class="panel panel-default">
              <div class="panel-heading main-color-bg">
                 <h3 class="panel-title"><a class="btn btn-primary" href="index.jsp" role="button">Go Back</a></h3>
              </div>
              <div class="panel-body">
      
            <form method="POST" action="">
                <a href="CustomerView.jsp"></a>


                <div class="form-group">
                    <label>Test Name</label>
                    <input type="text" name="test_name" class="form-control">
                </div>
                <div class="form-group">
                    <label>Report</label>
                    <input type="text" name="test_report" class="form-control">
                </div>
               
                <div class="form-group">
                    <label>Status</label>
                    <input type="text" name="test_status" class="form-control">
                </div>
                
                <button type="submit" class="btn btn-primary" onclick="">Add</button>
            </form>
        </div>
                    </div>
              </div>
         
        
     
    </section>
  <%@include file="../adminview/AdminFooter.jsp" %>
