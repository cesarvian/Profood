<%@include file="conexion1.jsp"%>
<%
    HttpSession sesion = request.getSession();
    if (request.getParameter("listar").equals("cargar")) {

        String codproveedor = request.getParameter("codproveedor");
        String fecharegistro = request.getParameter("fecharegistro");
        String codingrediente = request.getParameter("codingrediente");
        String cantidad = request.getParameter("cantidad");
        String precio = request.getParameter("precio");

        // Validar valores nulos o vacíos
        if (codproveedor == null || codproveedor.isEmpty()) {
            out.println("Error: Código del proveedor es nulo o vacío.");
            return;
        }

        if (fecharegistro == null || fecharegistro.isEmpty()) {
            out.println("Error: La fecha de registro es nula o vacía.");
            return;
        }

        if (codingrediente == null || codingrediente.isEmpty()) {
            out.println("Error: Código de ingrediente es nulo o vacío.");
            return;
        }

        if (cantidad == null || cantidad.isEmpty()) {
            out.println("Error: Cantidad es nula o vacía.");
            return;
        }

        if (precio == null || precio.isEmpty()) {
            out.println("Error: Precio es nulo o vacío.");
            return;
        }

        // Convertir cantidad y precio a tipos numéricos
        try {
            Integer cantidadInt = Integer.parseInt(cantidad);
            Float precioFloat = Float.parseFloat(precio);

            Statement st = null;
            ResultSet rs = null;
            ResultSet pk = null;
            st = conn.createStatement();
            rs = st.executeQuery("SELECT id FROM compras where estado='Pendiente';");
            if (rs.next()) {
                // Insertar detalle con idcompra existente
                st.executeUpdate("insert into detallecompras (idcompra,idingrediente,cantidad,precio) values ('" + rs.getString(1) + "','" + codingrediente + "','" + cantidadInt + "','" + precioFloat + "')");
            } else {
                // Insertar nueva compra y su detalle
                st.executeUpdate("insert into compras (idproveedor,fecha,iduser,usuario) values ('" + codproveedor + "','" + fecharegistro + "','" + sesion.getAttribute("id") + "','" + sesion.getAttribute("usser") + "')");
                pk = st.executeQuery("SELECT id FROM compras where estado='Pendiente';");
                pk.next();
                st.executeUpdate("insert into detallecompras (idcompra,idingrediente,cantidad,precio) values ('" + pk.getString(1) + "','" + codingrediente + "','" + cantidadInt + "','" + precioFloat + "')");
            }

        } catch (NumberFormatException e) {
            out.println("Error: Cantidad o precio no son numéricos.");
        } catch (Exception e) {
            out.println("Error PSQL: " + e);
        }

    } else if (request.getParameter("listar").equals("listar")) {
        // Código de listar
    }
%>
