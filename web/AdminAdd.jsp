<%-- 
    Document   : AdminAdd
    Created on : Jun 28, 2018, 11:57:18 AM
    Author     : charm_000
--%>





<%@page import="edu.charmin.ehospital.daoo.impl.AdminDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.AdminDAO"%>
<%@page import="edu.charmin.ehospital.entity.Admin"%>
<%
       
            if (request.getMethod().equals("POST")) {
                Admin cus = new Admin();
                AdminDAO cusDao = new AdminDAOImpl();
                cus.setAdminFirstName(request.getParameter("admin_first_name"));
                cus.setAdminLastName(request.getParameter("admin_last_name"));
                cus.setAdminEmail(request.getParameter("admin_email"));
                cus.setAdminPhone(request.getParameter("admin_phone"));
                cus.setAdminAddress(request.getParameter("admin_address"));
                cus.setAdminUsername(request.getParameter("admin_username"));
                String passEn = request.getParameter("admin_password");
                cus.setAdminImage("geas");
                cus.setAdminPassword(passEn);
                cusDao.insert(cus);
                response.sendRedirect("index.jsp");
            }
        %>
        <div class="container" style="padding:80px; margin:10px;">
            <form method="POST" action="">
                <a href="CustomerView.jsp"></a>


                <div class="form-group">
                    <label>First Name</label>
                    <input type="text" name="admin_first_name" class="form-control">
                </div>
                <div class="form-group">
                    <label>Last Name</label>
                    <input type="text" name="admin_last_name" class="form-control">
                </div>
               
                <div class="form-group">
                    <label>Email</label>
                    <input type="text" name="admin_email" class="form-control">
                </div>
                <div class="form-group">
                    <label>Phone</label>
                    <input type="text" name="admin_phone" class="form-control">
                </div>
                 <div class="form-group">
                    <label>Address</label>
                    <input type="text" name="admin_address" class="form-control">
                </div>
                 <div class="form-group">
                    <label>UserName</label>
                    <input type="text" name="admin_username" class="form-control">
                </div>
                 <div class="form-group">
                    <label>Password</label>
                    <input type="text" name="admin_password" class="form-control">
                </div>
             
               
                <button type="submit" class="btn btn-primary" onclick="">Add</button>
            </form>

