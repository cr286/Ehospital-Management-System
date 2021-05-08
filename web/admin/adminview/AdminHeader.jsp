<%-- 
    Document   : AdminHeader
    Created on : Jun 28, 2018, 3:14:56 PM
    Author     : charm_000
--%>
<%@page import="edu.charmin.ehospital.daoo.PatientTestDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientTestDAOImpl"%>

<%@page import="edu.charmin.ehospital.daoo.impl.MedicineDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.MedicineDAO"%>
<%@page import="edu.charmin.ehospital.entity.Medicine"%>
<%@page import="edu.charmin.ehospital.daoo.impl.BookBedDAOImpl"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>  
<%@page import="java.util.Enumeration" %>
<%@page import="edu.charmin.ehospital.daoo.impl.CheckupDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.CheckupDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.HospitalBedDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.HospitalBedDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.AppointmentDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.AppointmentDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PostDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.PostDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.TestDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.TestDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DepartmentDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DepartmentDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DoctorDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DoctorDAO"%>
<%@page import="edu.charmin.ehospital.daoo.EmailSubscriberDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmailSubcriberDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.impl.ContactDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.ContactDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.PatientDAOimpl"%>
<%@page import="edu.charmin.ehospital.daoo.PatientDAO"%>
<%@page import="edu.charmin.ehospital.daoo.impl.EmployeeDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.EmployeeDAO"%>
<%
    //  String root = getServletContext().getContextPath();
    String root = "E:/My JAVA Projects/Ehospital/build/web/uploads/";
    Integer aid = (Integer) session.getAttribute("aid");
    if (aid == null) {
        response.sendRedirect("../");
    }
    BookBedDAOImpl book = new BookBedDAOImpl();
    CheckupDAO chec = new CheckupDAOImpl();
    HospitalBedDAO hosBed = new HospitalBedDAOImpl();
    AppointmentDAO app = new AppointmentDAOImpl();
    EmployeeDAO emp = new EmployeeDAOImpl();
    PatientDAO pat = new PatientDAOimpl();
    ContactDAO con = new ContactDAOImpl();
    EmailSubscriberDAO email = new EmailSubcriberDAOImpl();
    DoctorDAO doc = new DoctorDAOImpl();
    DepartmentDAO dep = new DepartmentDAOImpl();
    TestDAO tes = new TestDAOImpl();
    PostDAO pos = new PostDAOImpl();
    MedicineDAO med = new MedicineDAOImpl();
    PatientTestDAO pattest = new PatientTestDAOImpl();
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Admin Panel | Dashboard</title>
        <!-- Bootstrap core CSS -->

        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
        <link href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
                    <a class="navbar-brand" href="../adminview/AdminView.jsp">Admin Panel</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">

                        <li><a href="../adminview/AdminView.jsp">Dashboard</a></li>

                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Welcome, Admin</a></li>
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

        <section id="breadcrumb">
            <div class="container">
                <ol class="breadcrumb">
                    <li class="active">Dashboard</li>
                </ol>
            </div>
        </section>

        <section id="main">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="list-group">
                            <a class="list-group-item active main-color-bg"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Profile <i id="a1" class="fa fa-caret-down" role="button"></i></a>
                            <div class="list-group" id="1">
                                <a href="../employee/" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Employee <span class="badge"><%=emp.count()%></span></a>
                                <a href="../doctor/" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Doctors <span class="badge"><%=doc.count()%></span></a>
                                <a href="../patient/" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Patients <span class="badge"><%=pat.count()%></span></a>
                            </div>
                            <a  class="list-group-item active main-color-bg"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Tests and Checkup <i id="a2" class="fa fa-caret-down" role="button" onclick="close();"></i></a>
                            <div class="list-group" id="2">
                                <a href="../department/" class="list-group-item"><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> Department <span class="badge"><%=dep.count()%></span></a>
                                <a href="../test/" class="list-group-item"><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> Test <span class="badge"><%=tes.count()%></span></a>
                                <a href="../appointment/" class="list-group-item"><span class="glyphicon glyphicon-camera" aria-hidden="true"></span> Appointments <span class="badge"><%=app.count()%></span></a>
                                <a href="../patienttest/" class="list-group-item"><span class="glyphicon glyphicon-record" aria-hidden="true"></span> Patient Test <span class="badge"><%=pattest.count()%></span></a>
                                <a href="../checkup/" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Checkup <span class="badge"><%=chec.count()%></span></a>
                                <a href="../medicine/" class="list-group-item"><span class="glyphicon glyphicon-film" aria-hidden="true"></span> Medicine List <span class="badge"><%=pos.count()%></span></a>
                            </div>
                            <a class="list-group-item active main-color-bg"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Hospital <i id="a3" class="fa fa-caret-down" role="button" onclick="close();"></i></a>
                            <div class="list-group" id="3">
                                <a href="../bedbook/" class="list-group-item"><span class="glyphicon glyphicon-bed" aria-hidden="true"></span> Book Bed <span class="badge"><%=book.count()%></span></a>
                                <a href="../hospitalbeds/" class="list-group-item"><span class="glyphicon glyphicon-bed" aria-hidden="true"></span> Hospital Beds <span class="badge"><%=hosBed.count()%></span></a>
                            </div>
                            <a  class="list-group-item active main-color-bg"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Extras <i id="a4" class="fa fa-caret-down" role="button" onclick="close();"></i></a>
                            <div class="list-group" id="4">
                                <a href="../post/" class="list-group-item"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> Posts <span class="badge"><%=pos.count()%></span></a>
                                <a href="../emailsubscriber/" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Email Subscriber <span class="badge"><%=med.count()%></span></a>
                                <a href="../contact/" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Contact <span class="badge"><%=con.count()%></span></a>
                                <a href="../gallery/" class="list-group-item"><span class="glyphicon glyphicon-camera" aria-hidden="true"></span> Gallery <span class="badge"><%=emp.count()%></span></a>
                                <a href="../banner/" class="list-group-item"><span class="glyphicon glyphicon-camera" aria-hidden="true"></span> Banner <span class="badge"><%=emp.count()%></span></a>
                            </div>
                        </div>

                    </div>
                