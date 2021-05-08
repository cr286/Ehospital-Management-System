<%@page import="edu.charmin.ehospital.daoo.impl.DoctorDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DoctorDAO"%>

<%
    try{
    int id = Integer.parseInt(request.getParameter("id"));
    DoctorDAO empDao = new DoctorDAOImpl();
    empDao.deleteById(id);
    }catch(Exception ex){
       
    }
    response.sendRedirect("index.jsp");
    %>