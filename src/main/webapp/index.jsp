
<!DOCTYPE html>
<html>
 <head>
        <title>LOGIN</title>
       <link rel="shortcut icon" href="icon/favicon.ico" />
       <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<script src="js/bunble.js">
            </script>
<script src="js/jquery.js">
            </script>
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>
<body>
    <div class="container d-flex justify-content-center align-items-center h-100">
    <div class="card border-primary bg-light" style="width: 35rem;">
      <div class="card-header text-center bg-primary text-white">
          
           <h1 class="display-4">PROFOOD</h1>
        <h3 class="display-4">INICIO DE SESIÓN</h3>
      </div>
      <div class="card-body">
        </div>
                <form method="post" action="jsp/login.jsp">
                    <div class="form-group">
                        <label for="nombre_usuario">Usuario:</label>
                        <input type="text" class="form-control" id="nombre_usuario" name="nombre_usuario" required>
                    </div>
                    <div class="form-group">
                        <label for="contrasena">Contraseña:</label>
                        <input type="password" class="form-control" id="contrasena" name="contrasena" required>
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="remember" name="remember">
                        <label class="form-check-label" for="remember">Recordarme</label>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block" name="btnLogin">INGRESAR</button>
                    <div id="respuesta"></div>
                </form>
            </div>
        </div>
        <style>
            
body {
            background-color: #f0f0f0;  /* Cambia el color de fondo del cuerpo */
        }
            .container {
    width: 300px;
    margin: 0 auto;
}
    /* ... resto de tus estilos */
    .card {
      /* Opcional: para redondear las esquinas */
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }
  </style>
    </div>
</body>
</html>

   