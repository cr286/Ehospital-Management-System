<%@page import="edu.charmin.ehospital.entity.Department"%>
<%@page import="edu.charmin.ehospital.daoo.impl.DepartmentDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DepartmentDAO"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>Medica - Health &amp; Medical Template | Home</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon.ico">

        <!-- Core Style CSS -->
        <link rel="stylesheet" href="css/core-style.css">
        <link rel="stylesheet" href="style.css">

        <!-- Responsive CSS -->
        <link rel="stylesheet" href="css/responsive.css">

    </head>

    <body>
        <!-- Preloader -->
        <div id="preloader">
            <div class="medica-load"></div cebook"><i class="fa fa-facebook" aria-hidden="true"></i></a>
        <a href="#" data-toggle="tooltip" data-placement="left" title="Twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a>
        <a href="#" data-toggle="tooltip" data-placement="left" title="Dribbble"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
        <a href="#" data-toggle="tooltip" data-placement="left" title="Behance"><i class="fa fa-behance" aria-hidden="true"></i></a>
        <a href="#" data-toggle="tooltip" data-placement="left" title="Linkedin"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
    </div>
    <div class="top-header-menu">
        <nav class="top-menu">
            <ul>
                <li><a href="#">FAQ</a></li>
                <li><a href="#">Book</a></li>
                <li><a href="#">Appointment</a></li>
                <li><a href="#">Contacts</a></li>
                <li><a href="#">contact@business.com</a></li>
            </ul>
        </nav>
    </div>
</div>
</div>
</div>
</div>
</div>
<!-- Main Header Area -->
<div class="main-header-area" id="stickyHeader">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12 h-100">
                <div class="main-menu h-100">
                    <nav class="navbar h-100 navbar-expand-lg">
                        <!-- Logo Area  -->
                        <a class="navbar-brand" href="index.jsp"><img src="img/core-img/logo.png" alt="Logo"></a>

                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#medicaMenu" aria-controls="medicaMenu" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i> Menu</button>

                        <div class="collapse navbar-collapse" id="medicaMenu">
                            <!-- Menu Area -->
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Department</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <%
                                            DepartmentDAO deppDao = new DepartmentDAOImpl();
                                            for (Department depp : deppDao.getAll()) {
                                        %>
                                        <a class="dropdown-item" href="department.jsp?did=<%=depp.getDepartmentId()%>"><%=depp.getDepartmentName()%></a>
                                        <%}%>
                                       
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="about-us.jsp">About Us</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="services.jsp">Services</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="blog.jsp">News</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="contact.jsp">Contact</a>
                                </li>
                                   <li class="nav-item">
                                    <a class="nav-link" href="../patientpanel">Sign In</a>
                                </li>
                            </ul>
                            <!-- Search Form -->
                            <div class="header-search-form ml-auto">
                                <form action="#">
                                    <input type="search" class="form-control" placeholder="Input your keyword then press enter..." id="search" name="search">
                                    <input class="d-none" type="submit" value="submit">
                                </form>
                            </div>
                            <!-- Search btn -->
                            <div id="searchbtn">
                                <i class="ti-search" aria-hidden="true"></i>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
</header>