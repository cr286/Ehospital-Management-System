<%@page import="edu.charmin.ehospital.daoo.impl.DepartmentDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DepartmentDAO"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    DepartmentDAO empDao = new DepartmentDAOImpl();
    empDao.deleteById(id);
    response.sendRedirect("index.jsp");
    %>