<!-- REVIEW: PASANTE -->

<!--ALL THIRD PART JAVASCRIPTS-->
<script src="public/vendor/js/vendor.footer.js"></script>

<!--nextloop.core.js-->
<script src="public/js/core/ajax.js"></script>

<!--MAIN JS - AT END-->
<script src="public/js/core/boot.js"></script>

<!--EVENTS-->
<script src="public/js/core/events.js"></script>

<!--CORE-->
<script src="public/js/core/app.js"></script>

<!--BILLING-->
<script src="public/js/core/billing.js"></script>

<!--project page charts-->
@if(@config('visibility.projects_d3_vendor'))
<script src="public/vendor/js/d3/d3.min.js"></script>
<script src="public/vendor/js/c3-master/c3.min.js"></script>
@endif

<!--form builder-->
@if(@config('visibility.web_form_builder'))
<script src="public/vendor/js/formbuilder/form-builder.min.js"></script>
<script src="public/js/webforms/webforms.js"></script>
@endif

<!--export js (https://github.com/hhurz/tableExport.jquery.plugin)-->
<script src="public/js/core/export.js"></script>
<script type="text/javascript" src="public/vendor/js/exportjs/libs/FileSaver/FileSaver.min.js"></script>
<script type="text/javascript" src="public/vendor/js/exportjs/libs/js-xlsx/xlsx.core.min.js"></script>
<script type="text/javascript" src="public/vendor/js/exportjs/tableExport.min.js"></script>

<!--printing-->
<script type="text/javascript" src="public/vendor/js/printthis/printthis.js"></script>

<!--table sorter-->
<script type="text/javascript" src="public/vendor/js/tablesorter/js/jquery.tablesorter.min.js"></script>
