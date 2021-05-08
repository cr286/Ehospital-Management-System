<%@page import="edu.charmin.ehospital.daoo.impl.TestDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.TestDAO"%>


<%
    int id = Integer.parseInt(request.getParameter("id"));
    TestDAO empDao = new TestDAOImpl();
    empDao.deleteById(id);
    response.sendRedirect("index.jsp");
    %>