<%@page import="edu.charmin.ehospital.daoo.impl.EmailSubcriberDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmailSubscriberDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmployeeDAO"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    EmailSubscriberDAO empDao = new EmailSubcriberDAOImpl();
    empDao.deleteById(id);
    response.sendRedirect("index.jsp");
    %>