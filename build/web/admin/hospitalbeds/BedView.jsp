<%@page import="edu.charmin.ehospital.entity.HospitalBed"%>
<%@page import="edu.charmin.ehospital.daoo.impl.HospitalBedDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.HospitalBedDAO"%>


<div class="col-md-9">
    <!-- Website Overview -->
    <%if (request.getParameter("success") == null) {
                 } else if (request.getParameter("success").equals("1")) {%><div class='alert alert-success' role='button' onclick="">Test Successfully added!! <button type="button" class="close" data-dismiss="alert">x</button></div>
    <%}%>
    <div class="panel panel-default">
        <div class="panel-heading main-color-bg">
            <h3 class="panel-title"><a class="btn btn-primary" href="BedAdd.jsp" role="button">Add Beds</a> </h3>
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                    <th>ID</th>
                    <th>Bed No</th>
                    <th>Floor</th>
                    <th>Type</th>
                    <th>Price</th>
                    <th>Status</th>
                    <th>Action</th>

                    </thead>
                    <tbody>
                        <%

                            HospitalBedDAO emDao = new HospitalBedDAOImpl();
                            for (HospitalBed em : emDao.getAll()) {

                        %>
                        <tr>
                            <td><%=em.getBedId()%></td>
                            <td><%=em.getBedNo()%></td>
                            <td><%=em.getBedFloor()%></td>
                            <td><%=em.getBedType()%></td>
                            <td><%=em.getBedPrice()%></td>
                            <td><%=em.getBedStatus()%></td>
                            <td>
                                <% if (em.getBedStatus() == 0) {%>
                                <a class="btn btn-danger" href="DeleteBed.jsp?id=<%=em.getBedId()%>" role="button">Delete</a>
                                <% } else {%>
                                <a class="btn btn-danger" href="DeleteBed.jsp?id=<%=em.getBedId()%>" role="button" disabled>Delete</a>
                                <%}%>
                                <a class="btn btn-primary" href="UpdateBed.jsp?id=<%=em.getBedId()%>" role="button">Update</a>
                            </td>
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