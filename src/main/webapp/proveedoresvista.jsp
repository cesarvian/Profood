 <%@include file="header.jsp"%>
 <title>PROVEEDORES</title>
<div class="row">
    <div class="col-3">
        </div>
    <div class="col-9">
        <div class="container">
            <form id="form" method="post">
                <h2>PROVEEDORES</h2>
                <input type="hidden" class="form-control" id="listar" name="listar" value="cargar">
                <input type="hidden" class="form-control" id="idproveedor" name="idproveedor">
                <div class="mb-3">
                    <label for="text" class="form-label">Nombre</label>
                    <input type="text" class="form-control" id="razon_social" name="razon_social" style="width: 300px;">
                </div>
                <div class="mb-3">
                    <label for="text" class="form-label">Ruc</label>
                    <input type="text" class="form-control" id="ruc" name="ruc" style="width: 300px;">
                </div>
                <input type="button" class="btn btn-primary" id="boton" name="boton" value="GUARDAR"/>
                <button type="button" class="btn btn-primary" onclick="location.href = 'vistarreport.jsp'">PDF</button>
            </form>
            <div id="mensaje"></div>
            <table class="table" id="resultado">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">razon</th>
                        <th scope="col">ruc</th>
                        <th scope="col">Accion</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
        <style>
        
        .container {
            margin-left: 100px; /* Adjust the value as needed */
        }
    </style> 
    </div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar?</h1>
                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" class="form-control" id="listar_eliminar" name="listar_eliminar" value="eliminar">
                <input type="hidden" class="form-control" id="idproveedor_e" name="idproveedor_e">
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
            url:'jsp/proveedores.jsp',
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
            url:'jsp/proveedores.jsp',
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
            url:'jsp/proveedores.jsp',
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


