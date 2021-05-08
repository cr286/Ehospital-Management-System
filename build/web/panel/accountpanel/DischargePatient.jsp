<%@page import="edu.charmin.ehospital.utility.UpdateBedStatus"%>
<%
      int bookId= Integer.parseInt(request.getParameter("bookid"));
    int bedId= Integer.parseInt(request.getParameter("id"));
    UpdateBedStatus.DischargePatient(bedId,bookId);
     response.sendRedirect("BookView.jsp?success=1&&caid="+bookId);
%>