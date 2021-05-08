<%@page import="edu.charmin.ehospital.daoo.impl.PatientDAOimpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmployeeDAO"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    PatientDAO empDao = new PatientDAOimpl();
    empDao.deleteById(id);
    response.sendRedirect("index.jsp");
    %>