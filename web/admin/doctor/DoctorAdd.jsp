<%-- 
    Document   : EmployeeAdd
    Created on : Jun 28, 2018, 4:29:19 PM
    Author     : charm_000
--%>

<%@page import="edu.charmin.ehospital.entity.Department"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DoctorDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DoctorDAO"%>
<%@page import="edu.charmin.ehospital.entity.Doctor"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.impl.AdminDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmployeeDAO"%>
<%@page import="edu.charmin.ehospital.entity.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../adminview/AdminHeader.jsp" %>

<%           if (request.getMethod().equals("POST")) {
        MultipartRequest m = new MultipartRequest(request, root);

        Enumeration file = m.getFileNames();
        String name = (String) file.nextElement();
        String filename = m.getFilesystemName(name);

        Doctor cus = new Doctor();
        DoctorDAO cusDao = new DoctorDAOImpl();
        cus.setDoctorFirstName((String) m.getParameter("admin_first_name"));
        cus.setDoctorLastName((String) m.getParameter("admin_last_name"));
        cus.setDoctorEmail((String) m.getParameter("admin_email"));
        cus.setDoctorPhone((String) m.getParameter("admin_phone"));
        cus.setDoctorAddress((String) m.getParameter("admin_address"));
        cus.setDoctorUsername((String) m.getParameter("admin_phone"));
        cus.setDoctorGender("Male");
        cus.setDoctorPost("");
        cus.setDoctorDescription("asd");
        cus.setDoctorSalary(Double.parseDouble((String) m.getParameter("admin_salary")));
        cus.setDoctorStatus("true");
        cus.setDoctorPassword((String) m.getParameter("admin_phone"));
        cus.setDoctorspecification("");
        cus.setDepartment_id(Integer.parseInt((String) m.getParameter("department_id")));
        cus.setDoctorCharge(Double.parseDouble((String) m.getParameter("doctor_charge")));
        cus.setDoctorImage(filename);
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
                    <label>First Name</label>
                    <input type="text" name="admin_first_name" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Last Name</label>
                    <input type="text" name="admin_last_name" class="form-control" required>
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="admin_email" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Phone</label>
                    <input type="number" name="admin_phone" class="form-control" id="phone" required>
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <input type="text" name="admin_address" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Salary</label>
                    <input type="number" name="admin_salary" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="doctor_id">Department</label>
                    <select class="form-control" name="department_id">
                        <% for (Department doct : dep.getAll()) {
                        %>

                        <option value="<%=doct.getDepartmentId()%>"><%=doct.getDepartmentName()%></option>
                        <%
                            }%>
                    </select>
                </div>
                <div class="form-group">
                    <label>Doctor Charge</label>
                    <input type="number" name="doctor_charge" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Add Doctor Image</label>
                    <input type="file" name="profile_image" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary" onclick="checkPhone()">Add</button>
            </form>
        </div>
    </div>
</div>
<script>
    function checkPhone() {
        var phone = document.getElementById('phone');
        var len = phone.length;
        if (len !== 10) {
            alert("Length of mobile Number must be 10");
        }
    }
</script>


</section>
<%@include file="../adminview/AdminFooter.jsp" %>
