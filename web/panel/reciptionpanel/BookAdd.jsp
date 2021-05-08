<%-- 
    Document   : EmployeeAdd
    Created on : Jun 28, 2018, 4:29:19 PM
    Author     : charm_000
--%>

<%@page import="edu.charmin.ehospital.daoo.impl.PatientDAOimpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.HospitalBedDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.HospitalBedDAO"%>
<%@page import="edu.charmin.ehospital.utility.UpdateBedStatus"%>
<%@page import="edu.charmin.ehospital.entity.HospitalBed"%>
<%@page import="edu.charmin.ehospital.entity.Patient"%>
<%@page import="edu.charmin.ehospital.daoo.impl.BookBedDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.BookBedDAO"%>
<%@page import="edu.charmin.ehospital.entity.BookBed"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
       <%
            HospitalBedDAO hosBed = new HospitalBedDAOImpl();
            PatientDAO pat = new PatientDAOimpl();
            if (request.getMethod().equals("POST")) {
                int bedId =Integer.parseInt(request.getParameter("bed_id"));
                BookBed cus = new BookBed();
                BookBedDAO cusDao = new BookBedDAOImpl();
                 cus.setPatientId(Integer.parseInt(request.getParameter("patient_id")));
                cus.setBedId(bedId);
                 cus.setBookStatus(1);
                cusDao.insert(cus);
                UpdateBedStatus status= new UpdateBedStatus();
                status.BedStatusUpdate(1, bedId);
                response.sendRedirect("BookView.jsp?success=1");
            }
        %>
<%@include file="../layout/Header.jsp" %>
<section id="main">
    <div class="container">
        <div class="row">
            <%@include file="menus.jsp" %>
<div class="col-md-9">
            <!-- Website Overview -->
            <div class="panel panel-default">
              <div class="panel-heading main-color-bg">
                 <h3 class="panel-title"><a class="btn btn-primary" href="BookView.jsp" role="button">Go Back</a></h3>
              </div>
              <div class="panel-body">
      
            <form method="POST" action="">
             

                 <div class="form-group">
                    <label for="post_category">Patient</label>
                    <select class="form-control" id="post_category" name="patient_id" required>
                        <% for(Patient patient:pat.getAll() ){
                            
                          %>
                        
                          <option value="<%=patient.getPatientId()%>"><%=patient.getPatientFirstName()%> <%=patient.getPatientLastName()%></option>
                        <%  
                        }%>
                    </select>
                </div>
                     <div class="form-group">
                   <label>Bed Number</label>
                    <select class="form-control" id="post_category" name="bed_id" required>
                        <% for(HospitalBed patient:hosBed.getAll() ){
                            if(patient.getBedStatus()==0){
                          %>
                        
                          <option value="<%=patient.getBedId()%>"><%=patient.getBedNo()%> <%=patient.getBedType()%></option>
                        <%  
                            }}%>
                    </select>
                </div>
               
               
               
                <div class="form-group">
                    <label>Join Date</label>
                    <input type="date" name="join_date" class="form-control" >
                </div>
                
                <button type="submit" class="btn btn-primary" onclick="">Add</button>
            </form>
        </div>
                    </div>
              </div>
         
        
     
    </section>
    <%@include file="../layout/Footer.jsp" %>
