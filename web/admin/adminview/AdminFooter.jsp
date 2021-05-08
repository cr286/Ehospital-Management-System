<%-- 
    Document   : AdminFooter
    Created on : Jun 28, 2018, 3:31:49 PM
    Author     : charm_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<footer id="footer">
      <p>Copyright Charmin Ratna Shakya, &copy; 2018</p>
    </footer>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    
    <script>
        $(document).ready( function () {
    $('.table').DataTable();
     $("#1").hide();
     $("#2").hide();
     $("#3").hide();
     $("#4").hide();
                        $("#a1").click(function(){
                        $("#1").toggle();
                                });
                                $("#a2").click(function(){
                        $("#2").toggle();
                                });
                                $("#a3").click(function(){
                        $("#3").toggle();
                                });
                                $("#a4").click(function(){
                        $("#4").toggle();
                                });
                                $("#a5").click(function(){
                        $("#5").toggle();
                                });
} );

function ondelete(){
    alert("Are you sure you want to delete??");
}
        
var tableToExcel = (function() {
  var uri = 'data:application/vnd.ms-excel;base64,'
    , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
    , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
    , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
  return function(table, name) {
    if (!table.nodeType) table = document.getElementById(table)
    var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
    window.location.href = uri + base64(format(template, ctx))
  }
})()
</script>
  </body>
</html>

