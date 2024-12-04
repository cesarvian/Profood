

<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@include file="conexion1.jsp"%>

<%
    HttpSession sesion = request.getSession();

    if (sesion.getAttribute("logueado") != null && sesion.getAttribute("logueado").equals("1")) {
        response.sendRedirect("../vistainicio.jsp");
        return; 
    }

    if (request.getParameter("btnLogin") != null) {
        String user = request.getParameter("nombre_usuario");
        String password =request.getParameter("contrasena");

        Statement st = null;
        ResultSet rs = null;

        try {
            String query = "SELECT * FROM usuarios WHERE nombre_usuario = ? AND contrasena = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, user);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                sesion.setAttribute("logueado", "1");
                sesion.setAttribute("usser", rs.getString("nombre_usuario"));
                sesion.setAttribute("id", rs.getString("id_usuario"));
               
                sesion.setAttribute("rol", rs.getString("rol_usuario"));
                response.sendRedirect("../vistainicio.jsp");
                
            } else {
                out.println("<div class=\"alert alert-danger\" role=\"alert\">Usuario no válido</div>");
            }
        } catch (SQLException e) {
            out.print("Error en la base de datos: " + e.getMessage());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    out.print("Error cerrando la conexión: " + e.getMessage());
                }
            }
        }
    }
%>