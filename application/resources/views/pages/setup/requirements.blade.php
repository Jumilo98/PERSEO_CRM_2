<div class="setup-inner-steps setup-requirements">

    <h5 class="text-info"> Servidor - Requerimientos PHP </h5>
    <table class="table table-sm table-bordered m-b-40">
        <!--check-->
        <tr>
            <td class="p-l-15">
                Versión de PHP soportada 7.3 | 7.4 |  8.0 | 8.1 - <strong>Tu Versión <span class="badge-pill badge-info">{{ phpversion() }}</span></strong>
            </td>
            <td class="x-td-checks">
                @if($requirements['php_version'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>
        <!--check-->
        <tr>
            <td class="p-l-15">
                Base de Datos MySQL (mysqli)
            </td>
            <td class="x-td-checks">
                @if($requirements['mysql'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>
        <!--check-->
        <tr>
            <td class="p-l-15">
                Extensión PHP BCMath 
            </td>
            <td class="x-td-checks">
                @if($requirements['bcmath'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>
        <!--check-->
        <tr>
            <td class="p-l-15">
                Extensión PHP Ctype 
            </td>
            <td class="x-td-checks">
                @if($requirements['ctype'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>
        <!--check-->
        <tr>
            <td class="p-l-15">
                Extensión PHP JSON
            </td>
            <td class="x-td-checks">
                @if($requirements['json'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>
        <!--check-->
        <tr>
            <td class="p-l-15">
              Extensión PHP Mbstring
            </td>
            <td class="x-td-checks">
                @if($requirements['mbstring'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>
        <!--check-->
        <tr>
            <td class="p-l-15">
              Extensión PHP OpenSSL 
            </td>
            <td class="x-td-checks">
                @if($requirements['openssl'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>
        <!--check-->
        <tr>
            <td class="p-l-15">
             Extensión PHP PDO 
            </td>
            <td class="x-td-checks">
                @if($requirements['pdo'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>
        <!--check-->
        <tr>
            <td class="p-l-15">
                Extensión PHP Tokenizer
            </td>
            <td class="x-td-checks">
                @if($requirements['tokenizer'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>
        <!--check-->
        <tr>
            <td class="p-l-15">
                Extensión PHP XML 
            </td>
            <td class="x-td-checks">
                @if($requirements['xml'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>
        <!--check-->
        <tr>
            <td class="p-l-15">
                Extensión PHP FILEINFO
            </td>
            <td class="x-td-checks">
                @if($requirements['fileinfo'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>

        <!--check-->
        <tr>
            <td class="p-l-15">
                GD Graphics Library (PHP GD)
            </td>
            <td class="x-td-checks">
                @if($requirements['gd'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>
    </table>

    <h5 class="text-info"> Carpetas - Permiso de escritura</h5>
    <table class="table table-sm table-bordered">
        <!--/updates-->
        <tr>
            <td class="p-l-15">
                /updates
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_updates'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>


        <!--/storage-->
        <tr>
            <td class="p-l-15">
                /storage
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_storage'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>


        <!--/storage/avatars-->
        <tr>
            <td class="p-l-15">
                /storage/avatars
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_storage_avatars'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>


        <!--/storage/logos-->
        <tr>
            <td class="p-l-15">
                /storage/logos
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_storage_logos'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>
        <!--/storage/logos/client-->
        <tr>
            <td class="p-l-15">
                /storage/logos/clients
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_storage_logos_clients'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>
        <!--/storage/logos/app-->
        <tr>
            <td class="p-l-15">
                /storage/logos/app
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_storage_logos_app'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>
        <!--/storage/files-->
        <tr>
            <td class="p-l-15">
                /storage/files
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_storage_files'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>
        <!--/storage/temp-->

        <tr>
            <td class="p-l-15">
                /storage/temp
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_storage_temp'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>

        <!--/application/storage/app-->
        <tr>
            <td class="p-l-15">
                /application/storage/app
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_app_storage_app'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>

        <!--/application/storage/app/public-->
        <tr>
            <td class="p-l-15">
                /application/storage/app/public
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_app_storage_app_public'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>


        <!--/application/storage/cache-->
        <tr>
            <td class="p-l-15">
                /application/storage/cache
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_app_storage_cache'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>

        <!--/application/storage/cache/data-->
        <tr>
            <td class="p-l-15">
                /application/storage/cache/data
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_app_storage_cache_data'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>


        <!--/application/storage/logs-->
        <tr>
            <td class="p-l-15">
                /application/storage/logs
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_app_storage_logs'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>

        <!--/application/storage/framework-->
        <tr>
            <td class="p-l-15">
                /application/storage/framework
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_app_storage_framework'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>


        <!--/application/storage/framework/cache-->
        <tr>
            <td class="p-l-15">
                /application/storage/framework/cache
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_app_storage_framework_cache'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>

        <!--/application/storage/framework/cache/data-->
        <tr>
            <td class="p-l-15">
                /application/storage/framework/cache/data
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_app_storage_framework_cache_data'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>


        <!--/application/storage/framework/sessions-->
        <tr>
            <td class="p-l-15">
                /application/storage/framework/sessions_
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_app_storage_framework_sessions'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>


        <!--/application/storage/framework/testing-->
        <tr>
            <td class="p-l-15">
                /application/storage/framework/testing
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_app_storage_framework_testing'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>


        <!--/application/storage/framework/views-->
        <tr>
            <td class="p-l-15">
                /application/storage/framework/views
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_app_storage_framework_views'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>

        <!--/application/bootstrap/cache-->
        <tr>
            <td class="p-l-15">
                /application/bootstrap/cache
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_app_bootstrap_cache'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>

        <!--/application/storage/app/purifier-->
        <tr>
            <td class="p-l-15">
                /application/storage/app/purifier
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_app_storage_app_purifier'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>

        <!--/application/storage/app/purifier/HTML-->
        <tr>
            <td class="p-l-15">
                /application/storage/app/purifier/HTML
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_app_storage_app_purifier_html'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>

    </table>


    <h5 class="text-info"> Archivos - Permiso de escritura</h5>
    <table class="table table-sm table-bordered">
        <!--/application/.env-->
        <tr>
            <td class="p-l-15">
                /application/.env (file)
            </td>
            <td class="x-td-checks">
                @if($requirements['dir_app_env'])
                <span class="x-checks x-check-passed"><i class="sl-icon-check"></i></span>
                @else
                <span class="x-checks x-check-failed"><i class="sl-icon-close"></i></span>
                @endif
            </td>
        </tr>
    </table>


    <!--continue-->
    <div class="x-button text-right p-t-20">
        @if($error['count'] > 0)
        <!--warning-->
        <div class="alert alert-danger text-left">
            <h3 class="text-warning"><i class="fa fa-exclamation-triangle"></i> Error</h3>
            No se cumplen uno o varios de los requisitos mínimos. Puede ponerse en contacto con su proveedor de
            ayuda (puede proporcionarles una captura de esta pantalla).
            También puede enviarnos un correo electrónico de asistencia a <strong> desarrollo@perseo.com </strong>
        </div>
        <!--view server info-->
        <a type="button" class="btn waves-effect waves-light btn-outline-secondary" href="{{url('setup/serverinfo') }}"
            target="_blank">Ver información del servidor</a>
        @else
        <button type="button" class="btn waves-effect waves-light btn-info btn-extra-padding js-ajax-request"
            data-button-loading-annimation="yes" data-button-disable-on-click="yes"
            data-url="{{url('setup/database') }}">Continuar</button>
        @endif
    </div>

</div>