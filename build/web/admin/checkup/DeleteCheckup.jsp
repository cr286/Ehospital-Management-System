


<%@page import="edu.charmin.ehospital.daoo.impl.CheckupDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.CheckupDAO"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    CheckupDAO empDao = new CheckupDAOImpl();
    empDao.deleteById(id);
    response.sendRedirect("index.jsp");
    %>