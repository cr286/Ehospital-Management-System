



<%@page import="edu.charmin.ehospital.daoo.impl.PatientTestDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientTestDAO"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    PatientTestDAO empDao = new PatientTestDAOImpl();
    empDao.deleteById(id);
    response.sendRedirect("index.jsp");
    %>