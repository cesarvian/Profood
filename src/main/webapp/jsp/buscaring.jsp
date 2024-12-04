<%@include file="conexion1.jsp"%>
<%    if (request.getParameter("listar").equals("buscarcategoria")) {
        try {
            Statement st = null;
            ResultSet rs = null;
            st = conn.createStatement();
            rs = st.executeQuery("SELECT * FROM categoria order by id_categoria;");
%>
<option value="">Seleccionar</option>
<%
                while (rs.next()) {%>
<option value="<%out.print(rs.getString(1));%>,<%out.print(rs.getString(3));%>"><%out.print(rs.getString(2));%>|<%out.print(rs.getString(3));%></option>
<%}
        } catch (Exception e) {
            out.println("error PSQL" + e);
        }
    
%>