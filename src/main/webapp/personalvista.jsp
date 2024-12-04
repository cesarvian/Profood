<%@include file="header.jsp"%>
<title>PERSONALES</title>
        <div class="col-3">
            <form id="form" method="post">
                <h2>PERSONALES</h2>
    <input type="hidden" class="form-control " id="listar" name="listar" value="cargar">
    <input type="hidden" class="form-control " id="idpersonal" name="idpersonal">
  <div class="mb-3">
    <label for="text" class="form-label">Nombre</label>
    <input type="text" class="form-control " id="nom" name="nom"style="width: 300px;">
   
  </div>
  <div class="mb-3">
    <label for="text" class="form-label">Apellido</label>
    <input type="text" class="form-control" id="ape" name="ape"style="width: 300px;">
  </div>
  <div class="mb-3">
    <label for="text" class="form-label">Direccion</label>
    <input type="text" class="form-control" id="direc" name="direc"style="width: 300px;">
  </div>
    <input type="button" class="btn btn-primary" id="boton" name="boton" value="GUARDAR"/><button type="button" class="btn btn-primary" onclick="location.href = 'vistareportper.jsp'">PDF</button>
</form>
            </div>
        <div id="mensaje"></div>
        <div class="col">
        <table class="table" id="resultado">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Nombre</th>
      <th scope="col">Apellido</th>
      <th scope="col">Direccion</th>
      <th scope="col">Accion</th>
    </tr>
  </thead>
  
  <tbody>
    
  </tbody>
  
</table>
            <style>
        .table {
            margin-left: 100px; /* Adjust the value as needed */
        }
        .col-3 {
            margin-left: 100px; /* Adjust the value as needed */
        }
    </style>    
        </div>
    
    <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar?</h1>
        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <input type="hidden" class="form-control " id="listar_eliminar" name="listar_eliminar" value="eliminar">
    <input type="hidden" class="form-control " id="idpersonal_e" name="idpersonal_e">
    desea eliminar
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
       
        <input type="button" class="btn btn-primary" data-dismiss="modal" id="eliminaregistro" aria-label="Close" name="eliminaregistro" value="si"/>
      </div>
    </div>
  </div>
</div>
 
      <%@include file="footer.jsp"%>
    <script>
      $(document).ready(function(){
        rellenardatos();
    });
       function rellenardatos(){
           
            $.ajax({
                data: {listar:'listar' },
            url:'jsp/personal.jsp',
            type: 'post',
           
            success: function(response){
                $("#resultado tbody").html(response); 
            }          
        });
    
       }
       $("#boton").on("click",function()
       {
           dato=$("#form").serialize();
           $.ajax({
            data:dato,
            url:'jsp/personal.jsp',
            type: 'post',
           
            success: function(response){
                $("#mensaje").html(response); 
                 rellenardatos();
                 
                 
                 setTimeout(function(){
                     
                     $("#mensaje").html("");
                     $("#nom").val("");
                     $("#ape").val("");
                     $("#direc").val("");
                     $("#nom").focus("");
                     $("#listar").val("cargar");
                 },2000);
            } 
           });
           });
           $("#eliminaregistro").on("click",function()
       {
           listar=$("#listar_eliminar").val();
           pk=$("#idpersonal_e").val();
           $.ajax({
            data:{listar: listar,idpersonal_e:pk},
            url:'jsp/personal.jsp',
            type: 'post',
           
            success: function(response){
                $("#mensaje").html(response); 
                 rellenardatos();
                 
                 
                 setTimeout(function(){
                     
                     $("#mensaje").html("");
                     $("#nom").val("");
                     $("#ape").val("");
                     $("#direc").val("");
                     $("#nom").focus("");
                      $("#listar").val("cargar");
                 },2000);
            } 
           });
           });
           function rellenaredit(a,b,c,d){
           $("#idpersonal").val(a);
           $("#nom").val(b);
           $("#ape").val(c);
           $("#direc").val(d);
           $("#listar").val("modificar");
    
       }
    </script>



