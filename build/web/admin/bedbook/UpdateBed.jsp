<%-- 
    Document   : EmployeeAdd
    Created on : Jun 28, 2018, 4:29:19 PM
    Author     : charm_000
--%>

<%@page import="edu.charmin.ehospital.daoo.impl.HospitalBedDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.HospitalBedDAO"%>
<%@page import="edu.charmin.ehospital.entity.HospitalBed"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientDAOimpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientDAO"%>
<%@page import="edu.charmin.ehospital.entity.Patient"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
       <%
           int hbid = Integer.parseInt(request.getParameter("id"));
       HospitalBed cus = new HospitalBed();
       HospitalBedDAO cusDao = new HospitalBedDAOImpl();
       cus = cusDao.getById(hbid);
            if (request.getMethod().equals("POST")) {
                
                cus.setBedNo(Integer.parseInt(request.getParameter("bed_no")));
                 cus.setBedFloor(Integer.parseInt(request.getParameter("bed_floor")));
                 cus.setBedType(request.getParameter("bed_type"));
                 cus.setBedPrice(Double.parseDouble(request.getParameter("bed_price")));
                 cus.setBedStatus(0);
                cusDao.update(cus,hbid);
                response.sendRedirect("index.jsp?success=2");
            }
        %>
<%@include file="../adminview/AdminHeader.jsp" %>
<div class="col-md-9">
            <!-- Website Overview -->
            <div class="panel panel-default">
              <div class="panel-heading main-color-bg">
                 <h3 class="panel-title"><a class="btn btn-primary" href="BedAdd.jsp" role="button">Add Beds</a></h3>
              </div>
              <div class="panel-body">
      
            <form method="POST" action="">
                <div class="form-group">
                    <label>Bed No</label>
                    <input type="number" name="bed_no" class="form-control" required value="<%=cus.getBedNo()%>">
                </div>
                <div class="form-group">
                    <label>Bed Floor</label>
                    <input type="number" name="bed_floor" class="form-control" required value="<%=cus.getBedFloor()%>">
                </div>
               
                <div class="form-group">
                    <label>Type</label>
                    <input type="text" name="bed_type" class="form-control" required value="<%=cus.getBedType()%>">  
                </div>
                 <div class="form-group">
                    <label>Price</label>
                    <input type="number" name="bed_price" class="form-control" required value="<%=cus.getBedPrice()%>">  
                </div>
              
                 
                <button type="submit" class="btn btn-primary" onclick="">Update</button>
            </form>
        </div>
                    </div>
              </div>
         
        
     
    </section>
  <%@include file="../adminview/AdminFooter.jsp" %>
