<%@page import="edu.charmin.ehospital.daoo.impl.AppointmentDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.AppointmentDAO"%>


<%
    int id = Integer.parseInt(request.getParameter("id"));
    AppointmentDAO empDao = new AppointmentDAOImpl();
    empDao.deleteById(id);
    response.sendRedirect("index.jsp");
    %>