<section id="main">
    <div class="container">
        <div class="row">
            <%@include file="menus.jsp" %>
            <div class="col-md-9">
                <!-- Website Overview -->
                 <%if (request.getParameter("success") == null){
}else if(request.getParameter("success").equals("1")){%><div class='alert alert-success' role='button' onclick="">New Appointment Successfully added!! <button type="button" class="close" data-dismiss="alert">x</button></div>
<%}%>
   <%if (request.getParameter("success") == null){
}else if(request.getParameter("success").equals("2")){%><div class='alert alert-success' role='button' onclick="">New Patient Successfully added!! <button type="button" class="close" data-dismiss="alert">x</button></div>
<%}%>
                <div class="panel panel-default">
                    <div class="panel-heading main-color-bg">
                        <h3 class="panel-title">Website  Overview</h3>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-3">
                            <div class="well dash-box">
                                <h2><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 203</h2>
                                <h4>Doctors</h4>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="well dash-box">
                                <h2><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 12</h2>
                                <h4>Patients</h4>
                            </div>
                        </div>
                       
                    </div>
                </div>


            </div>
        </div>
    </div>
</section>
