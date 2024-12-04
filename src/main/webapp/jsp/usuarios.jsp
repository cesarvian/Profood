<%@include file="conexion1.jsp"%>
<%
    
if(request.getParameter("listar").equals("listar")){

   try{
        Statement st=null;
        ResultSet rs=null;
        st=conn.createStatement();
        rs=st.executeQuery("select * from usuarios order by id_usuario");
    while(rs.next())
{%>
<tr>
    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(3));%></td>
    <td><%out.print(rs.getString(4));%></td>
    <td><%out.print(rs.getString(5));%></td>
    <td><%out.print(rs.getBoolean(6));%></td>
    <td><i title="modificar" class="fa fa-pencil-square" onclick="rellenaredit('<%out.print(rs.getString(1));%>','<%out.print(rs.getString(2));%>','<%out.print(rs.getString(3));%>','<%out.print(rs.getString(4));%>','<%out.print(rs.getString(5));%>','<%out.print(rs.getBoolean(6));%>')"></i><i title="eliminar" class="fa fa-trash" onclick="$('#idusuario_e').val('<%out.print(rs.getString(1));%>')" data-toggle="modal" data-target="#exampleModal"></i><a class="fa fa-eye" href = 'vistausu.jsp?idusu=<%=rs.getString(1)%>'></a></td>
</tr>

<% 
    }

}catch(Exception e){
     out.print("error pp"+e);
    }
}else if(request.getParameter("listar").equals("cargar")){

String Nombre =request.getParameter("usu_nombre");
String Contrasena =request.getParameter("usu_contrasena");
String Correo =request.getParameter("usu_correo");
String Rol =request.getParameter("usu_rol");
if(Nombre==""){
out.print("<div class='alert alert-danger' role='alert'>valor vacio</div>");
}else if(Contrasena==""){
out.print("<div class='alert alert-danger' role='alert'>valor vacio</div>");
}else if(Correo==""){
out.print("<div class='alert alert-danger' role='alert'>valor vacio</div>");
}else if(Rol==""){
out.print("<div class='alert alert-danger' role='alert'>valor vacio</div>");
}else{
try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("INSERT INTO usuarios(nombre_usuario, contrasena, correo_electronico, rol_usuario) VALUES ('"+Nombre+"','"+Contrasena+"','"+Correo+"','"+Rol+"');");
 out.print("<div class='alert alert-success' role='alert'>guardado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}else if(request.getParameter("listar").equals("modificar")){

String Nombre =request.getParameter("usu_nombre");
String Contrasena =request.getParameter("usu_contrasena");
String Correo =request.getParameter("usu_correo");
String Rol =request.getParameter("usu_rol");
String pk =request.getParameter("idusuario");
if(Nombre==""){
out.print("<div class='alert alert-success' role='alert'>valor vacio</div>");
}else{
 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("update usuarios set nombre_usuario='"+Nombre+"', contrasena='"+Contrasena+"', correo_electronico='"+Correo+"', rol_usuario='"+Rol+"' where id_usuario='"+pk+"'");

        out.print("<div class='alert alert-success' role='alert'>modificado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}
else if(request.getParameter("listar").equals("eliminar")){
String pk =request.getParameter("idusuario_e");

 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("DELETE FROM usuarios WHERE id_usuario='" + pk + "'");

        out.print("<div class='alert alert-success' role='alert'>eliminado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }

}
     %>