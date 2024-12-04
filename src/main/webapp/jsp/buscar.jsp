<%@include file="conexion1.jsp"%>

<%
    String listar = request.getParameter("listar");
    if (listar!= null) {
        try {
            Statement st = conn.createStatement();
            ResultSet rs = null;
            if (listar.equals("buscarproveedor")) {
                rs = st.executeQuery("SELECT * FROM proveedores ORDER BY idproveedor ASC");
%>

    <option value="">Seleccionar</option>
    <%
        while (rs.next()) {
    %>
    <option value="<%=rs.getString(1)%>,<%=rs.getString(3)%>"><%=rs.getString(2)%>|<%=rs.getString(3)%></option>
    <%
        }
    %>

<%
            } else if (listar.equals("buscararticulo")) {
                rs = st.executeQuery("SELECT * FROM ingredientes ORDER BY id_ingrediente ASC");
%>

    <option value="">Seleccionar</option>
    <%
        while (rs.next()) {
    %>
    <option value="<%=rs.getString(1)%>,<%=rs.getString(7)%>"><%=rs.getString(2)%>|<%=rs.getString(7)%></option>
    <%
        }
    %>

<%
            } else if (listar.equals("buscarcat")) {
                rs = st.executeQuery("SELECT * FROM categoria ORDER BY id_categoria ASC");
%>

    <option value="">Seleccionar</option>
    <%
        while (rs.next()) {
    %>
    <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
    <%
        }
    %>

<%
            }
        } catch (Exception e) {
            out.println("Error executing query: " + e);
        }
    }
%>