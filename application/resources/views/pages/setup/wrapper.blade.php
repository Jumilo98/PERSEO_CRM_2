@extends('layout.wrapperplain') @section('content')
<!-- main content -->
<div class="container-fluid">

    <!--HEADER-->
    <div class="setup-header">
        <div class="x-logo font-16 font-weight-600">PERSEO CRM - INSTALACIÓN </div>
    </div>
    <div class="setup-wrapper">
        <!--PROGRESS-->
        <div class="setup-progress row">

            <!--step 2 -->
            <div class="col-2 steps">
                <div class="x-step setup-steps" id="steps-2">1</div>
                <div class="x-line">Requerimientos</div>
            </div>
            <!--step 3-->
            <div class="col-2 steps">
                <div class="x-step setup-steps" id="steps-3">2</div>
                <div class="x-line">Base de datos</div>
            </div>
            <!--step 4-->
            <div class="col-2 steps">
                <div class="x-step setup-steps" id="steps-4">3</div>
                <div class="x-line">Configuración</div>
            </div>
            <!--step 5-->
            <div class="col-2 steps">
                <div class="x-step setup-steps" id="steps-5">4</div>
                <div class="x-line">Administrador</div>
            </div>
            <!--step 6-->
            <div class="col-2 steps">
                <div class="x-step setup-steps" id="steps-6">5</div>
                <div class="x-line">Finalización</div>
            </div>
        </div>

        <!--CONTENT-->
        <div class="setup-content" id="setup-content">
            @include('pages.setup.requirements')
        </div>

    </div>

</div>
<!--main content -->
@endsection