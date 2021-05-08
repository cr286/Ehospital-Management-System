
<%@page import="edu.charmin.ehospital.utility.AppointmentStatusUpdate"%>
<%@page import="edu.charmin.ehospital.entity.Test"%>
<%@page import="edu.charmin.ehospital.daoo.impl.TestDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.TestDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.CheckupDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.CheckupDAO"%>
<%@page import="edu.charmin.ehospital.entity.Checkup"%>


<%@include file="../layout/Header.jsp" %>
<section id="main">
    <div class="container">
        <div class="row">
            <%@include file="PatientProfileMenu.jsp" %>
<% TestDAO testDao = new TestDAOImpl();
 
    if (request.getMethod().equals("POST")) {
       Checkup cus = new Checkup();
        CheckupDAO cusDao = new CheckupDAOImpl();
       cus.setPatientId(app.getPatientId());
       cus.setDoctorId(id);
        cus.setCheckupReport(request.getParameter("report"));
        cus.setCheckupTest(request.getParameter("test"));
        cus.setCheckupMedicine(request.getParameter("medicine"));
        cus.setCheckupRemarks(request.getParameter("remarks"));
        cus.setAppointmentId(aid);
       cusDao.insert(cus);
       AppointmentStatusUpdate appoint = new AppointmentStatusUpdate();
       appoint.AppointStatusUpdate(2, aid);
        response.sendRedirect("Report.jsp?success=1&&aid="+aid);
    }
%>
            <div class="col-md-9">
                <!-- Website Overview -->
                <div class="panel panel-default">
                    <div class="panel-heading main-color-bg">
                        <h3 class="panel-title"> Patient Checkup</h3>
                    </div>
                    <div class="panel-body">

                        <form method="POST" action="">
                            <div class="form-group">
                                <label for="report">Report</label>
                                <textarea name="report" class="form-control" id="report" style="height: 300px; max-width:100% " placeholder=" Your Report Goes Here" required></textarea>
                            </div>
                            <label for="report">Tests Required</label>  
                            <div class="form-group">
                                <%for (Test test : testDao.getAll()) {
                                %>
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="test" value="<%=test.getTestId()%>"><%=test.getTestName()%>
                                </label>
                                <%
                                }
                                %>

                            </div>
                            <div class="form-group">
                                <label for="report">Recommended Medicine</label>
                                <textarea name="medicine" class="form-control" id="report" style="min-height: 50%; max-width:100% " placeholder="Example: Aspirin,Cetamol " ></textarea>
                            </div>

                            <div class="form-group">
                                <label for="report">Remarks</label>
                                <textarea name="remarks" class="form-control" id="report" style="min-height: 50%; max-width:100% "></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary" onclick="">Generate Report</button>
                        </form>
                    </div>
                </div>
            </div>
            </section>
            <%@include file="../layout/Footer.jsp" %>