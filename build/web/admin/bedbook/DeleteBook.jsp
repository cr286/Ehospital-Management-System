<%@page import="edu.charmin.ehospital.daoo.impl.BookBedDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.BookBedDAO"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    BookBedDAO empDao = new BookBedDAOImpl();
    empDao.deleteById(id);
    response.sendRedirect("index.jsp");
    %>