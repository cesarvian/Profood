<%@include file="conexion1.jsp"%>
<%
    
if(request.getParameter("listar").equals("listar")){

   try{
        Statement st=null;
        ResultSet rs=null;
        st=conn.createStatement();
        rs=st.executeQuery("select * from personales ");
    while(rs.next())
{%>
<tr>
    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(3));%></td>
    <td><%out.print(rs.getString(4));%></td>
    <td><i title="modificar" class="fa fa-pencil-square" onclick="rellenaredit('<%out.print(rs.getString(1));%>','<%out.print(rs.getString(2));%>','<%out.print(rs.getString(3));%>','<%out.print(rs.getString(4));%>')"></i><i title="eliminar" class="fa fa-trash" onclick="$('#idpersonal_e').val('<%out.print(rs.getString(1));%>')" data-toggle="modal" data-target="#exampleModal"></i><a class="fa fa-eye" href = 'vistareportper1.jsp?idper=<%=rs.getString(1)%>'></a></td>
</tr>

<% 
    }

}catch(Exception e){
     out.print("error pp"+e);
    }
}else if(request.getParameter("listar").equals("cargar")){

String Nombre =request.getParameter("nom");
String Apellido =request.getParameter("ape");
String Direccion =request.getParameter("direc");
if(Nombre==""){
out.print("<div class='alert alert-danger' role='alert'>valor vacio</div>");
}else if(Apellido==""){
out.print("<div class='alert alert-danger' role='alert'>valor vacio</div>");
}else if(Direccion==""){
out.print("<div class='alert alert-danger' role='alert'>valor vacio</div>");}
else{
try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("INSERT INTO personales(per_nombre,per_apellido,per_direccion) VALUES ('"+Nombre+"','"+Apellido+"','"+Direccion+"')");

        out.print("<div class='alert alert-success' role='alert'>guardado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}else if(request.getParameter("listar").equals("modificar")){

String Nombre =request.getParameter("nom");
String Apellido =request.getParameter("ape");
String Direccion =request.getParameter("direc");
String pk =request.getParameter("idpersonal");
if(Nombre==""){
out.print("<div class='alert alert-success' role='alert'>valor vacio</div>");
}else{
 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("update  personales set per_nombre='"+Nombre+"', per_apellido='"+Apellido+"', per_direccion='"+Direccion+"' where idpersonal='"+pk+"'");

        out.print("<div class='alert alert-success' role='alert'>modificado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }
}
}
else if(request.getParameter("listar").equals("eliminar")){
String pk =request.getParameter("idpersonal_e");

 try{
        Statement st=null;
        st=conn.createStatement();
        st.executeUpdate("DELETE FROM personales WHERE idpersonal='" + pk + "'");

        out.print("<div class='alert alert-success' role='alert'>eliminado correcto</div>");

}catch(Exception e){
     out.print("no funciona"+e);
    }

}
     %>
 