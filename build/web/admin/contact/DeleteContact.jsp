<%@page import="edu.charmin.ehospital.daoo.impl.ContactDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.ContactDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmployeeDAO"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    ContactDAO empDao = new ContactDAOImpl();
    empDao.deleteById(id);
    response.sendRedirect("index.jsp");
    %>