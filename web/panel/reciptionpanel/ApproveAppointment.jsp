<%@page import="edu.charmin.ehospital.entity.Patient"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientDAOimpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="edu.charmin.ehospital.utility.Dbconn"%>
<%
    int id= Integer.parseInt(request.getParameter("id"));
   int pid= Integer.parseInt(request.getParameter("apid"));
    int approve=0;
    PatientDAO appPatientDAO = new PatientDAOimpl();
    Patient p =appPatientDAO.getById(pid);
    
    
 String sql = "UPDATE `appointment` SET `appointment_status`=? WHERE appointment_id=?";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
        
        stmt.setInt(1, approve);
        stmt.setInt(2, id);
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        String msg ="Dear "+p.getPatientFirstName()+" "+p.getPatientLastName()+", Your Appointment has been sucessfully approved. Thank You! E-Hospital. ";
        String senderEmail = "test@gmail.com";
        String mypass = "test";
        edu.charmin.ehospital.utility.SendMail.send(p.getPatientEmail(), "Patient Password Verfication",msg,senderEmail,mypass );
        response.sendRedirect("AppointmentView.jsp");
%>