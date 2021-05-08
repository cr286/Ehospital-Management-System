
<%@page import="java.sql.PreparedStatement"%>
<%@page import="edu.charmin.ehospital.utility.Dbconn"%>
<%@include file="../layout/Header.jsp" %>
<%    int ptid = Integer.parseInt(request.getParameter("id"));
    if (request.getMethod().equals("POST")) {

        MultipartRequest m = new MultipartRequest(request, root);
        Enumeration file = m.getFileNames();
        String name = (String) file.nextElement();
        String image = m.getFilesystemName(name);

        String report = (String) m.getParameter("report");

        String sql = "UPDATE `patient_test` SET test_body=?,`status`=?,`report_image`=? WHERE patient_test_id=?";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);

        stmt.setString(1, report);
        stmt.setInt(2, 2);
        stmt.setString(3, image);
        stmt.setInt(4, ptid);
       
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        response.sendRedirect("Report.jsp?id=" + ptid);
    }
%>

<section id="main">
    <div class="container">
        <div class="row">
            <%@include file="menus.jsp" %>
            <div class="col-md-9">
                <!-- Website Overview -->
                <div class="panel panel-default">
                    <div class="panel-heading main-color-bg">
                        <h3 class="panel-title"><a class="btn btn-primary" href="index.jsp" role="button">Go Back</a></h3>
                    </div>
                    <div class="panel-body">

                        <form method="POST" action="" enctype="multipart/form-data">
                            
                            <div class="form-group">
                                <label for="report">Report</label>
                                <textarea name="report" class="form-control" id="report" style="height: 300px; max-width:100% " placeholder=" Your Report Goes Here" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Add Report Image</label>
                                <input type="file" name="report_image" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Generate Report</button>
                        </form>
                    </div>
                </div>
            </div>
            </section>
            <%@include file="../layout/Footer.jsp" %>
