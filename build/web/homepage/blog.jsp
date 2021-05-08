
<%@page import="edu.charmin.ehospital.daoo.impl.PostDAOImpl"%>
<%@page import="edu.charmin.ehospital.entity.Post"%>
<%@page import="edu.charmin.ehospital.daoo.PostDAO"%>
<%@include file="header.jsp"%>
    <!-- ***** Header Area End ***** -->

    <section class="breadcumb-area bg-img gradient-background-overlay" style="background-image: url(img/bg-img/hero4.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="breadcumb-content">
                        <!-- Title -->
                        <h3 class="breadcumb-title">Latest news</h3>
                        <!-- Breadcumb -->
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">News</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section class="medica-blog-area section_padding_100">
        <div class="container">
            <div class="row">

                <div class="col-12 col-lg-8">
                      <%
                        PostDAO emDao = new PostDAOImpl();
                         for (Post em: emDao.getAll()) { 
                     %>
                    <!-- Single Blog Area Start  -->
                    <div class="single-blog-area">
                        <!-- Post Thumb -->
                        <div class="post-thumb">
                            <img src="../uploads/<%=em.getPostImage()%>" alt="Photo not found">
                            <!-- Post Date -->
                            <div class="post-date">
                                <a href="#"><%=em.getPostCategory()%></a>
                            </div>
                        </div>
                        <!-- Post Content -->
                        <div class="post-content">
                            <h4><%=em.getPostTitle()%></h4>
                            <div class="post-meta mb-30 d-flex align-items-center">
                                <p class="author mb-0">Author:<a href="#"> Admin</a> |</p>
                                <p class="author mb-0">in<a href="#">Admin</a> |</p>
                               
                            </div>
                            <p><%=em.getPostbody()%></p>
                            <a href="#">Read More</a>
                        </div>
         
                   </div>
                    <% } %>
                    <!-- Single Blog Area Start  -->
                    <div class="single-blog-area">
                        <!-- Post Thumb -->
                        <div class="post-thumb">
                            <img src="img/blog-img/2.jpg" alt="">
                            <!-- Post Date -->
                            <div class="post-date">
                                <a href="#">Dec 05, 2017</a>
                            </div>
                        </div>
                        <!-- Post Content -->
                        <div class="post-content">
                            <h4>Let us introduce you our new team</h4>
                            <div class="post-meta mb-30 d-flex align-items-center">
                                <p class="author mb-0">Author:<a href="#"> Loredana Papp</a> |</p>
                                <p class="author mb-0">in<a href="#"> Medicine Breacktrough</a> |</p>
                                <p class="author mb-0"><a href="#">3 Comments</a></p>
                            </div>
                            <p>Phasellus at nunc orci. Donec ipsum metus, pharetra quis nunc sit amet, maximus vehicula nibh. Praesent pulvinar porta elit, a commodo erat. Phasellus at nunc orci. Donec ipsum metus, pharetra quis nunc sit amet, maximus vehicula nibh. Praesent pulvinar porta elit, a commodo erat.</p>
                            <a href="#">Read More</a>
                        </div>
                    </div>

                    <!-- Single Blog Area Start  -->
                    <div class="single-blog-area">
                        <!-- Post Thumb -->
                        <div class="post-thumb">
                            <img src="img/blog-img/3.jpg" alt="">
                            <!-- Post Date -->
                            <div class="post-date">
                                <a href="#">Dec 05, 2017</a>
                            </div>
                        </div>
                        <!-- Post Content -->
                        <div class="post-content">
                            <h4>New techniques to perform surgery</h4>
                            <div class="post-meta mb-30 d-flex align-items-center">
                                <p class="author mb-0">Author:<a href="#"> Loredana Papp</a> |</p>
                                <p class="author mb-0">in<a href="#"> Medicine Breacktrough</a> |</p>
                                <p class="author mb-0"><a href="#">3 Comments</a></p>
                            </div>
                            <p>Phasellus at nunc orci. Donec ipsum metus, pharetra quis nunc sit amet, maximus vehicula nibh. Praesent pulvinar porta elit, a commodo erat. Phasellus at nunc orci. Donec ipsum metus, pharetra quis nunc sit amet, maximus vehicula nibh. Praesent pulvinar porta elit, a commodo erat.</p>
                            <a href="#">Read More</a>
                        </div>
                    </div>

                    <!-- Pagination Area -->
                    <div class="pagination-area">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>

                <div class="col-12 col-lg-4">
                    <div class="medica-blog-sidebar-area">
                        <!-- Medica Emergency Card -->
                        <div class="medica-emergency-card">
                            <h5>For Emergencies</h5>
                            <h4>+0080 954 4557 884</h4>
                            <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis id explicabo.</p>
                        </div>
                        <!-- Medica Doctors Card -->
                        <div class="medica-catagories-card px-0">
                            <h5>Categories</h5>
                            <ul class="catagories-menu">
                                <li><a href="#">Radiology</a></li>
                                <li><a href="#">Cardiology</a></li>
                                <li><a href="#">Gastroenterology</a></li>
                                <li><a href="#">Neurology</a></li>
                                <li><a href="#">General surgery</a></li>
                            </ul>
                        </div>
                        <!-- Latest News -->
                        <div class="latest-news-widget-area px-0">
                            <h5>Latest News</h5>
                            <div class="widget-blog-post">
                                <!-- Single Blog Post -->
                                <div class="widget-single-blog-post d-flex">
                                    <div class="widget-post-thumbnail pr-2">
                                        <img src="img/bg-img/fp1.jpg" alt="">
                                    </div>
                                    <div class="widget-post-content">
                                        <a href="#" class="text-default">A big discovery for medicine</a>
                                        <p>Dec 02, 2017</p>
                                    </div>
                                </div>
                                <!-- Single Blog Post -->
                                <div class="widget-single-blog-post d-flex">
                                    <div class="widget-post-thumbnail pr-2">
                                        <img src="img/bg-img/fp2.jpg" alt="">
                                    </div>
                                    <div class="widget-post-content">
                                        <a href="#">Dentistry for everybody</a>
                                        <p>Dec 02, 2017</p>
                                    </div>
                                </div>
                                <!-- Single Blog Post -->
                                <div class="widget-single-blog-post d-flex">
                                    <div class="widget-post-thumbnail pr-2">
                                        <img src="img/bg-img/fp3.jpg" alt="">
                                    </div>
                                    <div class="widget-post-content">
                                        <a href="#">When it?s time to take pills</a>
                                        <p>Dec 02, 2017</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Medica Appointment Card -->
                        <div class="medica-appointment-card">
                            <h5>Book an apppointment</h5>
                            <form action="#" method="post">
                                <div class="form-group">
                                    <input type="text" class="form-control text-white" name="name" id="name" placeholder="Name">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="number" id="number" placeholder="Phone">
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" name="email" id="email" placeholder="E-mail">
                                </div>
                                <button type="submit" class="btn medica-btn mt-15">Make an Appointment</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ***** Footer Area Start ***** -->
   <%@include file="footer.jsp" %> 