<%-- 
    Document   : EmployeeAdd
    Created on : Jun 28, 2018, 4:29:19 PM
    Author     : charm_000
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
       <%
       int medid = Integer.parseInt(request.getParameter("id"));
       Medicine  cus = new Medicine();
       MedicineDAO cusDao = new MedicineDAOImpl();
       
       cus = cusDao.getById(medid);
            if (request.getMethod().equals("POST")) {
                
                cus.setMedicineName(request.getParameter("medicine_name"));
                cus.setMedicineDescription(request.getParameter("medicine_description"));
                cus.setMedicinePurpose(request.getParameter("medicine_purpose"));

                cus.setMedicineStatus(Integer.parseInt(request.getParameter("medicine_status")));
                cusDao.update(cus,medid);
                response.sendRedirect("index.jsp?success=2");
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
                


                <div class="form-group">
                    <label>Medicine Name</label>
                    <input type="text" name="medicine_name" class="form-control" required value="<%=cus.getMedicineName()%>">
                </div>
                <div class="form-group">
                    <label>Medicine Description</label>
                    <input type="text" name="medicine_description" class="form-control" required value="<%=cus.getMedicineDescription()%>">
                </div>
                <div class="form-group">
                    <label>Medicine Purpose</label>
                    <input type="text" name="medicine_purpose" class="form-control" required value="<%=cus.getMedicinePurpose()%>">
                </div>
               
                <div class="form-group">
                    <label>Status</label>
                    <input type="number" name="medicine_status" class="form-control" required value="<%=cus.getMedicineStatus()%>">
                    
                </div>
                
                <button type="submit" class="btn btn-primary" onclick="">Update</button>
            </form>
        </div>
                    </div>
              </div>
         
        
     
    </section>
  <%@include file="../adminview/AdminFooter.jsp" %>
