<%@include file="conexion.jsp"%>
<% if (request.getParameter("listar").equals("listar")) {
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM CIUDADES ORDER BY CIUID;");
            while (rs.next()) {
%>
<tr>
    <td><%out.print(rs.getString(1));%></td>
    <td><%out.print(rs.getString(2));%></td>
    <td>
        <!-- Ícono de edición -->
        <i class="fa fa-edit" onclick="rellenaredit('<% out.print(rs.getString(1)); %>', '<% out.print(rs.getString(2)); %>')"></i>
        
        <!-- Espacio entre los íconos -->
        <span style="margin-right: 30px;"></span>
        
        <!-- Ícono de eliminación (con modal) -->
        <i class="fa fa-trash" data-toggle="modal" data-target="#modal-default" onclick="$('#ciuid_e').val('<% out.print(rs.getString(1)); %>')"></i>
    </td>
</tr>
<%}
        } catch (Exception e) {
            out.println("Error PSQL: " + e);
        }
    } else if (request.getParameter("listar").equals("cargar")) {

        String ciudad = request.getParameter("ciunombre").toUpperCase();

        try {
            // Check for duplicates
            PreparedStatement psCheck = conn.prepareStatement("SELECT ciunombre FROM CIUDADES WHERE UPPER(ciunombre) = ?");
            psCheck.setString(1, ciudad);
            ResultSet rsCheck = psCheck.executeQuery();

            if (rsCheck.next()) {
                out.println("<div class='alert alert-warning' role='alert'>La ciudad ya existe!</div>");
            } else {
                // Insert the new city
                PreparedStatement ps = conn.prepareStatement("INSERT INTO CIUDADES(ciunombre) VALUES (?)");
                ps.setString(1, ciudad);
                int rowsAffected = ps.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("<div class='alert alert-success' role='alert'>Datos insertados con éxito!</div>");
                } else {
                    out.println("<div class='alert alert-danger' role='alert'>No se pudo insertar el registro.</div>");
                }
            }
        } catch (Exception e) {
            out.println("Error PSQL: " + e);
        }

    } else if (request.getParameter("listar").equals("modificar")) {

        String ciudad = request.getParameter("ciunombre").toUpperCase();
        int pk = Integer.parseInt(request.getParameter("ciuid"));

        try {
            // Check for duplicates, excluding the current record
            PreparedStatement psCheck = conn.prepareStatement("SELECT ciunombre FROM CIUDADES WHERE UPPER(ciunombre) = ? AND ciuid <> ?");
            psCheck.setString(1, ciudad);
            psCheck.setInt(2, pk);
            ResultSet rsCheck = psCheck.executeQuery();

            if (rsCheck.next()) {
                out.println("<div class='alert alert-warning' role='alert'>La ciudad ya existe!</div>");
            } else {
                // Update the city
                PreparedStatement ps = conn.prepareStatement("UPDATE CIUDADES SET ciunombre = ? WHERE ciuid = ?");
                ps.setString(1, ciudad);
                ps.setInt(2, pk);
                int rowsAffected = ps.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("<div class='alert alert-success' role='alert'>Datos actualizados con éxito!</div>");
                } else {
                    out.println("<div class='alert alert-danger' role='alert'>No se pudo actualizar el registro.</div>");
                }
            }
        } catch (Exception e) {
            out.println("Error PSQL: " + e);
        }
    } else if (request.getParameter("listar").equals("eliminar")) {
        int pk = Integer.parseInt(request.getParameter("ciuid"));

        try {
            PreparedStatement ps = conn.prepareStatement("DELETE FROM CIUDADES WHERE ciuid = ?");
            ps.setInt(1, pk);
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<div class='alert alert-danger' role='alert'>Datos eliminados con éxito!</div>");
            } else {
                out.println("<div class='alert alert-warning' role='alert'>No se encontró ningún registro para eliminar.</div>");
            }
        } catch (Exception e) {
            out.println("Error PSQL: " + e);
        }
    }
%>
