<%@page import="java.sql.PreparedStatement"%>
<%@page import="edu.charmin.ehospital.utility.Dbconn"%>
<%
    int id= Integer.parseInt(request.getParameter("id"));
    int status=Integer.parseInt(request.getParameter("status"));
    int pay=1;
    if(status==1){
        pay=0;
    }
 String sql = "UPDATE `appointment` SET `appointment_status`=? WHERE appointment_id=?";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
        
        stmt.setInt(1, pay);
        stmt.setInt(2, id);
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        response.sendRedirect("AppointmentView.jsp?success=1&&caid="+id);
%>