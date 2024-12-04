<%@include file="header.jsp"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    // Obtener la fecha actual
    Date fechaActual = new Date();

    // Crear un formateador de fecha
    SimpleDateFormat formateadorFecha = new SimpleDateFormat("dd-MM-yyyy");

    // Formatear la fecha
    String fechaFormateada = formateadorFecha.format(fechaActual);
%>
<title>INGREDIENTES</title>
        <div class="col-3">
            <form id="form" method="post">
                <h2>INVENTARIO MATERIA PRIMA</h2>
    <input type="hidden" class="form-control " id="listar" name="listar" value="cargar">
    <input type="hidden" class="form-control " id="idproducto" name="idproducto">
  <div class="mb-3">
    <label for="text" class="form-label">Cod</label>
    <input type="text" class="form-control " id="pro_nombre" name="pro_nombre"style="width: 300px;">
   
  </div>
  <div class="mb-3">
    <label for="text" class="form-label">Nombre</label>
    <input type="text" class="form-control" id="pro_des" name="pro_des"style="width: 300px;">
  </div>
 <div class="mb-3">
   <label for="text" class="control-label"> Cantidad</label>
   <input type="text" class="form-control" id="cant" name="cant"style="width: 300px;">
   
       
   </select>
  </div>
    <div class="mb-3">
    <label for="text" class="form-label">Precio</label>
    <input type="text" class="form-control" id="ela" name="ela" style="width: 300px;">
  </div>
    <div class="mb-3">
    <label for="text" class="form-label">Fecha</label>
    <input type="text" class="form-control" id="venc" name="venc" style="width: 300px;"value="<%= fechaFormateada%>" readonly>
  </div>
        <input type="button" class="btn btn-primary" id="boton" name="boton" value="GUARDAR"/><button type="button" class="btn btn-primary" onclick="location.href = 'vistareportingre1.jsp'">PDF</button>
</form>
            </div>
        <div id="mensaje"></div>
        <div class="col">
        <table class="table" id="resultado">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Cod</th>
      <th scope="col">Nombre</th>
      <th scope="col">Cantidad</th>
      <th scope="col">Precio</th>
      <th scope="col">Fecha</th>
      <th scope="col">Accion</th>
    </tr>
  </thead>
  
  <tbody>
    
  </tbody>
</table>
            <style>
        
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
    <input type="hidden" class="form-control " id="idproducto_e" name="idproducto_e">
    desea eliminar
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
       
        <input type="button" class="btn btn-primary" data-dismiss="modal" id="eliminaregistro" aria-label="Close" name="eliminaregistro" value="si"/>
      </div>
    </div>
  </div>
</div>
 
     
    <script>
      
  
    $(document).ready(function(){
        
        
        rellenardatos();
    });
       function rellenardatos(){
           
            $.ajax({
                data: {listar:'listar' },
            url:'jsp/inventario.jsp',
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
            url:'jsp/inventario.jsp',
            type: 'post',
           
            success: function(response){
                $("#mensaje").html(response); 
                 rellenardatos();
                 
                 
                 setTimeout(function(){
                     
                     $("#mensaje").html("");
                     $("#pro_nombre").val("");
                     $("#pro_des").val("");
                     $("#cant").val("");
                     $("#ela").val("");
                     $("#venc").val("");
                     
                     $("#pro_nombre").focus("");
                     $("#listar").val("cargar");
                 },2000);
            } 
           });
           });
           $("#eliminaregistro").on("click",function()
       {
           listar=$("#listar_eliminar").val();
           pk=$("#idproducto_e").val();
           $.ajax({
            data:{listar: listar,idproducto_e:pk},
            url:'jsp/inventario.jsp',
            type: 'post',
           
            success: function(response){
                $("#mensaje").html(response); 
                 rellenardatos();
                 
                 
                 setTimeout(function(){
                     
                     $("#mensaje").html("");
                     $("#pro_nombre").val("");
                     $("#pro_des").val("");
                     $("#cant").val("");
                     $("#ela").val("");
                     $("#venc").val("");
                     
                     $("#pro_nombre").focus("");
                      $("#listar").val("cargar");
                 },2000);
            } 
           });
           });
           function rellenaredit(a,b,c,d,e,f){
           $("#idproducto").val(a);
           $("#pro_nombre").val(b);
           $("#pro_des").val(c);
           $("#cant").val(d);
           $("#ela").val(e);
           $("#venc").val(f);
           
           $("#listar").val("modificar");
    
       }
    </script>
     <%@include file="footer.jsp"%>


