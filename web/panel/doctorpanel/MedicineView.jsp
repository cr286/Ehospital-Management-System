
<%@page import="edu.charmin.ehospital.entity.Medicine"%>
<%@page import="edu.charmin.ehospital.daoo.impl.MedicineDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.MedicineDAO"%>

<%@include file="../layout/Header.jsp" %>
<section id="main">
    <div class="container">
        <div class="row">
            <%@include file="menus.jsp" %>


            <div class="col-md-9">
                <!-- Website Overview -->
                <div class="panel panel-default">
                    <div class="panel-heading main-color-bg">
                        <h3 class="panel-title"><a class="btn btn-primary" href="MedicineAdd.jsp" role="button">New Medicine</a></h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Purpose</th>
                                <th>Status</th>

                                </thead>
                                <tbody>
                                    <%                            MedicineDAO emDao = new MedicineDAOImpl();
                                        for (Medicine em : emDao.getAll()) {
                                    %>
                                    <tr>
                                        <td><%=em.getMedicineId()%></td>
                                        <td><%=em.getMedicineName()%></td>
                                        <td><%=em.getMedicineDescription()%></td>
                                        <td><%=em.getMedicinePurpose()%></td>
                                        <%if (em.getMedicineStatus() == 1) {%>
                                        <td>In Stock</td><%} else if ((em.getMedicineStatus() == 0)) {
                                        %><td>Out of Stock</td><%}%>

                                    </tr>     

                                    <%
                                        }


                                    %>
                                </tbody>  
                            </table>
                        </div>
                    </div>
                </div>
            </div>


            </section>
            <%@include file="../layout/Footer.jsp" %>