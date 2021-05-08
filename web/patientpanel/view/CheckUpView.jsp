<%@page import="edu.charmin.ehospital.entity.Doctor"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DoctorDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DoctorDAO"%>
<%@page import="edu.charmin.ehospital.entity.Checkup"%>
<%@page import="edu.charmin.ehospital.daoo.impl.CheckupDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.CheckupDAO"%>
<%@include file="Header.jsp" %>
<%@include file="menu.jsp" %>
<div class="col-md-9">
    <!-- Website Overview -->
    <div class="panel panel-default">
        <div class="panel-heading main-color-bg">
            <h3 class="panel-title">My CheckUp Reports</h3>
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                    <th>ID</th>
                    <th>Checked By</th>
                    <th>Action</th>
                    </thead>
                    <tbody>
                        <%                           DoctorDAO docDao = new DoctorDAOImpl();
                            CheckupDAO emDao = new CheckupDAOImpl();
                            for (Checkup em : emDao.getAll()) {
                                if (em.getPatientId() == id) {
                                    Doctor doc = docDao.getById(em.getDoctorId());
                        %>
                        <tr>
                            <td><%=em.getCheckupId()%></td>

                            <td><%=doc.getDoctorFirstName()%> <%=doc.getDoctorLastName()%></td>

                            <td><a class="btn btn-primary" href="CheckUpSingle.jsp?cid=<%=em.getCheckupId()%>" role="button">View</a> </td>
                        </tr>     

                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


</section>

<%@include file="Footer.jsp" %>