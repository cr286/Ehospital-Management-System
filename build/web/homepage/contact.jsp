<%@page import="edu.charmin.ehospital.daoo.impl.ContactDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.ContactDAO"%>
<%@page import="edu.charmin.ehospital.entity.Contact"%>
<%@include file="header.jsp" %>

    <!-- ***** Header Area End ***** -->
<%
    
 if (request.getMethod().equals("POST")) {
                
                Contact cus = new Contact();
                ContactDAO cusDao = new ContactDAOImpl();
                cus.setContactName(request.getParameter("name"));
                cus.setContactEmail(request.getParameter("email"));
               
              
                cus.setContactMessage(request.getParameter("message"));
                cus.setContactSubject(request.getParameter("subject"));
                String passEn = request.getParameter("admin_password");
                cusDao.insert(cus);
                  
                
                
                
                response.sendRedirect("contact.jsp");
                
            }
%>
    <section class="breadcumb-area bg-img gradient-background-overlay" style="background-image: url(img/bg-img/hero5.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="breadcumb-content">
                        <!-- Title -->
                        <h3 class="breadcumb-title">Contact</h3>
                        <!-- Breadcumb -->
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Contact</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
       
    <section class="medica-contact-area section_padding_100">
        <div class="container">
            <div class="row">
                <!-- Contact Form Area -->
                <div class="col-12 col-lg-8">
                    <div class="contact-form">
                        <h5 class="mb-50">Get in touch</h5>

                        <form action="#" method="post">
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <input type="text" class="form-control" name="name" id="name" placeholder="Name" required>
                                </div>
                                
                                <div class="col-12">
                                    <input type="email" class="form-control" name="email" id="email" placeholder="Email" required>
                                </div>
                                 <div class="col-12">
                                    <input type="text" class="form-control" name="subject" id="email" placeholder="Subject" required>
                                </div>
                                <div class="col-12">
                                    <textarea name="message" class="form-control" id="message" cols="30" rows="10" placeholder="Message" required></textarea>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn medica-btn btn-3 mt-3">Send Message</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="col-12 col-lg-4">
                    <div class="content-sidebar">
                        <!-- Medica Emergency Card -->
                        <div class="medica-emergency-card mb-4">
                            <h5>For Emergencies</h5>
                            <h4>+0080 954 4557 884</h4>
                            <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                        </div>
                        <!-- Medica Appointment Card -->
                        <div class="medica-contact-card">
                            <h5>Useful Information</h5>
                            <div class="mt-50"></div>
                            <div class="single-contact-info d-flex align-items-center">
                                <div class="contact-icon mr-30">
                                    <img src="img/icons/alarm-clock.png" alt="">
                                </div>
                                <div class="contact-meta">
                                    <p>Monday - Friday 08:00 - 21:00 <br> Saturday and Sunday - CLOSED</p>
                                </div>
                            </div>
                            <div class="single-contact-info d-flex align-items-center">
                                <div class="contact-icon mr-30">
                                    <img src="img/icons/envelope.png" alt="">
                                </div>
                                <div class="contact-meta">
                                    <p>673 729 766 | 234 5678 900 <br> contact@business.com</p>
                                </div>
                            </div>
                            <div class="single-contact-info d-flex align-items-center">
                                <div class="contact-icon mr-30">
                                    <img src="img/icons/map-pin.png" alt="">
                                </div>
                                <div class="contact-meta">
                                    <p>Lamas Carbajal Str, no 14-18 <br> 41770 Montellano</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Google Maps -->
    <div class="map-area mb-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div id="googleMap" class="googleMap"></div>
                </div>
            </div>
        </div>
    </div>

    <!-- ***** Footer Area Start ***** -->
    <%@include file="footer.jsp" %> 