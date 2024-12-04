<%@include file="conexion1.jsp"%>
<%
    
if(request.getParameter("listar").equals("listar")){

   try{
        Statement st=null;
        ResultSet rs=null;
        st=conn.createStatement();
        rs=st.executeQuery("select * from inventario ");
    while(rs.next())
{%>
<tr>
    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(3));%></td>
    <td><%out.print(rs.getString(4));%></td>
    <td><%out.print(rs.getString(5));%></td>
    <td><%out.print(rs.getString(6));%></td>
    
    <td><i title="modificar" class="fa fa-pencil-square" onclick="rellenaredit('<%out.print(rs.getString(1));%>','<%out.print(rs.getString(2));%>','<%out.print(rs.getString(3));%>','<%out.print(rs.getString(4));%>','<%out.print(rs.getString(5));%>','<%out.print(rs.getString(6));%>')"></i><i title="eliminar" class="fa fa-trash" onclick="$('#idproducto_e').val('<%out.print(rs.getString(1));%>')" data-toggle="modal" data-target="#exampleModal"></i><a class="fa fa-eye" href = 'vistareporteproductos.jsp?codproducto=<%=rs.getString(1)%>'></a></td>
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
String Precio =request.getParameter("pre");



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
        st.executeUpdate("INSERT INTO inventario(id_producto, nombre_producto, cantidad, precio_unitario,  fecha_actualizacion) VALUES ('"+Nombre+"','"+Descripcion+"','"+Categoria+"','"+Elaboracion+"','"+Vencimiento+"');");
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

String pk =request.getParameter("idproducto");
if(Nombre==""){
out.print("<div class='alert alert-success' role='alert'>valor vacio</div>");
}else{
 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("update  inventario set id_producto='"+Nombre+"', nombre_producto='"+Descripcion+"', cantidad='"+Categoria+"', precio_unitario='"+Elaboracion+"', fecha_actualizacion='"+Vencimiento+"' where id_producto='"+pk+"'");

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
        st.executeUpdate("DELETE FROM inventario WHERE id='" + pk + "'");

        out.print("<div class='alert alert-success' role='alert'>eliminado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }

}
     %>