

<%@ include file="header.jsp" %>


<title>INICIO</title>
<div class="box box-solid box-primary">
  <section class="content">

    <%-- Main Page Content --%>

    <h2>Men� Principal</h2>

    <p>Aqu� puede encontrar una variedad de opciones para gestionar sus compras y otros aspectos de su vida diaria. Seleccione una de las siguientes secciones para comenzar:</p>

   <div class="box box-solid box-primary">
      <div class="col-md-4">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">Gesti�n de Compras</h3>
          </div>
          <div class="card-body">
            <p>Cree y administre listas de compras, agregue art�culos, marque los comprados y m�s.</p>
            <a href="vistacompras.jsp" class="btn btn-primary">Ir a Compras</a>
          </div>
        </div>
      </div>
      </div>
    

  </section>
</div>
<%
if (rol.equals("admin")){
%>
<%
  out.print(rol) ; }
%>
<%@ include file="footer.jsp" %>