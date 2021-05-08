<%@ page import="com.oreilly.servlet.MultipartRequest" %>  
<%@page import="java.util.Enumeration" %>
<%  
    String root = getServletContext().getRealPath("uploads");
MultipartRequest m = new MultipartRequest(request, "d:/new");  
out.print("successfully uploaded");  
  Enumeration file = m.getFileNames();
  String name = (String)file.nextElement();
  String filename = m.getFilesystemName(name);
 session.setAttribute("filename", filename); //to set session
%> 