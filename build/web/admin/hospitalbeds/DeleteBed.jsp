
<%@page import="edu.charmin.ehospital.daoo.HospitalBedDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.HospitalBedDAOImpl"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    HospitalBedDAO empDao = new HospitalBedDAOImpl();
    empDao.deleteById(id);
    response.sendRedirect("index.jsp");
    %>