<%@include file="header.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    Date fechaActual = new Date();
    SimpleDateFormat formateadorFecha = new SimpleDateFormat("dd-MM-yyyy");
    String fechaFormateada = formateadorFecha.format(fechaActual);
%>
<div class="content-wrapper">
    <section class="content">
        <form action="#" id="form" enctype="multipart/form-data" method="POST" role="form" class="form-horizontal form-groups-bordered">
            <input type="hidden" id="accion" name="accion" value="agregarProducto"/>
            <h3><i></i>Registro de Productos</h3><br>

            <div class="row">
                <div class="col-lg-3 ds">
                    <h5>DATOS DEL PRODUCTO</h5>

                    <div class="form-group">
                        <label for="nombreProducto" class="control-label">Nombre del Producto</label>
                        <input class="form-control" type="text" name="nombreProducto" id="nombreProducto" onKeyUp="this.value = this.value.toUpperCase();" autocomplete="off" placeholder="Nombre del Producto" required>
                    </div>

                    <div class="form-group">
                        <label for="categoriaProducto" class="control-label">Categoría</label>
                        <input class="form-control" type="text" name="categoriaProducto" id="categoriaProducto" onKeyUp="this.value = this.value.toUpperCase();" autocomplete="off" placeholder="Categoría" required>
                    </div>

                    <div class="form-group">
                        <label for="fechaElaboracion" class="control-label">Fecha de Elaboración</label>
                        <input class="form-control" type="date" name="fechaElaboracion" id="fechaElaboracion" value="<%= fechaFormateada%>" required>
                    </div>

                    <div class="form-group">
                        <label for="fechaCaducidad" class="control-label">Fecha de Caducidad</label>
                        <input class="form-control" type="date" name="fechaCaducidad" id="fechaCaducidad" required>
                    </div>

                    <hr>
                    <br>
                </div>

                <div class="col-lg-9">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-border panel-warning widget-s-1">
                                <div class="panel-heading">
                                    <h4 class="mb"><i class="fa fa-archive"></i> <strong>Detalle Del Producto</strong> </h4>
                                </div>
                                <div class="panel-body">
                                    <div id="error">
                                        <!-- error will be shown here ! -->
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="descripcionProducto" class="control-label">Descripción: <span class="symbol required"></span></label>
                                                <textarea class="form-control" name="descripcionProducto" id="descripcionProducto" rows="3" placeholder="Descripción del producto" required></textarea>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="precioVenta" class="control-label">Precio de Venta: <span class="symbol required"></span></label>
                                                <input class="form-control" type="number" step="0.01" name="precioVenta" id="precioVenta" autocomplete="off" placeholder="Precio de venta" required>
                                            </div>
                                        </div>
                                    </div>

                                    <div align="right">
                                        <button type="button" name="agregar" value="agregar" id="AgregarProducto" class="btn btn-primary"><span class="fa fa-plus"></span> Agregar Producto</button>
                                        <div id="respuesta"></div>
                                    </div>
                                    <hr>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered dt-responsive nowrap" id="tablaProductos">
                                                    <thead>
                                                        <tr>
                                                            <th><div align="center">Acción</div></th>
                                                            <th><div align="center">Nombre</div></th>
                                                            <th><div align="center">Categoría</div></th>
                                                            <th><div align="center">Precio</div></th>
                                                            <th><div align="center">Fecha Elab.</div></th>
                                                            <th><div align="center">Fecha Cad.</div></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="resultados">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal-footer">
                                        <button class="btn btn-danger" type="reset" id="cancelar-producto"><span class="fa fa-times"></span> Cancelar</button>
                                        <button type="button" name="btn-submit" id="guardar-producto" class="btn btn-primary"><span class="fa fa-save"></span> Guardar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </section>
</div>

<!-- Modal para eliminar producto -->
<div class="modal fade" id="modalEliminar" tabindex="-1" role="dialog" aria-labelledby="modalEliminarLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalEliminarLabel">Eliminar Producto</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                ¿Está seguro de querer eliminar este producto?
                <input type="hidden" name="idProductoEliminar" id="idProductoEliminar"/>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="confirmarEliminar">SI</button>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function () {
    cargarProductos();

    $("#AgregarProducto").click(function () {
        var datosForm = $("#form").serialize();
        $.ajax({
            data: datosForm,
            url: 'jsp/productos1.jsp',
            type: 'post',
            success: function (response) {
                $("#respuesta").html(response);
                cargarProductos();
                limpiarFormulario();
            }
        });
    });

    function cargarProductos() {
        $.ajax({
            data: {accion: 'listarProductos'},
            url: 'jsp/productos1.jsp',
            type: 'post',
            success: function (response) {
                $("#resultados").html(response);
            }
        });
    }

    $("#confirmarEliminar").click(function () {
        var idProducto = $("#idProductoEliminar").val();
        $.ajax({
            data: {accion: 'eliminarProducto', idProducto: idProducto},
            url: 'jsp/productos1.jsp',
            type: 'post',
            success: function (response) {
                cargarProductos();
            }
        });
    });

    function limpiarFormulario() {
        $("#form")[0].reset();
    }

    $("#cancelar-producto").click(function () {
        limpiarFormulario();
    });

    $("#guardar-producto").click(function () {
        // Aquí puedes agregar la lógica para guardar todos los productos
        alert("Productos guardados exitosamente");
        limpiarFormulario();
        cargarProductos();
    });
});
</script>

<%@include file="footer.jsp" %>