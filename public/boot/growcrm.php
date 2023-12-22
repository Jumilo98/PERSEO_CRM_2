<?php

/*----------------------------------------------------------------
 * NEXTLOOP
 * @description
 * Check system meets some minimum requirements before continuing
 *   - PHP Version ( >= 7.2.5)
 *   - Writable directory permissions
 *
 * @updated
 * 26 October 2020
 *---------------------------------------------------------------*/
if (!defined('SANITYCHECKS')) {
    die('Access is not permitted');
}

$errors = 0;
$messages_chmod = '';
$messages_php = '';

$paths = [
    '/updates',
    '/storage',
    '/storage/avatars',
    '/storage/logos',
    '/storage/logos/clients',
    '/storage/logos/app',
    '/storage/files',
    '/storage/temp',
    '/application/storage/app',
    '/application/storage/app/public',
    '/application/storage/cache',
    '/application/storage/cache/data',
    '/application/storage/debugbar',
    '/application/storage/framework',
    '/application/storage/framework/cache',
    '/application/storage/framework/cache/data',
    '/application/storage/framework/sessions',
    '/application/storage/framework/testing',
    '/application/storage/framework/views',
    '/application/storage/logs',
    '/application/bootstrap/cache',
    '/application/storage/app/purifier',
    '/application/storage/app/purifier/HTML',
];

//Subdomain - Subfolder Fix
if (!is_dir(BASE_PATH . '/application')) {
    die('Error! - You cannot access the CRM from this url');
}

//defaults
$messages_chmod = '';

//check directoies
foreach ($paths as $key => $value) {
    if (!is_writable(BASE_PATH . $value)) {
        $messages_chmod .= '<tr><td class="p-l-15">' . BASE_PATH . $value . '</td><td class="x-td-checks" width="40px"><span class="x-checks x-check-failed text-danger font-18"><i class="sl-icon-close"></i></span></td></tr>';
        $errors++;
    }
}

//check minimum php version
if (version_compare(PHP_VERSION, '7.3.0', ">=")) {
    $messages_php = '';
} else {
    $messages_php = '<tr><td class="p-l-15">PHP Version <strong>7.3</strong> or <strong>7.4</strong> </td><td class="x-td-checks" width="40px"><span class="x-checks x-check-failed text-danger font-18"><i class="sl-icon-close"></i></span></td></tr>';
    $messages_php .= '
        <tr><td colspan="2">
        <div class="alert alert-danger">
        Esta versión de Perseo CRM requiere <strong>PHP 7.3+</strong>.
        <br/>
        <br/>Su servidor está funcionando actualmente <strong> PHP ' . phpversion() . '</strong>
        <br/><br/>
        Puede configurar/cambiar fácilmente los <strong>PHP Version</strong> dentro de su panel de control de alojamiento web. <a href="https://growcrm.io/documentation/setting-your-php-version/" target="_blank">(see decumentation for help)</a>
        </div></td></tr>';
    $errors++;
}

//page - general
$page = '
<!DOCTYPE html><html lang="en" class="team"><head><link href="public/vendor/css/bootstrap/bootstrap.min.css" rel="stylesheet"><link href="public/themes/default/css/style.css" rel="stylesheet"><link rel="stylesheet" href="public/vendor/css/vendor.css"></head>
<body class="setup-prechecks"><div class="x-wrapper w-90 max-width-1000">
<div class="col-12 p-t-40 card-no-border"><div class="card"><div class="card-body"><div class="text-center"><h3 class="card-title">PERSEO CRM</h3>
<h5>Comprobación del sistema</h5><div><img src="public/images/system-checks.png" width="300" alt="system checks failed" /></div><p class="card-text">Los siguientes (requisitos mínimos del sistema) deben cumplirse antes de poder continuar. Consulte los detalles con soporte de Perseo.</p>
</div><div class="m-t-20">';

//page - php
if ($messages_php != '') {
    $page .= '</br></br><h5 class="text-info"> Requisitos de la versión de PHP</h5><table class="table table-bordered w-100">' . $messages_php . '</table>';
}

//page - chmod
if ($messages_chmod != '') {
    $page .=
        '</br></br><h5 class="text-info"> Las siguientes carpetas no son escribibles</h5><table class="table table-bordered w-100">' . $messages_chmod . '</table></div><div class="text-center"><a href="/" class="btn btn-info">Volver a intentarlo</a></div></div></div></div></div>';
}

//page end
$page .= '</body><html>';

//do we have directory errors
if ($errors > 0) {
    die($page);
}
