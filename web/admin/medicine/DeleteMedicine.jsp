


<%@page import="edu.charmin.ehospital.daoo.impl.MedicineDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.MedicineDAO"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    MedicineDAO empDao = new MedicineDAOImpl();
    empDao.deleteById(id);
    response.sendRedirect("index.jsp");
    %>