<%-- 
    Document   : AdminHeader
    Created on : Jun 28, 2018, 3:14:56 PM
    Author     : charm_000
--%>
<% String title = "";
    Integer id = (Integer) session.getAttribute("pid");
    if (id == null) {
        response.sendRedirect("../");
    } else { title = "Patient";    }%>
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



