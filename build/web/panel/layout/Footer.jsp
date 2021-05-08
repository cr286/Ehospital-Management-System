
<footer id="footer">
      <p>Copyright Charmin Ratna Shakya, &copy; 2018</p>
    </footer>
<script language="javascript">
  function Clickheretoprint()
    { 
      var disp_setting="toolbar=yes,location=no,directories=yes,menubar=yes,"; 
          disp_setting+="scrollbars=yes,width=400, height=400, left=100, top=25"; 
      var content_vlue = document.getElementById("print_content").innerHTML; 
    
      var docprint=window.open("","",disp_setting); 
      docprint.document.open(); 
      docprint.document.write('<html><head><title>E hospital</title>'); 
      docprint.document.write('</head><body onLoad="self.print()" style="width: 400px; font-size:12px; font-family:arial;">');          
      docprint.document.write(content_vlue);          
      docprint.document.write('</body></html>'); 
      docprint.document.close(); 
      docprint.focus(); 
    }
  </script>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    
    <script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script>
          $(document).ready( function () {
    $('.table').DataTable();
    
} );

function ondelete(){
    alert("Are you sure you want to delete??");
}
        </script>
  </body>
</html>

