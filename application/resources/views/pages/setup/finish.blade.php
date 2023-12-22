<div class="setup-welcome">

    <!--image-->
    <div class="x-image">
        <img src="public/images/success.png">
    </div>

    <!--title-->
    <div class="x-title">
        <h2>Felicidades!!</h2>
    </div>

    <div class="x-subtitle">
        La configuración ha finalizado. Ya puede empezar a utilizar su aplicación.
    </div>

    <div class="alert alert-warning">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">×</span> </button>
        <h3 class="text-warning"><i class="fa fa-exclamation-triangle"></i> Un último paso!</h3> 
        Si deseas visitar más de nuestros servicios entrar a nuestra página de <strong>PERSEO</strong>. Esto desde el siguiente enlace. 
    </div>

    <div class="cronjob">
        <label class="col-12 control-label col-form-label">Enlace Página Perseo</label>
        <input class="col-12 form-control form-control-sm" type="text" value="{{ $cronjob_path }}" disabled>
    </div>


    <div class="x-button m-t-20">
        <a href="{{ url('/login') }}" class="btn waves-effect waves-light btn-block btn-info">Ir a mi panel de control</a>
    </div>


</div>