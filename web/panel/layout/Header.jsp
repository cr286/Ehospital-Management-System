<%-- 
    Document   : AdminHeader
    Created on : Jun 28, 2018, 3:14:56 PM
    Author     : charm_000
--%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>  
<%@page import="java.util.Enumeration" %>
<%
   
     String root = "E:/My JAVA Projects/Ehospital/build/web/uploads/";
    String title="";
    Integer id = (Integer) session.getAttribute("id");
    String panel = (String) session.getAttribute("panel");
    if (id == null||panel == null) {
        response.sendRedirect("../");
    }else if(panel.equals("doctor")){
         
        title="Doctor";
    }else if(panel.equals("account")){
         
        title="Account";
    }else  if(panel.equals("receptionist")){
      
        title="Reception";
    }
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><%=title%> Panel | Dashboard</title>
        <!-- Bootstrap core CSS -->
        <link href="../../admin/css/bootstrap.min.css" rel="stylesheet">
        <link href="../../admin/css/style.css" rel="stylesheet">
        <link href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
        <script src="http://cdn.ckeditor.com/4.6.1/standard/ckeditor.js"></script>
    </head>
    <body>

        <nav class="navbar navbar-default">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"  aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp"><%=title%> Panel</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">

                        <li><a href="index.jsp">Dashboard</a></li>
                        <!-- <li <?php if(url == 'order.php') echo "class='active'"; ?>><a href="order.php">Orders</a></li>
                         <li <?php if(url == 'page.php') echo "class='active'"; ?>><a href="page.php">Pages</a></li>
                         <li <?php if(url == 'publication.php') echo "class='active'"; ?>><a href="publication.php">Publication</a></li>
                         <li <?php if(url == 'users.php') echo "class='active'"; ?>><a href="users.php">User</a></li>
                         <li <?php if(url == 'gallery.php') echo "class='active'"; ?>><a href="gallery.php">Gallery</a></li>
                          <li <?php if(url == 'banner.php') echo "class='active'"; ?>><a href="banner.php">Banner</a></li>
                          <li <?php if($url == 'room.php') echo "class='active'"; ?>><a href="room.php">Room</a></li>-->
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Welcome, <%=title%></a></li>
                        <li><a href="../Logout.jsp">Logout</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>
        <header id="header">
            <div class="container">
                <div class="row">
                    <div class="col-md-10">
                        <h1><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Dashboard <small>Manage </small></h1>
                    </div>
                    <div class="col-md-2">

                    </div>
                </div>
        </header>

<!--        <section id="breadcrumb">
            <div class="container">
                <ol class="breadcrumb">
                    <li class="active">Dashboard</li>
                </ol>
            </div>
        </section>-->

