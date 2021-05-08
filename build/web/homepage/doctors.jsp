<%@page import="edu.charmin.ehospital.daoo.impl.DoctorDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.DoctorDAO"%>
<%@page import="edu.charmin.ehospital.entity.Doctor"%>
<%

    DepartmentDAO depDao = new DepartmentDAOImpl();
    DoctorDAO docDao = new DoctorDAOImpl();

    Department dep = new Department();

%>

<%@include file="header.jsp" %> 
<section class="medica-doctors-area bg-gray section_padding_100">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section_heading">
                    <img src="img/icons/doctor.png" alt="">
                    <h2>Our Doctors</h2>
                    <p>We have the best doctors available.</p>
                </div>
            </div>
        </div>

        <div class="row">
            <%
                for (Doctor doc : docDao.getAll()) {
                    dep = depDao.getById(doc.getDepartment_id());
            %>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-doctor-area wow fadeInUp" data-wow-delay="0.2s">
                    <div class="doctor-thumbnail">
                        <%if (doc.getDoctorImage() != null) { %>
                        <img src="../uploads/<%=doc.getDoctorImage()%>" alt="Photo not found">
                        <%} else {%><img src="img/bg-img/d1.jpg" alt="Photo not found"><%}%>
                        
                    </div>
                    <div class="doctor-meta">
                        <h5>Dr.<%=doc.getDoctorFirstName() + " " + doc.getDoctorLastName()%></h5>
                        <h6><%=dep.getDepartmentName()%></h6>
                        <div class="doctor-social-info">
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <%}%>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-doctor-area wow fadeInUp" data-wow-delay="0.4s">
                    <div class="doctor-thumbnail">
                        <img src="img/bg-img/d2.jpg" alt="">
                    </div>
                    <div class="doctor-meta">
                        <h5>Dr. Josh Henderson</h5>
                        <h6>Plastic Surgeon</h6>
                        <div class="doctor-social-info">
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-doctor-area wow fadeInUp" data-wow-delay="0.6s">
                    <div class="doctor-thumbnail">
                        <img src="img/bg-img/d3.jpg" alt="">
                    </div>
                    <div class="doctor-meta">
                        <h5>Dr. Christinne Jones</h5>
                        <h6>Pediatrist</h6>
                        <div class="doctor-social-info">
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-doctor-area wow fadeInUp" data-wow-delay="0.8s">
                    <div class="doctor-thumbnail">
                        <img src="img/bg-img/d4.jpg" alt="">
                    </div>
                    <div class="doctor-meta">
                        <h5>Dr. William Stan</h5>
                        <h6>General Practicioner</h6>
                        <div class="doctor-social-info">
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-doctor-area wow fadeInUp" data-wow-delay="0.2s">
                    <div class="doctor-thumbnail">
                        <img src="img/bg-img/d5.jpg" alt="">
                    </div>
                    <div class="doctor-meta">
                        <h5>Dr. William Parker</h5>
                        <h6>Cardiologist</h6>
                        <div class="doctor-social-info">
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-doctor-area wow fadeInUp" data-wow-delay="0.4s">
                    <div class="doctor-thumbnail">
                        <img src="img/bg-img/d6.jpg" alt="">
                    </div>
                    <div class="doctor-meta">
                        <h5>Dr. Maria Hernandez</h5>
                        <h6>Plastic Surgeon</h6>
                        <div class="doctor-social-info">
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-doctor-area wow fadeInUp" data-wow-delay="0.6s">
                    <div class="doctor-thumbnail">
                        <img src="img/bg-img/d7.jpg" alt="">
                    </div>
                    <div class="doctor-meta">
                        <h5>Dr. Stella Jones</h5>
                        <h6>Pediatrist</h6>
                        <div class="doctor-social-info">
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-doctor-area wow fadeInUp" data-wow-delay="0.8s">
                    <div class="doctor-thumbnail">
                        <img src="img/bg-img/d8.jpg" alt="">
                    </div>
                    <div class="doctor-meta">
                        <h5>Dr. Jack Gillian</h5>
                        <h6>General Practicioner</h6>
                        <div class="doctor-social-info">
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %> 