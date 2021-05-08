<%-- 
    Document   : EmployeeAdd
    Created on : Jun 28, 2018, 4:29:19 PM
    Author     : charm_000
--%>

<%@page import="edu.charmin.ehospital.daoo.impl.PatientTestDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientTestDAO"%>
<%@page import="edu.charmin.ehospital.entity.PatientTest"%>
<%@page import="edu.charmin.ehospital.entity.Test"%>
<%@page import="edu.charmin.ehospital.entity.Appointment"%>
<%@page import="edu.charmin.ehospital.entity.Doctor"%>
<%@page import="edu.charmin.ehospital.entity.Patient"%>
<%@page import="edu.charmin.ehospital.entity.Post"%>
<%@page import="edu.charmin.ehospital.entity.Department"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.impl.AdminDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmployeeDAO"%>
<%@page import="edu.charmin.ehospital.entity.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../adminview/AdminHeader.jsp" %>
<%    PatientDAO patDao = new PatientDAOimpl();
PatientTest cus = new PatientTest();
        PatientTestDAO cusDao = new PatientTestDAOImpl();
    
    if (request.getMethod().equals("POST")) {
        
        MultipartRequest m = new MultipartRequest(request, root);
        Enumeration file = m.getFileNames();
        String name = (String) file.nextElement();
        String image = m.getFilesystemName(name);
        
        
        cus.setPatientId(Integer.parseInt(m.getParameter("patient_id")));
        cus.setTestId(Integer.parseInt(m.getParameter("test")));
        cus.setDoctorId(Integer.parseInt(m.getParameter("doctor_id")));
        cus.setTestBody(m.getParameter("report"));
        cus.setReportImage(image);
        cus.setStatus(0);
       
        cusDao.insert(cus);
        response.sendRedirect("index.jsp?success=1");
    }
%>

<div class="col-md-9">
    <!-- Website Overview -->
    <div class="panel panel-default">
        <div class="panel-heading main-color-bg">
            <h3 class="panel-title"><a class="btn btn-primary" href="index.jsp" role="button">Go Back</a></h3>
        </div>
        <div class="panel-body">

            <form method="POST" action="" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="post_category">Patient</label>
                    <select class="form-control" id="post_category" name="patient_id">
                        <% for (Patient patient : patDao.getAll()) {
                        %>

                        <option value="<%=patient.getPatientId()%>"><%=patient.getPatientFirstName()%> <%=patient.getPatientLastName()%></option>
                        <%
                            }%>
                    </select>
                </div>

                <div class="form-group">
                    <label for="doctor_id">Doctor</label>
                    <select class="form-control" name="doctor_id">
                        <% for (Doctor doct : doc.getAll()) {
                        %>

                        <option value="<%=doct.getDoctorId()%>"><%=doct.getDoctorFirstName()%> <%=doct.getDoctorLastName()%></option>
                        <%
                            }%>
                    </select>
                </div>
                <label for="doctor_id">Tests</label>
                <div class="form-group">
                    <%  int i=0;
                        for (Test test : tes.getAll()) {
                        
                    %>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="test" value="<%=test.getTestId()%>" <%if(i==0){%>checked<%}%>><%=test.getTestName()%>
                    </label>
                    <%
                      i++;  }
                    %>
                </div>
                <div class="form-group">
                    <label for="report">Report</label>
                    <textarea name="report" class="form-control" id="report" style="height: 300px; max-width:100% " placeholder=" Your Report Goes Here" required></textarea>
                </div>
                
                <div class="form-group">
                    <label>Add Report Image</label>
                    <input type="file" name="report_image" class="form-control" required>
                </div>
                
                <button type="submit" class="btn btn-primary" onclick="">Apply</button>
            </form>
        </div>
    </div>
</div>

</section>
<%@include file="../adminview/AdminFooter.jsp" %>
