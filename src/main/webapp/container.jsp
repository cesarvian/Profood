<%@include file="header.jsp" %>
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
<title>LISTA COMRPAS</title>
<div class="content-wrapper">
    <section class="content">
        <h1>Lista de compras</h1>
        <button type="button" class="btn btn-primary" onclick="location.href = 'vistacompras.jsp'">Nueva Compra</button>
        <form action="informecompra.jsp">
            <div class="form-group">
                <div class="col-md-3">
                                    <input class="form-control" type="date" name="fechainicio" id="fechainicio" onKeyUp="" autocomplete="off" >

</div>
            </div>
            <div class="form-group">
                <div class="col-md-3">
                                    <input class="form-control" type="date" name="fechafinal" id="fechafinal" onKeyUp="" autocomplete="off" >

</div>
            </div><div class="form-group">
            <div class="col-md-3">
                
                <button>Informe</button>
                
</div>
            </div>
        </form>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Ref.</th>
                    <th scope="col">Fecha</th>
                    <th scope="col">Proveedor</th>
                    <th scope="col">Total</th>
                    <th scope="col">Acción</th>
                </tr>
            </thead>
            <tbody id="resultadocompra">

            </tbody>
        </table>
    </section>
</div>

</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Eliminar Compra</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Esta seguro de querer eliminar la compra?
                <input type="hidden" name="pkanul" id="pkanul"/>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="anulcompra">SI</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        llenadocompras();
    });
    function llenadocompras() {
        $.ajax({
            data: {listar: 'listarcompras'},
            url: 'jsp/compras.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                $("#resultadocompra").html(response);
                //sumador();

            }
        });
    }

    $("#anulcompra").click(function () {
        idpkcompra = $("#pkanul").val();
        $.ajax({
            data: {listar: 'anularcompras', idpkcompra: idpkcompra},
            url: 'jsp/compras.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                llenadocompras();
                //sumador();

            }
        });
    });
       $("#acptar").click(function () {
        fechaini = $("#fechainicio").val();
        fechafin = $("#fechafinal").val();
        $.ajax({
            data: {listar: 'informe', fechaini: fechaini,fechafin: fechafin},
            url: 'jsp/compras.jsp',
            type: 'post',
            beforeSend: function () {
                //$("#resultado").html("Procesando, espere por favor...");
            },
            success: function (response) {
                llenadocompras();
                //sumador();

            }
        });
    });
</script>
<%@include file="footer.jsp" %>