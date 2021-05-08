<%@page import="edu.charmin.ehospital.daoo.impl.PostDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.PostDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DepartmentDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DepartmentDAO"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    PostDAO empDao = new PostDAOImpl();
    empDao.deleteById(id);
    response.sendRedirect("index.jsp");
    %>