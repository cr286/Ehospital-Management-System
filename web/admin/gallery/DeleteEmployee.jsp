<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmployeeDAO"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    EmployeeDAO empDao = new EmployeeDAOImpl();
    empDao.deleteById(id);
    response.sendRedirect("index.jsp");
    %>