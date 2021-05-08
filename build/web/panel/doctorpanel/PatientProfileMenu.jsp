<%@page import="edu.charmin.ehospital.entity.Patient"%>
<%@page import="edu.charmin.ehospital.entity.Appointment"%>
<%@page import="edu.charmin.ehospital.daoo.impl.AppointmentDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.AppointmentDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientDAOimpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientDAO"%>
<div class="col-md-3">
                <div class="list-group">
                    <a href="index.jsp" class="list-group-item active main-color-bg">
                        <span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Patient's Profile
                    </a>
                        <%
                        int aid=Integer.parseInt(request.getParameter("id")); //get appointment id from post
                        AppointmentDAO appDao = new AppointmentDAOImpl();
                        Appointment app =appDao.getById(aid); //get patient id from appointment 
                        PatientDAO emDao = new PatientDAOimpl();
                        Patient pat = emDao.getById(app.getPatientId()); // get patient information from patient 
                        
                     %>
                     <a href="#" class="list-group-item">Name: <%=pat.getPatientFirstName()+' '+pat.getPatientLastName()%></a>
                    <a href="#" class="list-group-item">Age: <%=pat.getPatientDateOfBirth()%></a>
                    <a href="#" class="list-group-item">Contact: <%=pat.getPatientPhone()%></a>
                </div>
 </div>