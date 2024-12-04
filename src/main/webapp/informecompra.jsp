<%@ page import="net.sf.jasperreports.engine.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="net.sf.jasperreports.engine.util.*" %>
<%@ include file="jsp/conexion1.jsp" %>
<%@ page import="java.text.SimpleDateFormat" %> 
<%@ page import="java.util.Date" %> 

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
                        try{
                        /*INDICAMOS EL LUGAR DONDE SE ENCUENTRA NUESTRO ARCHIVO JASPER*/
                        File reportFile=new File(application.getRealPath("reportes/report1.jasper"));
                        /**/
                        Map parametros=new HashMap();
                        SimpleDateFormat formatter =new SimpleDateFormat("yyyy-MM-dd",Locale.ENGLISH);
                        String feinicio= request.getParameter("fechainicio");
                                                String fefinal= request.getParameter("fechafinal");
Date fechain=formatter.parse(feinicio);
Date fechafi =formatter.parse(fefinal);
                        //String codigo="2";
                        parametros.put("fechaini",fechain);
                                                parametros.put("fechafin",fechafi);



                        
                        byte [] bytes= JasperRunManager.runReportToPdf(reportFile.getPath(), parametros,conn);
                        response.setContentType("application/pdf");
                        response.setContentLength(bytes.length);

                        ServletOutputStream output=response.getOutputStream();
                        response.getOutputStream();
                        output.write(bytes,0,bytes.length);
                        output.flush();
                        output.close();
                        }
                        catch(java.io.FileNotFoundException ex)
                        {
                            ex.getMessage();
                        }
                    %>

