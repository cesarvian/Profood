<%@include file="conexion1.jsp"%>
<%
    
if(request.getParameter("listar").equals("listar")){

   try{
        Statement st=null;
        ResultSet rs=null;
        st=conn.createStatement();
        rs=st.executeQuery("select * from productos1 order by id_producto");
    while(rs.next())
{%>
<tr>
    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(3));%></td>
    <td><%out.print(rs.getString(4));%></td>
    <td><%out.print(rs.getString(5));%></td>
    <td><%out.print(rs.getString(6));%></td>
    <td><%out.print(rs.getString(7));%></td>
    <td><i title="modificar" class="fa fa-pencil-square" onclick="rellenaredit('<%out.print(rs.getString(1));%>','<%out.print(rs.getString(2));%>','<%out.print(rs.getString(3));%>','<%out.print(rs.getString(4));%>','<%out.print(rs.getString(5));%>','<%out.print(rs.getString(6));%>','<%out.print(rs.getString(7));%>')"></i><i title="eliminar" class="fa fa-trash" onclick="$('#idproducto_e').val('<%out.print(rs.getString(1));%>')" data-toggle="modal" data-target="#exampleModal"></i><a class="fa fa-eye" href = 'vistareporteproductos.jsp?codproducto=<%=rs.getString(1)%>'></a></td>
</tr>

<% 
    }

}catch(Exception e){
     out.print("error pp"+e);
    }
}else if(request.getParameter("listar").equals("cargar")){

String Nombre =request.getParameter("pro_nombre");
String Descripcion =request.getParameter("pro_des");
String Categoria =request.getParameter("cant");
String Elaboracion =request.getParameter("ela");
String Vencimiento =request.getParameter("venc");
String Precio =request.getParameter("precio");
if(Nombre==""){
out.print("<div class='alert alert-danger' role='alert'>valor vacio</div>");
}else if(Descripcion==""){
out.print("<div class='alert alert-danger' role='alert'>valor vacio</div>");
}else if(Categoria==""){
out.print("<div class='alert alert-danger' role='alert'>valor vacio</div>");
}else if(Elaboracion==""){
out.print("<div class='alert alert-danger' role='alert'>valor vacio</div>");
}else if(Vencimiento==""){
out.print("<div class='alert alert-danger' role='alert'>valor vacio</div>");
}else if(Precio==""){
out.print("<div class='alert alert-danger' role='alert'>valor vacio</div>");}
else{
try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("INSERT INTO productos1(nombre_producto, descripcion_producto, categoria_producto, fecha_elaboracion, fecha_caducidad, precio_venta) VALUES ('"+Nombre+"','"+Descripcion+"','"+Categoria+"','"+Elaboracion+"','"+Vencimiento+"','"+Precio+"');");
 out.print("<div class='alert alert-success' role='alert'>guardado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}else if(request.getParameter("listar").equals("modificar")){

String Nombre =request.getParameter("pro_nombre");
String Descripcion =request.getParameter("pro_des");
String Categoria =request.getParameter("cant");
String Elaboracion =request.getParameter("ela");
String Vencimiento =request.getParameter("venc");
String Precio =request.getParameter("precio");
String pk =request.getParameter("idproducto");
if(Nombre==""){
out.print("<div class='alert alert-success' role='alert'>valor vacio</div>");
}else{
 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("update  productos1 set nombre_producto='"+Nombre+"', descripcion_producto='"+Descripcion+"', categoria_producto='"+Categoria+"', fecha_elaboracion='"+Elaboracion+"', fecha_caducidad='"+Vencimiento+"',precio_venta='"+Precio+"' where id_producto='"+pk+"'");

        out.print("<div class='alert alert-success' role='alert'>modificado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}
else if(request.getParameter("listar").equals("eliminar")){
String pk =request.getParameter("idproducto_e");

 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("DELETE FROM productos1 WHERE id_producto='" + pk + "'");

        out.print("<div class='alert alert-success' role='alert'>eliminado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }

}
     %>
 