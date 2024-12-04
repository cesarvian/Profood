<%-- 
    <form id="form" method="post" action="#">
        Usuario: <input id="nombre_usuario" type="text" name="nombre_usuario">
        Contraseña: <input id="contrasena"type="password" name="contrasena">
        <button id="acceso" type="button"  >acceder</button>
        <div id="respuesta"></div>
    </form>
--%>

<%
HttpSession sesion=request.getSession();
sesion.invalidate();
response.sendRedirect("../index.jsp");
%>