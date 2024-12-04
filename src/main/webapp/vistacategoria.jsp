 <%@include file="header.jsp"%>
 <title>CATEGORIA</title>
        <div class="col-3">
            <form id="form" method="post">
                <h2>CATEGORIAS</h2>
    <input type="hidden" class="form-control " id="listar" name="listar" value="cargar">
    <input type="hidden" class="form-control " id="idproveedor" name="idproveedor">
  <div class="mb-3">
    <label for="text" class="form-label">Nombre</label>
    <input type="text" class="form-control " id="razon_social" name="razon_social" style="width: 300px;">
   
  </div>
  <div class="mb-3">
    <label for="text" class="form-label">Descripcion</label>
    <input type="text" class="form-control" id="ruc" name="ruc" style="width: 300px;">
  </div>
  
    <input type="button" class="btn btn-primary" id="boton" name="boton" value="GUARDAR"/><button type="button" class="btn btn-primary" onclick="location.href = 'vistareportcat1.jsp'">PDF</button>
</form>
            </div>
        <div id="mensaje"></div>
        <div class="col">
        <table class="table" id="resultado">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Nombre</th>
      <th scope="col">Descripcion</th>
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
    <input type="hidden" class="form-control " id="idproveedor_e" name="idproveedor_e">
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
            url:'jsp/categoria.jsp',
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
            url:'jsp/categoria.jsp',
            type: 'post',
           
            success: function(response){
                $("#mensaje").html(response); 
                 rellenardatos();
                 
                 
                 setTimeout(function(){
                     
                     $("#mensaje").html("");
                     $("#razon_social").val("");
                     $("#ruc").val("");
                     $("#razon_social").focus("");
                     $("#listar").val("cargar");
                 },2000);
            } 
           });
           });
           $("#eliminaregistro").on("click",function()
       {
           listar=$("#listar_eliminar").val();
           pk=$("#idproveedor_e").val();
           $.ajax({
            data:{listar: listar,idproveedor_e:pk},
            url:'jsp/categoria.jsp',
            type: 'post',
           
            success: function(response){
                $("#mensaje").html(response); 
                 rellenardatos();
                 
                 
                 setTimeout(function(){
                     
                     $("#mensaje").html("");
                     $("#razon_social").val("");
                     $("#ruc").val("");
                     $("#razon_social").focus("");
                      $("#listar").val("cargar");
                 },2000);
            } 
           });
           });
           function rellenaredit(a,b,c){
           $("#idproveedor").val(a);
           $("#razon_social").val(b);
           $("#ruc").val(c);
           $("#listar").val("modificar");
    
       }
    </script>



