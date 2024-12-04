<%@include file="conexion1.jsp"%>

<%    
    HttpSession sesion = request.getSession();
    if (request.getParameter("listar").equals("cargar")) {

        /*DATOS PARA LA CABECERA*/
        //idproveedor
        //fecha
        /*DATOS PARA EL DETALLE*/
        //idproducto
        //cantidad
        //precio
        String codproveedor = request.getParameter("codproveedor");
        String fecharegistro = request.getParameter("fecharegistro");
        String codproducto = request.getParameter("codproducto");
        String cantidad = request.getParameter("cantidad");
        String precio = request.getParameter("precio");
        //out.println(codproveedor + ',' + fecharegistro + ',' + codproducto + ',' + cantidad + ',' + precio);
        try {
            Statement st = null;
            ResultSet rs = null;
            ResultSet pk = null;
            st = conn.createStatement();
            rs = st.executeQuery("SELECT id FROM compras where estado='Pendiente';");
            if (rs.next()) {
                //out.println("Existe cabecera");
                st.executeUpdate("insert into detallecompras (idcompra,idproducto,cantidad,precio)values('" + rs.getString(1) + "','" + codproducto + "','" + cantidad + "','" + precio + "')");
            } else {
                //out.println("NO existe cabecera");

                st.executeUpdate("insert into compras (idproveedor,fecha,iduser,usuario)values('" + codproveedor + "','" + fecharegistro + "','"+sesion.getAttribute("id")+"','"+sesion.getAttribute("usser")+"')");
                pk = st.executeQuery("SELECT id FROM compras where estado='Pendiente';");
                pk.next();
                st.executeUpdate("insert into detallecompras (idcompra,idproducto,cantidad,precio)values('" + pk.getString(1) + "','" + codproducto + "','" + cantidad + "','" + precio + "')");
                //tok.executeUpdate("insert into inventario (idproducto,cantidad,precio)values('" + codproducto + "','" + cantidad + "','" + precio + "')");
            }

        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    } else if (request.getParameter("listar").equals("listar")) {
        try {
            Statement st = null;
            ResultSet rs = null;
            ResultSet pk = null;
            st = conn.createStatement();
            pk = st.executeQuery("SELECT id FROM compras where estado='Pendiente';");
            pk.next();
            rs = st.executeQuery("select dt.id,p.nombre_ingrediente,dt.cantidad, dt.precio from detallecompras dt, ingredientes p where dt.idproducto=p.id_ingrediente and dt.idcompra='" + pk.getString(1) + "'");

            while (rs.next()) {
                String cantidad = rs.getString(3);
                String precio = rs.getString(4);
                Integer cantidad1 = Integer.parseInt(cantidad);
                float precio1 = Float.parseFloat(precio);
                float calcular = cantidad1 * precio1;
%>
<tr>
    <td><i class="fa fa-trash" data-toggle="modal" data-target="#exampleModal" onclick="$('#pkdel').val(<%out.print(rs.getString(1));%>)"></i></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(3));%></td>
    <td><%out.print(rs.getString(4));%></td>
    <td><%out.print(calcular);%></td>

</tr>
<%

        }
    } catch (Exception e) {
        out.println("error PSQL" + e);
    }
} else if (request.getParameter("listar").equals("listarsuma")) {
    try {
        Statement st = null;
        ResultSet rs = null;
        ResultSet pk = null;
        st = conn.createStatement();
        pk = st.executeQuery("SELECT id FROM compras where estado='Pendiente';");
        pk.next();
        rs = st.executeQuery("select dt.id,p.descripcion_producto,dt.cantidad, dt.precio from detallecompras dt, productos1 p where dt.idproducto=p.id_producto and dt.idcompra='" + pk.getString(1) + "' ");
        float sumador = 0;
        while (rs.next()) {
            String cantidad = rs.getString(3);
            String precio = rs.getString(4);
            Integer cantidad1 = Integer.parseInt(cantidad);
            float precio1 = Float.parseFloat(precio);
            float calcular = cantidad1 * precio1;
            sumador += calcular;
        }
        out.println(sumador);
    } catch (Exception e) {
        out.println("error PSQL" + e);
    }
} else if (request.getParameter("listar").equals("elimregcompra")) {

    String pk = request.getParameter("pkd");
    try {
        Statement st = null;
        st = conn.createStatement();
        st.executeUpdate("delete from detallecompras where id=" + pk + "");
        //out.println("<div class='alert alert-success' role='alert'>  Datos eliminados con exitos!</div>");
    } catch (Exception e) {
        out.println("error PSQL" + e);
    }
} else if (request.getParameter("listar").equals("cancelcompra")) {

    try {
        Statement st = null;
        ResultSet pk = null;
        st = conn.createStatement();
        pk = st.executeQuery("SELECT id FROM compras where estado='Pendiente';");
        pk.next();
        st.executeUpdate("update compras set estado='Cancelado' where id=" + pk.getString(1) + "");
        //out.println("<div class='alert alert-success' role='alert'>  Datos modificados con exitos!</div>");
    } catch (Exception e) {
        out.println("error PSQL" + e);
    }
} else if (request.getParameter("listar").equals("finalcompra")) {

    try {
        Statement st = null;
        ResultSet pk = null;
        st = conn.createStatement();
        pk = st.executeQuery("SELECT id FROM compras WHERE estado='Pendiente';");
        pk.next();

        // Obtener el ID de la compra finalizada
        int idCompra = pk.getInt(1);

        // Obtener los detalles de la compra
        ResultSet rsDetalles = st.executeQuery("SELECT idproducto, cantidad FROM detallecompras WHERE idcompra = " + idCompra);

        while (rsDetalles.next()) {
            int idProducto = rsDetalles.getInt(1);
            int cantidadComprada = rsDetalles.getInt(2);

            // Actualizar el inventario utilizando la nueva tabla
            String updateInventario = "UPDATE inventario SET cantidad = cantidad - ? WHERE id = ?";
            PreparedStatement pstmt = conn.prepareStatement(updateInventario);
            pstmt.setInt(1, cantidadComprada);
            pstmt.setInt(2, idProducto);
            pstmt.executeUpdate();
        }

        // Finalizar la compra
        st.executeUpdate("UPDATE compras SET estado='Finalizado', total=" + request.getParameter("total") + " WHERE id=" + pk.getString(1) + "");
        //out.println("<div class='alert alert-success' role='alert'>  Datos modificados con exitos!</div>");
    } catch (Exception e) {
        out.println("error PSQL" + e);
    }
} else if (request.getParameter("listar").equals("listarcompras")) {
    try {
        Statement st = null;
        ResultSet rs = null;
        st = conn.createStatement();

        rs = st.executeQuery("select c.id,to_char(c.fecha,'dd-mm-YYYY'),p.rsocial,c.total from compras c, proveedores p where c.idproveedor = p.idproveedor and c.estado='Finalizado' order by id");

        while (rs.next()) {

%>
<tr>

    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(3));%></td>
    <td><%out.print(rs.getString(4));%></td>
    <td><i class="fa fa-trash" data-toggle="modal" data-target="#exampleModal" onclick="$('#pkanul').val(<%out.print(rs.getString(1));%>)"></i><a class="fa fa-eye" href = 'vistareportecompras.jsp?codcompras=<%=rs.getString(1)%>'></a></td>
</tr>
<%

            }
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    } else if (request.getParameter("listar").equals("anularcompras")) {
        
        try {
            Statement st = null;
            ResultSet pk = null;
            st = conn.createStatement();
            st.executeUpdate("update compras set estado='Anulado' where id=" + request.getParameter("idpkcompra") + "");
            //out.println("<div class='alert alert-success' role='alert'>  Datos modificados con exitos!</div>");
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    }
else if (request.getParameter("listar").equals("informe")) {
    try {
        Statement st = null;
        ResultSet rs = null;
        st = conn.createStatement();

        rs = st.executeQuery("select c.id,to_char(c.fecha,'dd-mm-YYYY'),p.rsocial,c.total from compras c, proveedores p where c.idproveedor = p.idproveedor and c.estado='Finalizado' order by id");

        while (rs.next()) {

%>
<tr>

    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td><%out.print(rs.getString(3));%></td>
    <td><%out.print(rs.getString(4));%></td>
    <td><i class="fa fa-trash" data-toggle="modal" data-target="#exampleModal" onclick="$('#pkanul').val(<%out.print(rs.getString(1));%>)"></i><a class="fa fa-eye" href = 'vistareportecompras.jsp?codcompras=<%=rs.getString(1)%>'></a></td>
</tr>
<%

            }
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    }
%>