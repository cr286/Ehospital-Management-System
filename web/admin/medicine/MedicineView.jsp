



<%@page import="edu.charmin.ehospital.entity.Medicine"%>
<%@page import="edu.charmin.ehospital.daoo.impl.MedicineDAOImpl"%>
<%@page import="edu.charmin.ehospital.daoo.MedicineDAO"%>
<div class="col-md-9">
    <!-- Website Overview -->
    <%if (request.getParameter("success") == null) {
                 } else if (request.getParameter("success").equals("1")) {%><div class='alert alert-success' role='button' onclick="">Test Successfully added!! <button type="button" class="close" data-dismiss="alert">x</button></div>
    <%}%>
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
                    <th>Action</th> 
                    </thead>
                    <tbody>
                        <%
                            MedicineDAO emDao = new MedicineDAOImpl();
                            for (Medicine em : emDao.getAll()) {
                        %>
                        <tr>
                            <td><%=em.getMedicineId()%></td>
                            <td><%=em.getMedicineName()%></td>
                            <td><%=em.getMedicineDescription()%></td>
                            <td><%=em.getMedicinePurpose()%></td>

                            <%if (em.getMedicineStatus() == 1) {%>
                            <td>True</td><%} else if ((em.getMedicineStatus() == 0)) {
                            %><td>True</td><%}%>

                            <td><a class="btn btn-danger" href="DeleteMedicine.jsp?id=<%=em.getMedicineId()%>" role="button">Delete</a> <a class="btn btn-primary" href="UpdateMedicine.jsp?id=<%=em.getMedicineId()%>" role="button">Update</a></td>
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