<%-- 
    Document   : EmployeeAdd
    Created on : Jun 28, 2018, 4:29:19 PM
    Author     : charm_000
--%>

<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="edu.charmin.ehospital.utility.RandomNameGenerator"%>
<%@page import="java.util.concurrent.ThreadLocalRandom"%>
<%@page import="edu.charmin.ehospital.utility.RandomString"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientDAOimpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientDAO"%>
<%@page import="edu.charmin.ehospital.entity.Patient"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../adminview/AdminHeader.jsp" %>

<%  
    int  patid = Integer.parseInt(request.getParameter("id"));
    Patient cus = new Patient();
    PatientDAO cusDao = new PatientDAOimpl();
    cus = cusDao.getById(patid);
    if (request.getMethod().equals("POST")) {
        RandomNameGenerator ran = new RandomNameGenerator();

        String pass = ran.randomString(6);
        MultipartRequest m = new MultipartRequest(request,root);
        

        String username = m.getParameter("admin_phone");
        String custemail = m.getParameter("admin_email");
        cus.setPatientFirstName(m.getParameter("admin_first_name"));
        cus.setPatientLastName(m.getParameter("admin_last_name"));
        cus.setPatientEmail(custemail);
        cus.setPatientPhone(username);
        cus.setPatientAddress(m.getParameter("admin_address"));
        cus.setPatientUsername(m.getParameter("admin_phone"));
        cus.setPatientGender("Male");
        cus.setPatientStatus("true");
        cus.setPatientImage(m.getParameter("patient_image"));
        cus.setPatientPassword(pass.toString());
        cusDao.insert(cus);

        

        response.sendRedirect("index.jsp?success=2");
    }
%>

<div class="col-md-9">
    <!-- Website Overview -->
    <div class="panel panel-default">
        <div class="panel-heading main-color-bg">
            <h3 class="panel-title"><a class="btn btn-primary" href="index.jsp" role="button">Go back</a></h3>
        </div>
        <div class="panel-body">

            <form method="POST" action="" enctype="multipart/form-data">



                <div class="form-group">
                    <label>First Name</label>
                    <input type="text" name="admin_first_name" class="form-control" required value="<%=cus.getPatientFirstName()%>">
                </div>
                <div class="form-group">
                    <label>Last Name</label>
                    <input type="text" name="admin_last_name" class="form-control" required value="<%=cus.getPatientLastName()%>">
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="admin_email" class="form-control" required value="<%=cus.getPatientEmail()%>">  
                </div>
                <div class="form-group">
                    <label>Phone</label>
                    <input type="number" name="admin_phone" class="form-control" required value="<%=cus.getPatientPhone()%>">
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <input type="text" name="admin_address" class="form-control" required value="<%=cus.getPatientAddress()%>">
                </div>
                
                <div class="form-group">
                    <label>Date Of Birth</label>
                    <input type="date" name="admin_dob" class="form-control" required value="<%=cus.getPatientDateOfBirth()%>">
                </div>
                <input type="hidden" name="profile_image" class="form-control" required value="<%=cus.getPatientImage()%>">
<!--                <div class="form-group">
                    <label>Patient's Profile Image</label>
                    <input type="file" name="profile_image" class="form-control" required value="<%=cus.getPatientImage()%>">
                </div>-->
                <button type="submit" class="btn btn-primary" onclick="">Update</button>
            </form>
        </div>
    </div>
</div>



</section>
<%@include file="../adminview/AdminFooter.jsp" %>
