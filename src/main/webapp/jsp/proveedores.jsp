
<%@include file="conexion1.jsp"%>
<%
    
if(request.getParameter("listar").equals("listar")){

   try{
        Statement st=null;
        ResultSet rs=null;
        st=conn.createStatement();
        rs=st.executeQuery("select * from proveedores order by idproveedor");
    while(rs.next())
{%>
<tr>
    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(3));%></td>
    <td><i title="modificar" class="fa fa-pencil-square" onclick="rellenaredit('<%out.print(rs.getString(1));%>','<%out.print(rs.getString(2));%>','<%out.print(rs.getString(3));%>')"></i><i title="eliminar" class="fa fa-trash" onclick="$('#idproveedor_e').val('<%out.print(rs.getString(1));%>')" data-toggle="modal" data-target="#exampleModal"></i><a class="fa fa-eye" href = 'vistareporteproveedor.jsp?codproveedor=<%=rs.getString(1)%>'></a></td>
</tr>

<% 
    }

}catch(Exception e){
     out.print("error pp"+e);
    }
}else if(request.getParameter("listar").equals("cargar")){

String razon =request.getParameter("razon_social");
String ruc =request.getParameter("ruc");
if(razon==""){
out.print("<div class='alert alert-danger' role='alert'>valor vacio</div>");
}else if(ruc==""){
out.print("<div class='alert alert-danger' role='alert'>valor vacio</div>");}
else{
try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("INSERT INTO proveedores(nombre,rsocial) VALUES ('"+razon+"','"+ruc+"')");

        out.print("<div class='alert alert-success' role='alert'>guardado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}else if(request.getParameter("listar").equals("modificar")){

String razon =request.getParameter("razon_social");
String ruc =request.getParameter("ruc");
String pk =request.getParameter("idproveedor");
if(razon==""){
out.print("<div class='alert alert-success' role='alert'>valor vacio</div>");
}else{
 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("update  proveedores set nombre='"+razon+"', rsocial='"+ruc+"' where idproveedor='"+pk+"'");

        out.print("<div class='alert alert-success' role='alert'>modificado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}
else if(request.getParameter("listar").equals("eliminar")){
String pk =request.getParameter("idproveedor_e");

 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("DELETE FROM proveedores WHERE idproveedor='" + pk + "'");

        out.print("<div class='alert alert-success' role='alert'>eliminado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }

}
     %>
 