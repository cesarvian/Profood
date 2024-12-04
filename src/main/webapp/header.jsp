<%@page import="java.math.BigInteger" %> 
<%@page import="java.security.MessageDigest" %> 
<%
   HttpSession sesion = request.getSession(false);
if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
%>
<script>alert('Ud. debe de identificarse..!!');location.href='index.jsp';</script>
<%

                
                
}
String nombre =(String)sesion.getAttribute("usser") ;
String rol =(String)sesion.getAttribute("rol") ;
 %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link rel="shortcut icon" href="icon/favicon.ico" />
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="bower_components/morris.js/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="bower_components/jvectormap/jquery-jvectormap.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<script src="js/bunble.js">
            </script>
<script src="js/jquery.js">
            </script>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="vistainicio.jsp" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>PRO</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>PROFOOD</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
            
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                  <span class="hidden-xs"><%out.print(nombre);%></span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                    <p>
                      <%out.print(nombre);%> - Web Developer
                      <small>Member since Nov. 2012</small>
                    </p>
                  </li>
                 
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-right">
                      <a href="jsp/logout.jsp" class="btn btn-warning btn-flat" >Salir</a>
                    </div>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </nav>
      </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENU</li>
        <li class="active treeview">
          <a href="container.jsp">
              
         
            <i class="fa fa-dashboard"></i> <span>Mantenimiento</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
        <%
        if (rol.equals("user")){
        %>
            <li><a href="proveedoresvista.jsp"><i class="fa fa-circle-o"></i> Proveedores</a></li>
            <li><a href="productosvista.jsp"><i class="fa fa-circle-o"></i> Productos</a></li>
            <li><a href="ingredientesvista.jsp"><i class="fa fa-circle-o"></i> Ingredientes</a></li>
            <li><a href="vistacategoria.jsp"><i class="fa fa-circle-o"></i> Categorias</a></li>
        <%
            }else if (rol.equals("admin")){
        %>    
             <li><a href="proveedoresvista.jsp"><i class="fa fa-circle-o"></i> Proveedores</a></li>
            <li><a href="productosvista.jsp"><i class="fa fa-circle-o"></i> Productos</a></li>
            <li><a href="ingredientesvista.jsp"><i class="fa fa-circle-o"></i> Ingredientes</a></li>
            <li><a href="vistacategoria.jsp"><i class="fa fa-circle-o"></i> Categorias</a></li>
            <li><a href="personalvista.jsp"><i class="fa fa-circle-o"></i> Personales</a></li>
            <li><a href="usuarios.jsp"><i class="fa fa-circle-o"></i> Usuarios</a></li>
            
            <%
                }
            %>
          </ul>
        </li>
        <li class="treeview">
          <a href="container.jsp">
            <i class="fa fa-files-o"></i>
            <span>Compras</span>
            <span class="pull-right-container">
              <span class="label label-primary pull-right">1</span>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="container.jsp"><i class="fa fa-circle-o"></i> Registro de compras</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="vistainventario.jsp">
            <i class="fa fa-th"></i> <span>Inventario</span>
            <span class="pull-right-container">
              <small class="label pull-right bg-green">2</small>
            </span>
            </a>
             <ul class="treeview-menu">
            <li class="active"><a href="vistainventario.jsp"><i class="fa fa-circle-o"></i> Materia prima</a></li>
            <li class="active"><a href="container.jsp"><i class="fa fa-circle-o"></i>Producto terminado</a></li>
          </ul>
          
        </li>
         <li class="treeview">
          <a href="vistainventario.jsp">
            <i class="fa fa-files-o"></i> <span>Producción</span>
            <span class="pull-right-container">
              <small class="label pull-right bg-green">3</small>
            </span>
            <ul class="treeview-menu">
            <li class="active"><a href="recetasvista.jsp"><i class="fa fa-circle-o"></i> Recetas</a></li>
            <li class="active"><a href="produccionvista.jsp"><i class="fa fa-circle-o"></i>Orden de produccion</a></li>
          </ul>
          </a>
              
          
        </li>
        
        
        
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      
      
    </section>
