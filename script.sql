create table if not exists activos_departamentos
(
    activos_departamentosid int auto_increment
        primary key,
    descripcion             varchar(100) default '' not null,
    fechacreacion           datetime(3)             not null,
    usuariocreacion         varchar(25)  default '' not null,
    fechamodificacion       datetime(3)             null,
    usuariomodificacion     varchar(25)  default '' not null
)
    charset = utf8mb4;

create table if not exists activos_grupos
(
    activos_gruposid       int auto_increment
        primary key,
    descripcion            varchar(100)   default ''   not null,
    porcentajedepreciacion decimal(12, 2) default 0.00 not null,
    codigocontable_debe    varchar(30)    default ''   not null,
    codigocontable_haber   varchar(30)    default ''   not null,
    fechacreacion          datetime(3)                 not null,
    usuariocreacion        varchar(25)    default ''   not null,
    fechamodificacion      datetime(3)                 null,
    usuariomodificacion    varchar(25)    default ''   not null
)
    charset = utf8mb4;

create table if not exists activos_responsables
(
    activos_responsablesid int auto_increment
        primary key,
    identificacion         varchar(20) default '' not null,
    descripcion            varchar(50) default '' not null,
    estado                 tinyint     default 1  not null,
    fechacreacion          datetime(3)            not null,
    usuariocreacion        varchar(25) default '' not null,
    fechamodificacion      datetime(3)            null,
    usuariomodificacion    varchar(25) default '' not null
)
    charset = utf8mb4;

create table if not exists almacenes
(
    descripcion         varchar(20)    default ''   not null,
    almacenesid         int auto_increment
        primary key,
    estado              tinyint        default 0    not null,
    acumulativo         tinyint        default 0    not null,
    meta                decimal(12, 2) default 0.00 not null,
    disponibleventa     tinyint        default 0    not null,
    fechacreacion       datetime(3)                 not null,
    usuariocreacion     varchar(25)    default ''   not null,
    fechamodificacion   datetime(3)                 null,
    usuariomodificacion varchar(25)    default ''   not null
)
    charset = utf8mb4;

create table if not exists alumnos_cursos
(
    alumnos_cursosid    bigint auto_increment
        primary key,
    descripcion         varchar(100) default '' not null,
    fechacreacion       datetime(3)             not null,
    usuariocreacion     varchar(25)  default '' not null,
    fechamodificacion   datetime(3)             null,
    usuariomodificacion varchar(25)  default '' not null
)
    charset = utf8mb4;

create table if not exists anuncios
(
    anunciosid  bigint auto_increment
        primary key,
    fechafin    date                    not null,
    fechainicio date                    not null,
    titulo      varchar(255) default '' not null,
    contenido   longtext                null
)
    charset = utf8mb4;

create table if not exists centros_costos
(
    centros_costosid    int auto_increment
        primary key,
    centro_costocodigo  varchar(20)   default ''   not null,
    descripcion         varchar(50)   default ''   not null,
    avance              decimal(5, 2) default 0.00 not null,
    nivel               varchar(1)    default ''   not null,
    estado              tinyint       default 0    not null,
    fechacreacion       datetime(3)                not null,
    usuariocreacion     varchar(25)   default ''   not null,
    fechamodificacion   datetime(3)                null,
    usuariomodificacion varchar(25)   default ''   not null,
    constraint centro_costocodigo
        unique (centro_costocodigo)
)
    charset = utf8mb4;

create table if not exists ciudades
(
    ciudadesid varchar(4)  default '0' not null,
    ciudad     varchar(50) default ''  not null,
    constraint ciudadesid
        unique (ciudadesid)
)
    charset = utf8mb4;

create table if not exists clientes_bancos
(
    clientes_bancosid int auto_increment
        primary key,
    descripcion       varchar(30) default '' not null,
    codigo            varchar(5)  default '' not null
)
    charset = utf8mb4;

create table if not exists clientes_contratos_equipos
(
    clientes_contratos_equiposid bigint auto_increment
        primary key,
    clientes_contratosid         bigint       default 0  not null,
    desccipcion                  varchar(100) default '' not null,
    serie                        varchar(30)  default '' not null
)
    charset = utf8mb4;

create table if not exists clientes_cuentas
(
    clientes_cuentasid int auto_increment
        primary key,
    clientes_bancosid  int         default 0  not null,
    clientesid         bigint      default 0  not null,
    tipo               tinyint     default 1  not null,
    numero_cuenta      varchar(16) default '' null,
    principal          tinyint     default 0  not null,
    constraint clientes_cuentas_ibfk_304
        foreign key (clientes_bancosid) references clientes_bancos (clientes_bancosid)
)
    charset = utf8mb4;

create table if not exists clientes_grupos
(
    clientes_gruposid   bigint auto_increment
        primary key,
    descripcion         varchar(30) default '' not null,
    usuariocreacion     varchar(25) default '' not null,
    fechacreacion       datetime(3)            not null,
    usuariomodificacion varchar(25) default '' not null,
    fechamodificacion   datetime(3)            null
)
    charset = utf8mb4;

create table if not exists clientes_prospectos
(
    clientes_prospectosid int auto_increment
        primary key,
    tipoidentificacion    varchar(1)       default ''   not null,
    identificacion        varchar(20)      default ''   not null,
    razonsocial           varchar(300)     default ''   not null,
    nombrecomercial       varchar(300)     default ''   not null,
    clientes_gruposid     bigint           default 0    not null,
    telefono1             varchar(15)      default ''   not null,
    telefono2             varchar(15)      default ''   not null,
    email                 varchar(300)     default ''   not null,
    direccion             varchar(300)     default ''   not null,
    vendedoresid          int              default 0    not null,
    ciudadesid            varchar(4)       default ''   not null,
    estado                tinyint unsigned default 0    not null,
    fechacreacion         datetime(3)                   not null,
    usuariocreacion       varchar(25)      default ''   not null,
    fechamodificacion     datetime(3)                   null,
    usuariomodificacion   varchar(25)      default ''   not null,
    parametros_json       varchar(500)     default '{}' not null,
    constraint clientes_prospectos_ibfk_243
        foreign key (clientes_gruposid) references clientes_grupos (clientes_gruposid)
)
    charset = utf8mb4;

create table if not exists clientes_zonas
(
    clientes_zonasid    bigint auto_increment
        primary key,
    descripcion         varchar(30) default '' not null,
    usuariocreacion     varchar(25) default '' not null,
    fechacreacion       datetime(3)            not null,
    usuariomodificacion varchar(25) default '' not null,
    fechamodificacion   datetime(3)            null
)
    charset = utf8mb4;

create table if not exists cobranza_detalles
(
    cobranza_detallesID bigint auto_increment
        primary key,
    cobranza_codigo     varchar(10)      default ''   not null,
    tipo                varchar(2)       default ''   not null,
    actividad           tinyint unsigned default 0    not null,
    fecha_entrega       date                          not null,
    fecha_registro      date                          not null,
    clientesid          bigint           default 0    not null,
    cobradoresid        int              default 0    not null,
    documentosid        bigint           default 0    not null,
    secuencial          varchar(15)      default ''   not null,
    emision             date                          not null,
    vence               date                          not null,
    importe             decimal(14, 2)   default 0.00 not null,
    saldo               decimal(14, 2)   default 0.00 not null,
    cobrado             decimal(14, 2)   default 0.00 not null,
    valor_renta         decimal(14, 2)   default 0.00 not null,
    valor_devoluciones  decimal(14, 2)   default 0.00 not null,
    estado              tinyint unsigned default 0    not null,
    fechacreacion       datetime(3)                   not null,
    usuariocreacion     varchar(25)      default ''   not null,
    fechamodificacion   datetime(3)                   null,
    usuariomodificacion varchar(25)      default ''   not null
)
    charset = utf8mb4;

create table if not exists comisiones
(
    comisionesid        bigint auto_increment
        primary key,
    liquidacion         varchar(10)    default ''     not null,
    documentosid        bigint         default 0      not null,
    fecha               datetime(3)                   not null,
    emision             date                          not null,
    vence               date                          not null,
    diasvencidos        int unsigned   default 0      not null,
    secuencial          varchar(10)    default ''     not null,
    series              varchar(6)     default ''     not null,
    clientesid          bigint         default 0      not null,
    importe             decimal(14, 2) default 0.00   not null,
    comision            decimal(16, 4) default 0.0000 not null,
    vendedoresid        int            default 0      not null,
    grupo               tinyint        default 0      not null,
    usuariocreacion     varchar(25)    default ''     not null,
    fechacreacion       datetime(3)                   not null,
    usuariomodificacion varchar(25)    default ''     not null,
    fechamodificacion   datetime(3)                   null
)
    charset = utf8mb4;

create table if not exists compras_reembolsos_ice
(
    compras_reembolso_iceid bigint auto_increment
        primary key,
    reembolsosid            bigint         default 0          not null,
    ice_codigo              varchar(26)    default ''         not null,
    ice_base                decimal(20, 8) default 0.00000000 not null,
    ice_tarifa              decimal(5, 2)  default 0.00       not null,
    ice_valor               decimal(20, 8) default 0.00000000 not null
)
    charset = utf8mb4;

create table if not exists conciliacion_bancaria
(
    bancosid                int            default 0    not null,
    conciliacion_bancariaid bigint auto_increment
        primary key,
    fecha                   date                        not null,
    saldoextracto           decimal(14, 2) default 0.00 not null,
    saldobancario           decimal(14, 2) default 0.00 not null,
    chequesgirados          decimal(14, 2) default 0.00 not null,
    notasdedebito           decimal(14, 2) default 0.00 not null,
    depositostransito       decimal(14, 2) default 0.00 not null,
    notascredito            decimal(14, 2) default 0.00 not null,
    saldomodulo             decimal(14, 2) default 0.00 not null,
    diferencia              decimal(14, 2) default 0.00 not null,
    total_notascredito      decimal(14, 2) default 0.00 not null,
    total_notasdebito       decimal(14, 2) default 0.00 not null,
    total_cheques           decimal(14, 2) default 0.00 not null,
    total_depositos         decimal(14, 2) default 0.00 not null,
    usuariocreacion         varchar(25)    default ''   not null,
    fechacreacion           datetime(3)                 not null,
    usuariomodificacion     varchar(25)    default ''   null,
    fechamodificacion       datetime(3)                 null
)
    charset = utf8mb4;

create table if not exists contabilidad_bloqueo
(
    contabilidad_bloqueo int auto_increment
        primary key,
    modulos              varchar(30) default '' not null,
    fecha_bloqueo        date                   null,
    fecha_periodo_desde  date                   null,
    fecha_periodo_hasta  date                   null
)
    charset = utf8mb4;

create table if not exists crm_actualizacion
(
    updating_id             int auto_increment
        primary key,
    updating_created        datetime                  not null,
    updating_updated        datetime                  not null,
    updating_type           varchar(100)              not null comment 'modal|cronjob|url',
    updating_name           varchar(100)              null comment 'used for updating the record',
    updating_function_name  varchar(150)              null comment '[required]  for cronjob updating. This is the name of the function',
    updating_update_version varchar(10)               null comment 'which version this update is for',
    updating_request_path   varchar(250)              null comment 'e.g. /updating/action/update-currency-settings',
    updating_update_path    varchar(250)              null comment 'e.g. /updating/action/update-currency-settings',
    updating_notes          tinytext                  null,
    updating_payload_1      text                      null,
    updating_payload_2      text                      null,
    updating_payload_3      text                      null,
    updating_started_date   datetime                  null,
    updating_completed_date datetime                  null,
    updating_system_log     text                      null comment 'any comments generated by the system when running this update',
    updating_status         varchar(50) default 'new' null comment 'new|processing|failed|completed'
)
    engine = MyISAM;

create table if not exists crm_actualizaciones
(
    update_id             int auto_increment
        primary key,
    update_created        datetime       not null,
    update_updated        datetime       not null,
    update_version        decimal(10, 2) null,
    update_mysql_filename varchar(100)   null
)
    comment 'tracks updates sql file execution' engine = MyISAM;

create table if not exists crm_archivodecarpetas
(
    filefolder_id        int auto_increment
        primary key,
    filefolder_created   datetime                  not null,
    filefolder_updated   datetime                  not null,
    filefolder_creatorid int                       null,
    filefolder_projectid int                       null,
    filefolder_name      varchar(250)              null,
    filefolder_default   varchar(100) default 'no' null comment 'yes|no',
    filefolder_system    varchar(100) default 'no' null comment 'yes|no'
);

create table if not exists crm_archivos
(
    file_id                int auto_increment
        primary key,
    file_uniqueid          varchar(100)             null,
    file_upload_unique_key varchar(100)             null comment 'used to idetify files that were uploaded in one go',
    file_created           datetime                 null,
    file_updated           datetime                 null,
    file_creatorid         int                      null,
    file_clientid          int                      null comment 'optional',
    file_folderid          int                      null,
    file_filename          varchar(250)             null,
    file_directory         varchar(100)             null,
    file_extension         varchar(10)              null,
    file_size              varchar(40)              null comment 'human readable file size',
    file_type              varchar(20)              null comment 'image|file',
    file_thumbname         varchar(250)             null comment 'optional',
    file_visibility_client varchar(5) default 'yes' null comment 'yes | no',
    fileresource_type      varchar(50)              null comment '[polymorph] project',
    fileresource_id        int                      null comment '[polymorph] e.g project_id'
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_archivosadjuntos
(
    attachment_id           int auto_increment
        primary key,
    attachment_uniqiueid    varchar(100) not null,
    attachment_created      datetime     null,
    attachment_updated      datetime     null,
    attachment_creatorid    int          not null,
    attachment_clientid     int          null comment 'optional',
    attachment_directory    varchar(100) not null,
    attachment_filename     varchar(250) not null,
    attachment_extension    varchar(20)  null,
    attachment_type         varchar(20)  null comment 'image | file',
    attachment_size         varchar(30)  null comment 'Human readable file size',
    attachment_thumbname    varchar(250) null comment 'optional for images',
    attachmentresource_type varchar(50)  not null comment '[polymorph] task | expense | ticket | ticketreply',
    attachmentresource_id   int          not null comment '[polymorph] e.g ticket_id'
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_articulos
(
    item_id                 int auto_increment
        primary key,
    item_created            datetime                        null,
    item_updated            datetime                        null,
    item_categoryid         int          default 8          not null,
    item_creatorid          int                             not null,
    item_type               varchar(100) default 'standard' not null comment 'standard|dimensions',
    item_description        text                            null,
    item_unit               varchar(50)                     null,
    item_rate               decimal(15, 2)                  not null,
    item_tax_status         varchar(100) default 'taxable'  not null comment 'taxable|exempt',
    item_dimensions_length  decimal(15, 2)                  null,
    item_dimensions_width   decimal(15, 2)                  null,
    item_notes_estimatation text                            null,
    item_notes_production   text                            null
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_asignacionautomatica
(
    automationassigned_id            int auto_increment
        primary key,
    automationassigned_created       datetime     null,
    automationassigned_updated       int          null,
    automationassigned_userid        int          null,
    automationassigned_resource_type varchar(150) null comment 'estimate|product_task',
    automationassigned_resource_id   int          null comment 'use ID 0, for system default users'
);

create table if not exists crm_asignaciondewebforms
(
    webformassigned_id      int auto_increment
        primary key,
    webformassigned_created datetime not null,
    webformassigned_updated datetime not null,
    webformassigned_formid  int      null,
    webformassigned_userid  int      null
);

create table if not exists crm_basedeconocimiento
(
    knowledgebase_id             int auto_increment
        primary key,
    knowledgebase_created        datetime     not null,
    knowledgebase_updated        datetime     not null,
    knowledgebase_creatorid      int          not null,
    knowledgebase_categoryid     int          not null,
    knowledgebase_title          varchar(250) not null,
    knowledgebase_slug           varchar(250) null,
    knowledgebase_text           text         null,
    knowledgebase_embed_video_id varchar(50)  null,
    knowledgebase_embed_code     text         null,
    knowledgebase_embed_thumb    varchar(150) null
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_campospersonalizados
(
    customfields_id                   int auto_increment
        primary key,
    customfields_created              datetime                        not null,
    customfields_updated              datetime                        not null,
    customfields_position             int          default 1          not null,
    customfields_datatype             varchar(50)  default 'text'     null comment 'text|paragraph|number|decima|date|checkbox|dropdown',
    customfields_datapayload          text                            null comment 'use this to store dropdown lists etc',
    customfields_type                 varchar(50)                     null comment 'clients|projects|leads|tasks|tickets',
    customfields_name                 varchar(250)                    null comment 'e.g. project_custom_field_1',
    customfields_title                varchar(250)                    null,
    customfields_required             varchar(5)   default 'no'       null comment 'yes|no - standard form',
    customfields_show_client_page     varchar(100)                    null,
    customfields_show_project_page    varchar(100)                    null,
    customfields_show_task_summary    varchar(100)                    null,
    customfields_show_lead_summary    varchar(100)                    null,
    customfields_show_invoice         varchar(100)                    null,
    customfields_show_ticket_page     varchar(100) default 'no'       null,
    customfields_show_filter_panel    varchar(100) default 'no'       null comment 'yes|no',
    customfields_standard_form_status varchar(100) default 'disabled' null comment 'disabled | enabled',
    customfields_status               varchar(50)  default 'disabled' null comment 'disabled | enabled',
    customfields_sorting_a_z          varchar(5)   default 'z'        null comment 'hack to get sorting right, excluding null title items'
)
    comment 'checkbox fields are stored as ''on'' or null' engine = MyISAM;

create table if not exists crm_categorias
(
    category_id             int auto_increment comment '[do not truncate] - only delete where category_system_default = no'
        primary key,
    category_created        datetime                            null,
    category_updated        datetime                            null,
    category_creatorid      int                                 null,
    category_name           varchar(150)                        null,
    category_description    varchar(150)                        null comment 'optional (mainly used by knowledge base)',
    category_system_default varchar(20)  default 'no'           null comment 'yes | no (system default cannot be deleted)',
    category_visibility     varchar(20)  default 'everyone'     null comment 'everyone | team | client (mainly used by knowledge base)',
    category_icon           varchar(100) default 'sl-icon-docs' null comment 'optional (mainly used by knowledge base)',
    category_type           varchar(50)                         not null comment 'project | client | contract | expense | invoice | lead | ticket | item| estimate | knowledgebase',
    category_slug           varchar(250)                        not null
)
    comment '[do not truncate][system defaults] - 1=project,2=client,3lead,4=invoice,5=estimate,6=contract,7=expense,8=item,9=ticket, 10=knowledgebase, 11=proposal'
    engine = MyISAM;

create table if not exists crm_categoriasdelameta
(
    milestonecategory_id        int auto_increment
        primary key,
    milestonecategory_created   datetime     not null,
    milestonecategory_updated   datetime     not null,
    milestonecategory_creatorid int          not null,
    milestonecategory_title     varchar(250) not null,
    milestonecategory_position  int          not null
)
    engine = MyISAM;

create table if not exists crm_categoriausuarios
(
    categoryuser_id         int auto_increment
        primary key,
    categoryuser_categoryid int      not null,
    categoryuser_userid     int      not null,
    categoryuser_created    datetime not null,
    categoryuser_updated    datetime not null
)
    engine = MyISAM;

create table if not exists crm_clientes
(
    client_id                             int auto_increment
        primary key,
    client_importid                       varchar(100)                  null,
    client_created                        datetime                      null,
    client_updated                        datetime                      null,
    client_creatorid                      int                           not null,
    client_created_from_leadid            int                           not null comment 'the lead that the customer was created from',
    client_categoryid                     int         default 2         null comment 'default category',
    client_identification                 varchar(13)                   not null,
    client_company_name                   varchar(150)                  not null,
    client_description                    text                          null,
    client_phone                          varchar(50)                   null,
    client_logo_folder                    varchar(50)                   null,
    client_logo_filename                  varchar(50)                   null,
    client_website                        varchar(250)                  null,
    client_vat                            varchar(50)                   null,
    client_billing_street                 varchar(200)                  null,
    client_billing_city                   varchar(100)                  null,
    client_billing_state                  varchar(100)                  null,
    client_billing_zip                    varchar(50)                   null,
    client_billing_country                varchar(100)                  null,
    client_shipping_street                varchar(250)                  null,
    client_shipping_city                  varchar(100)                  null,
    client_shipping_state                 varchar(100)                  null,
    client_shipping_zip                   varchar(50)                   null,
    client_shipping_country               varchar(100)                  null,
    client_status                         varchar(50) default 'active'  not null comment 'active|suspended',
    client_app_modules                    varchar(50) default 'system'  null comment 'system|custom',
    client_settings_modules_projects      varchar(50) default 'enabled' null comment 'enabled|disabled',
    client_settings_modules_invoices      varchar(50) default 'enabled' null comment 'enabled|disabled',
    client_settings_modules_payments      varchar(50) default 'enabled' null comment 'enabled|disabled',
    client_settings_modules_knowledgebase varchar(50) default 'enabled' null comment 'enabled|disabled',
    client_settings_modules_estimates     varchar(50) default 'enabled' null comment 'enabled|disabled',
    client_settings_modules_subscriptions varchar(50) default 'enabled' null comment 'enabled|disabled',
    client_settings_modules_tickets       varchar(50) default 'enabled' null comment 'enabled|disabled',
    client_import_first_name              varchar(100)                  null comment 'used during import',
    client_import_last_name               varchar(100)                  null comment 'used during import',
    client_import_email                   varchar(100)                  null comment 'used during import',
    client_import_job_title               varchar(100)                  null comment 'used during import',
    client_custom_field_1                 tinytext                      null,
    client_custom_field_2                 tinytext                      null,
    client_custom_field_3                 tinytext                      null,
    client_custom_field_4                 tinytext                      null,
    client_custom_field_5                 tinytext                      null,
    client_custom_field_6                 tinytext                      null,
    client_custom_field_7                 tinytext                      null,
    client_custom_field_8                 tinytext                      null,
    client_custom_field_9                 tinytext                      null,
    client_custom_field_10                tinytext                      null,
    client_custom_field_11                datetime                      null,
    client_custom_field_12                datetime                      null,
    client_custom_field_13                datetime                      null,
    client_custom_field_14                datetime                      null,
    client_custom_field_15                datetime                      null,
    client_custom_field_16                datetime                      null,
    client_custom_field_17                datetime                      null,
    client_custom_field_18                datetime                      null,
    client_custom_field_19                datetime                      null,
    client_custom_field_20                datetime                      null,
    client_custom_field_21                text                          null,
    client_custom_field_22                text                          null,
    client_custom_field_23                text                          null,
    client_custom_field_24                text                          null,
    client_custom_field_25                text                          null,
    client_custom_field_26                text                          null,
    client_custom_field_27                text                          null,
    client_custom_field_28                text                          null,
    client_custom_field_29                text                          null,
    client_custom_field_30                text                          null,
    client_custom_field_31                varchar(20)                   null,
    client_custom_field_32                varchar(20)                   null,
    client_custom_field_33                varchar(20)                   null,
    client_custom_field_34                varchar(20)                   null,
    client_custom_field_35                varchar(20)                   null,
    client_custom_field_36                varchar(20)                   null,
    client_custom_field_37                varchar(20)                   null,
    client_custom_field_38                varchar(20)                   null,
    client_custom_field_39                varchar(20)                   null,
    client_custom_field_40                varchar(20)                   null,
    client_custom_field_41                varchar(150)                  null,
    client_custom_field_42                varchar(150)                  null,
    client_custom_field_43                varchar(150)                  null,
    client_custom_field_44                varchar(150)                  null,
    client_custom_field_45                varchar(150)                  null,
    client_custom_field_46                varchar(150)                  null,
    client_custom_field_47                varchar(150)                  null,
    client_custom_field_48                varchar(150)                  null,
    client_custom_field_49                varchar(150)                  null,
    client_custom_field_50                varchar(150)                  null,
    client_custom_field_51                int                           null,
    client_custom_field_52                int                           null,
    client_custom_field_53                int                           null,
    client_custom_field_54                int                           null,
    client_custom_field_55                int                           null,
    client_custom_field_56                int                           null,
    client_custom_field_57                int                           null,
    client_custom_field_58                int                           null,
    client_custom_field_59                int                           null,
    client_custom_field_60                int                           null,
    client_custom_field_61                decimal(10, 2)                null,
    client_custom_field_62                decimal(10, 2)                null,
    client_custom_field_63                decimal(10, 2)                null,
    client_custom_field_64                decimal(10, 2)                null,
    client_custom_field_65                decimal(10, 2)                null,
    client_custom_field_66                decimal(10, 2)                null,
    client_custom_field_67                decimal(10, 2)                null,
    client_custom_field_68                decimal(10, 2)                null,
    client_custom_field_69                decimal(10, 2)                null,
    client_custom_field_70                decimal(10, 2)                null,
    client_billing_invoice_terms          text                          null,
    client_billing_invoice_due_days       smallint                      null,
    client_identification                 varchar(13)                   null
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_clientespotenciales
(
    lead_id                  int auto_increment
        primary key,
    lead_importid            varchar(100)                  null,
    lead_position            double                        not null,
    lead_created             datetime                      null,
    lead_updated             datetime                      null,
    lead_date_status_change  datetime                      null,
    lead_creatorid           int                           null,
    lead_updatorid           int                           null,
    lead_categoryid          int         default 3         null,
    lead_identification      varchar(13)                   not null,
    lead_identification_type char                          not null,
    lead_lastname            varchar(100)                  null,
    lead_firstname           varchar(100)                  null,
    lead_email               varchar(150)                  null,
    lead_phone               varchar(150)                  null,
    lead_job_position        varchar(150)                  null,
    lead_company_name        varchar(150)                  null,
    lead_website             varchar(150)                  null,
    lead_street              varchar(150)                  null,
    lead_city                varchar(150)                  null,
    lead_state               varchar(150)                  null,
    lead_zip                 varchar(150)                  null,
    lead_country             varchar(150)                  null,
    lead_source              varchar(150)                  null,
    lead_title               varchar(250)                  null,
    lead_description         text                          null,
    lead_value               decimal(10, 2)                null,
    lead_last_contacted      date                          null,
    lead_converted           varchar(10) default 'no'      null comment 'yes|no',
    lead_converted_by_userid int                           null comment 'id of user who converted',
    lead_converted_date      datetime                      null comment 'date lead converted',
    lead_converted_clientid  int                           null comment 'if the lead has previously been converted to a client',
    lead_status              tinyint     default 1         null comment 'Deafult is id: 1 (leads_status) table',
    lead_active_state        varchar(10) default 'active'  null comment 'active|archived',
    lead_visibility          varchar(40) default 'visible' null comment 'visible|hidden (used to prevent tasks that are still being cloned from showing in tasks list)',
    lead_custom_field_1      tinytext                      null,
    lead_custom_field_2      tinytext                      null,
    lead_custom_field_3      tinytext                      null,
    lead_custom_field_4      tinytext                      null,
    lead_custom_field_5      tinytext                      null,
    lead_custom_field_6      tinytext                      null,
    lead_custom_field_7      tinytext                      null,
    lead_custom_field_8      tinytext                      null,
    lead_custom_field_9      tinytext                      null,
    lead_custom_field_10     tinytext                      null,
    lead_custom_field_11     tinytext                      null,
    lead_custom_field_12     tinytext                      null,
    lead_custom_field_13     tinytext                      null,
    lead_custom_field_14     tinytext                      null,
    lead_custom_field_15     tinytext                      null,
    lead_custom_field_16     tinytext                      null,
    lead_custom_field_17     tinytext                      null,
    lead_custom_field_18     tinytext                      null,
    lead_custom_field_19     tinytext                      null,
    lead_custom_field_20     tinytext                      null,
    lead_custom_field_21     tinytext                      null,
    lead_custom_field_22     tinytext                      null,
    lead_custom_field_23     tinytext                      null,
    lead_custom_field_24     tinytext                      null,
    lead_custom_field_25     tinytext                      null,
    lead_custom_field_26     tinytext                      null,
    lead_custom_field_27     tinytext                      null,
    lead_custom_field_28     tinytext                      null,
    lead_custom_field_29     tinytext                      null,
    lead_custom_field_30     tinytext                      null,
    lead_custom_field_31     datetime                      null,
    lead_custom_field_32     datetime                      null,
    lead_custom_field_33     datetime                      null,
    lead_custom_field_34     datetime                      null,
    lead_custom_field_35     datetime                      null,
    lead_custom_field_36     datetime                      null,
    lead_custom_field_37     datetime                      null,
    lead_custom_field_38     datetime                      null,
    lead_custom_field_39     datetime                      null,
    lead_custom_field_40     datetime                      null,
    lead_custom_field_41     text                          null,
    lead_custom_field_42     text                          null,
    lead_custom_field_43     text                          null,
    lead_custom_field_44     text                          null,
    lead_custom_field_45     text                          null,
    lead_custom_field_46     text                          null,
    lead_custom_field_47     text                          null,
    lead_custom_field_48     text                          null,
    lead_custom_field_49     text                          null,
    lead_custom_field_50     text                          null,
    lead_custom_field_51     text                          null,
    lead_custom_field_52     text                          null,
    lead_custom_field_53     text                          null,
    lead_custom_field_54     text                          null,
    lead_custom_field_55     text                          null,
    lead_custom_field_56     text                          null,
    lead_custom_field_57     text                          null,
    lead_custom_field_58     text                          null,
    lead_custom_field_59     text                          null,
    lead_custom_field_60     text                          null,
    lead_custom_field_61     varchar(20)                   null,
    lead_custom_field_62     varchar(20)                   null,
    lead_custom_field_63     varchar(20)                   null,
    lead_custom_field_64     varchar(20)                   null,
    lead_custom_field_65     varchar(20)                   null,
    lead_custom_field_66     varchar(20)                   null,
    lead_custom_field_67     varchar(20)                   null,
    lead_custom_field_68     varchar(20)                   null,
    lead_custom_field_69     varchar(20)                   null,
    lead_custom_field_70     varchar(20)                   null,
    lead_custom_field_71     varchar(20)                   null,
    lead_custom_field_72     varchar(20)                   null,
    lead_custom_field_73     varchar(20)                   null,
    lead_custom_field_74     varchar(20)                   null,
    lead_custom_field_75     varchar(20)                   null,
    lead_custom_field_76     varchar(20)                   null,
    lead_custom_field_77     varchar(20)                   null,
    lead_custom_field_78     varchar(20)                   null,
    lead_custom_field_79     varchar(20)                   null,
    lead_custom_field_80     varchar(20)                   null,
    lead_custom_field_81     varchar(150)                  null,
    lead_custom_field_82     varchar(150)                  null,
    lead_custom_field_83     varchar(150)                  null,
    lead_custom_field_84     varchar(150)                  null,
    lead_custom_field_85     varchar(150)                  null,
    lead_custom_field_86     varchar(150)                  null,
    lead_custom_field_87     varchar(150)                  null,
    lead_custom_field_88     varchar(150)                  null,
    lead_custom_field_89     varchar(150)                  null,
    lead_custom_field_90     varchar(150)                  null,
    lead_custom_field_91     varchar(150)                  null,
    lead_custom_field_92     varchar(150)                  null,
    lead_custom_field_93     varchar(150)                  null,
    lead_custom_field_94     varchar(150)                  null,
    lead_custom_field_95     varchar(150)                  null,
    lead_custom_field_96     varchar(150)                  null,
    lead_custom_field_97     varchar(150)                  null,
    lead_custom_field_98     varchar(150)                  null,
    lead_custom_field_99     varchar(150)                  null,
    lead_custom_field_100    varchar(150)                  null,
    lead_custom_field_101    varchar(150)                  null,
    lead_custom_field_102    varchar(150)                  null,
    lead_custom_field_103    varchar(150)                  null,
    lead_custom_field_104    varchar(150)                  null,
    lead_custom_field_105    varchar(150)                  null,
    lead_custom_field_106    varchar(150)                  null,
    lead_custom_field_107    varchar(150)                  null,
    lead_custom_field_108    varchar(150)                  null,
    lead_custom_field_109    varchar(150)                  null,
    lead_custom_field_110    varchar(150)                  null,
    lead_custom_field_111    int                           null,
    lead_custom_field_112    int                           null,
    lead_custom_field_113    int                           null,
    lead_custom_field_114    int                           null,
    lead_custom_field_115    int                           null,
    lead_custom_field_116    int                           null,
    lead_custom_field_117    int                           null,
    lead_custom_field_118    int                           null,
    lead_custom_field_119    int                           null,
    lead_custom_field_120    int                           null,
    lead_custom_field_121    int                           null,
    lead_custom_field_122    int                           null,
    lead_custom_field_123    int                           null,
    lead_custom_field_124    int                           null,
    lead_custom_field_125    int                           null,
    lead_custom_field_126    int                           null,
    lead_custom_field_127    int                           null,
    lead_custom_field_128    int                           null,
    lead_custom_field_129    int                           null,
    lead_custom_field_130    int                           null,
    lead_custom_field_131    decimal(10, 2)                null,
    lead_custom_field_132    decimal(10, 2)                null,
    lead_custom_field_133    decimal(10, 2)                null,
    lead_custom_field_134    decimal(10, 2)                null,
    lead_custom_field_135    decimal(10, 2)                null,
    lead_custom_field_136    decimal(10, 2)                null,
    lead_custom_field_137    decimal(10, 2)                null,
    lead_custom_field_138    decimal(10, 2)                null,
    lead_custom_field_139    decimal(10, 2)                null,
    lead_custom_field_140    decimal(10, 2)                null,
    lead_custom_field_141    decimal(10, 2)                null,
    lead_custom_field_142    decimal(10, 2)                null,
    lead_custom_field_143    decimal(10, 2)                null,
    lead_custom_field_144    decimal(10, 2)                null,
    lead_custom_field_145    decimal(10, 2)                null,
    lead_custom_field_146    decimal(10, 2)                null,
    lead_custom_field_147    decimal(10, 2)                null,
    lead_custom_field_148    decimal(10, 2)                null,
    lead_custom_field_149    decimal(10, 2)                null,
    lead_custom_field_150    decimal(10, 2)                null
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_clientespotencialesasignados
(
    leadsassigned_id      int auto_increment
        primary key,
    leadsassigned_leadid  int      null,
    leadsassigned_userid  int      null,
    leadsassigned_created datetime not null,
    leadsassigned_updated datetime not null
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_clientespotencialesestado
(
    leadstatus_id             int auto_increment
        primary key,
    leadstatus_created        datetime                       null,
    leadstatus_creatorid      int                            null,
    leadstatus_updated        datetime                       null,
    leadstatus_title          varchar(200)                   not null,
    leadstatus_position       int                            not null,
    leadstatus_color          varchar(100) default 'default' not null comment 'default|primary|success|info|warning|danger|lime|brown',
    leadstatus_system_default varchar(10)  default 'no'      not null comment 'yes | no'
)
    comment '[do not truncate]  expected to have 2 system default statuses (ID: 1 & 2) ''new'' & ''converted'' statuses '
    engine = MyISAM;

create table if not exists crm_clientespotencialesfuentes
(
    leadsources_id        int auto_increment
        primary key,
    leadsources_created   datetime     not null,
    leadsources_updated   datetime     not null,
    leadsources_creatorid int          not null,
    leadsources_title     varchar(200) not null comment '[do not truncate] - good to have example sources like google'
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_comentarios
(
    comment_id           int auto_increment
        primary key,
    comment_created      datetime    null,
    comment_updated      datetime    null,
    comment_creatorid    int         not null,
    comment_clientid     int         null comment 'required for client type resources',
    comment_text         text        not null,
    commentresource_type varchar(50) not null comment '[polymorph] project | ticket | task | lead',
    commentresource_id   int         not null comment '[polymorph] e.g project_id'
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_config
(
    settings_id                                                    int auto_increment
        primary key,
    settings_created                                               datetime                                not null,
    settings_updated                                               datetime                                not null,
    settings_type                                                  varchar(50)    default 'standalone'     null comment 'standalone|saas',
    settings_saas_tenant_id                                        int                                     null,
    settings_saas_status                                           varchar(100)                            null comment 'unsubscribed|free-trial|awaiting-payment|failed|active|cancelled',
    settings_saas_package_id                                       int                                     null,
    settings_saas_onetimelogin_key                                 varchar(100)                            null,
    settings_saas_onetimelogin_destination                         varchar(100)                            null comment 'home|payment',
    settings_saas_package_limits_clients                           int                                     null,
    settings_saas_package_limits_team                              int                                     null,
    settings_saas_package_limits_projects                          int                                     null,
    settings_saas_notification_uniqueid                            text                                    null comment '(optional) unique identifier',
    settings_saas_notification_body                                text                                    null comment 'html body of promotion etc',
    settings_saas_notification_read                                text                                    null comment 'yes|no',
    settings_saas_notification_action                              text                                    null comment 'none|external-link|internal-link',
    settings_saas_notification_action_url                          text                                    null,
    settings_saas_email_server_type                                varchar(30)    default 'local'          null comment 'local |smtp',
    settings_saas_email_forwarding_address                         text                                    null,
    settings_saas_email_local_address                              text                                    null,
    settings_installation_date                                     datetime                                not null comment 'date the system was setup',
    settings_version                                               text                                    not null,
    settings_purchase_code                                         text                                    null comment 'codecanyon code',
    settings_company_name                                          text                                    null,
    settings_company_address_line_1                                text                                    null,
    settings_company_state                                         text                                    null,
    settings_company_city                                          text                                    null,
    settings_company_zipcode                                       text                                    null,
    settings_company_country                                       text                                    null,
    settings_company_telephone                                     text                                    null,
    settings_company_customfield_1                                 text                                    null,
    settings_company_customfield_2                                 text                                    null,
    settings_company_customfield_3                                 text                                    null,
    settings_company_customfield_4                                 text                                    null,
    settings_clients_registration                                  text                                    null comment 'enabled | disabled',
    settings_clients_shipping_address                              text                                    null comment 'enabled | disabled',
    settings_clients_disable_email_delivery                        varchar(12)    default 'disabled'       null comment 'enabled | disabled',
    settings_clients_app_login                                     varchar(12)    default 'enabled'        null comment 'enabled | disabled',
    settings_customfields_display_leads                            varchar(12)    default 'toggled'        null comment 'toggled|expanded',
    settings_customfields_display_clients                          varchar(12)    default 'toggled'        null comment 'toggled|expanded',
    settings_customfields_display_projects                         varchar(12)    default 'toggled'        null comment 'toggled|expanded',
    settings_customfields_display_tasks                            varchar(12)    default 'toggled'        null comment 'toggled|expanded',
    settings_customfields_display_tickets                          varchar(12)    default 'toggled'        null comment 'toggled|expanded',
    settings_email_general_variables                               text                                    null comment 'common variable displayed available in templates',
    settings_email_from_address                                    text                                    null,
    settings_email_from_name                                       text                                    null,
    settings_email_server_type                                     text                                    null comment 'smtp|sendmail',
    settings_email_smtp_host                                       text                                    null,
    settings_email_smtp_port                                       text                                    null,
    settings_email_smtp_username                                   text                                    null,
    settings_email_smtp_password                                   text                                    null,
    settings_email_smtp_encryption                                 text                                    null comment 'tls|ssl|starttls',
    settings_estimates_default_terms_conditions                    text                                    null,
    settings_estimates_prefix                                      text                                    null,
    settings_estimates_show_view_status                            varchar(10)    default 'yes'            null comment 'yes|no',
    settings_modules_projects                                      varchar(10)    default 'enabled'        null comment 'enabled|disabled',
    settings_modules_tasks                                         varchar(10)    default 'enabled'        null comment 'enabled|disabled',
    settings_modules_invoices                                      varchar(10)    default 'enabled'        null comment 'enabled|disabled',
    settings_modules_payments                                      varchar(10)    default 'enabled'        null comment 'enabled|disabled',
    settings_modules_leads                                         varchar(10)    default 'enabled'        null comment 'enabled|disabled',
    settings_modules_knowledgebase                                 varchar(10)    default 'enabled'        null comment 'enabled|disabled',
    settings_modules_estimates                                     varchar(10)    default 'enabled'        null comment 'enabled|disabled',
    settings_modules_expenses                                      varchar(10)    default 'enabled'        null comment 'enabled|disabled',
    settings_modules_notes                                         varchar(10)    default 'enabled'        null comment 'enabled|disabled',
    settings_modules_subscriptions                                 varchar(10)    default 'enabled'        null comment 'enabled|disabled',
    settings_modules_contracts                                     varchar(10)    default 'enabled'        null comment 'enabled|disabled',
    settings_modules_proposals                                     varchar(10)    default 'enabled'        null comment 'enabled|disabled',
    settings_modules_tickets                                       varchar(10)    default 'enabled'        null comment 'enabled|disabled',
    settings_modules_timetracking                                  varchar(10)    default 'enabled'        null comment 'enabled|disabled',
    settings_modules_reminders                                     varchar(10)    default 'enabled'        null comment 'enabled|disabled',
    settings_modules_spaces                                        varchar(10)    default 'enabled'        null comment 'enabled|disabled',
    settings_modules_messages                                      varchar(10)    default 'enabled'        null comment 'enabled|disabled',
    settings_modules_reports                                       text                                    null comment 'enabled|disabled',
    settings_files_max_size_mb                                     int            default 300              null comment 'maximum size in MB',
    settings_knowledgebase_article_ordering                        varchar(40)    default 'name'           null comment 'name-asc|name-desc|date-asc|date-desc',
    settings_knowledgebase_allow_guest_viewing                     varchar(10)    default 'no'             null comment 'yes | no',
    settings_knowledgebase_external_pre_body                       text                                    null comment 'for use when viewing externally, as guest',
    settings_knowledgebase_external_post_body                      text                                    null comment 'for use when viewing externally, as guest',
    settings_knowledgebase_external_header                         text                                    null comment 'for use when viewing externally, as guest',
    settings_system_timezone                                       text                                    null,
    settings_system_date_format                                    text                                    null comment 'd-m-Y | d/m/Y | m-d-Y | m/d/Y | Y-m-d | Y/m/d | Y-d-m | Y/d/m',
    settings_system_datepicker_format                              text                                    null comment 'dd-mm-yyyy | mm-dd-yyyy',
    settings_system_default_leftmenu                               text                                    null comment 'collapsed | open',
    settings_system_default_statspanel                             text                                    null comment 'collapsed | open',
    settings_system_pagination_limits                              tinyint                                 null,
    settings_system_kanban_pagination_limits                       tinyint                                 null,
    settings_system_currency_code                                  text                                    null,
    settings_system_currency_symbol                                text                                    null,
    settings_system_currency_position                              text                                    null comment 'left|right',
    settings_system_decimal_separator                              text                                    null,
    settings_system_thousand_separator                             text                                    null,
    settings_system_close_modals_body_click                        varchar(10)    default 'no'             null comment 'yes|no',
    settings_system_language_default                               varchar(40)    default 'en'             null comment 'english|french|etc',
    settings_system_language_allow_users_to_change                 varchar(10)    default 'yes'            null comment 'yes|no',
    settings_system_logo_large_name                                varchar(40)    default 'logo.jpg'       null,
    settings_system_logo_small_name                                varchar(40)    default 'logo-small.jpg' null,
    settings_system_logo_versioning                                varchar(40)    default '1'              null comment 'used to refresh logo when updated',
    settings_system_session_login_popup                            varchar(10)    default 'disabled'       null comment 'enabled|disabled',
    settings_system_javascript_versioning                          date                                    null,
    settings_system_exporting_strip_html                           varchar(10)    default 'yes'            null comment 'yes|no',
    settings_tags_allow_users_create                               varchar(10)    default 'yes'            null comment 'yes|no',
    settings_leads_allow_private                                   varchar(10)    default 'yes'            null comment 'yes|no',
    settings_leads_allow_new_sources                               varchar(10)    default 'yes'            null comment 'yes|no',
    settings_leads_kanban_value                                    text                                    null comment 'show|hide',
    settings_leads_kanban_date_created                             text                                    null comment 'show|hide',
    settings_leads_kanban_category                                 text                                    null comment 'show|hide',
    settings_leads_kanban_date_contacted                           text                                    null comment 'show|hide',
    settings_leads_kanban_telephone                                text                                    null comment 'show|hide',
    settings_leads_kanban_source                                   text                                    null comment 'show|hide',
    settings_leads_kanban_email                                    text                                    null comment 'show|hide',
    settings_leads_kanban_tags                                     text                                    null,
    settings_leads_kanban_reminder                                 text                                    null,
    settings_tasks_client_visibility                               text                                    null comment 'visible|invisible - used in create new task form on the checkbox ',
    settings_tasks_billable                                        text                                    null comment 'billable|not-billable - used in create new task form on the checkbox ',
    settings_tasks_kanban_date_created                             text                                    null comment 'show|hide',
    settings_tasks_kanban_date_due                                 text                                    null comment 'show|hide',
    settings_tasks_kanban_date_start                               text                                    null comment 'show|hide',
    settings_tasks_kanban_priority                                 text                                    null comment 'show|hide',
    settings_tasks_kanban_client_visibility                        text                                    null comment 'show|hide',
    settings_tasks_kanban_project_title                            varchar(10)    default 'show'           null comment 'show|hide',
    settings_tasks_kanban_client_name                              varchar(10)    default 'show'           null comment 'show|hide',
    settings_tasks_kanban_tags                                     text                                    null,
    settings_tasks_kanban_reminder                                 text                                    null,
    settings_tasks_send_overdue_reminder                           varchar(10)    default 'yes'            null comment 'yes|no',
    settings_invoices_prefix                                       text                                    null,
    settings_invoices_recurring_grace_period                       smallint                                null comment 'Number of days for due date on recurring invoices. If set to zero, invoices will be given due date same as invoice date',
    settings_invoices_default_terms_conditions                     text                                    null,
    settings_invoices_show_view_status                             text                                    not null,
    settings_projects_cover_images                                 varchar(10)    default 'disabled'       null comment 'enabled|disabled',
    settings_projects_permissions_basis                            varchar(40)    default 'user_roles'     null comment 'user_roles|category_based',
    settings_projects_categories_main_menu                         varchar(10)    default 'no'             null comment 'yes|no',
    settings_projects_default_hourly_rate                          decimal(10, 2) default 0.00             null comment 'default hourly rate for new projects',
    settings_projects_allow_setting_permission_on_project_creation text                                    null comment 'yes|no',
    settings_projects_clientperm_files_view                        text                                    null comment 'yes|no',
    settings_projects_clientperm_files_upload                      text                                    null comment 'yes|no',
    settings_projects_clientperm_comments_view                     text                                    null comment 'yes|no',
    settings_projects_clientperm_comments_post                     text                                    null comment 'yes|no',
    settings_projects_clientperm_tasks_view                        text                                    null comment 'yes|no',
    settings_projects_clientperm_tasks_collaborate                 text                                    null comment 'yes|no',
    settings_projects_clientperm_tasks_create                      text                                    null comment 'yes|no',
    settings_projects_clientperm_timesheets_view                   text                                    null comment 'yes|no',
    settings_projects_clientperm_expenses_view                     text                                    null comment 'yes|no',
    settings_projects_clientperm_milestones_view                   text                                    null comment 'yes|no',
    settings_projects_clientperm_assigned_view                     text                                    null comment 'yes|no',
    settings_projects_assignedperm_milestone_manage                text                                    null comment 'yes|no',
    settings_projects_assignedperm_tasks_collaborate               text                                    null comment 'yes|no',
    settings_stripe_secret_key                                     text                                    null,
    settings_stripe_public_key                                     text                                    null,
    settings_stripe_webhooks_key                                   text                                    null comment 'from strip dashboard',
    settings_stripe_default_subscription_plan_id                   text                                    null,
    settings_stripe_currency                                       text                                    null,
    settings_stripe_display_name                                   text                                    null comment 'what customer will see on payment screen',
    settings_stripe_status                                         text                                    null comment 'enabled|disabled',
    settings_subscriptions_prefix                                  varchar(40)    default 'SUB-'           null,
    settings_paypal_email                                          text                                    null,
    settings_paypal_currency                                       text                                    null,
    settings_paypal_display_name                                   text                                    null comment 'what customer will see on payment screen',
    settings_paypal_mode                                           text                                    null comment 'sandbox | live',
    settings_paypal_status                                         text                                    null comment 'enabled|disabled',
    settings_mollie_live_api_key                                   text                                    null,
    settings_mollie_test_api_key                                   text                                    null,
    settings_mollie_display_name                                   text                                    null,
    settings_mollie_mode                                           varchar(40)    default 'live'           null,
    settings_mollie_currency                                       text                                    null,
    settings_mollie_status                                         varchar(10)    default 'disabled'       null comment 'enabled|disabled',
    settings_bank_details                                          text                                    null,
    settings_bank_display_name                                     text                                    null comment 'what customer will see on payment screen',
    settings_bank_status                                           text                                    null comment 'enabled|disabled',
    settings_razorpay_keyid                                        text                                    null,
    settings_razorpay_secretkey                                    text                                    null,
    settings_razorpay_currency                                     text                                    null,
    settings_razorpay_display_name                                 text                                    null,
    settings_razorpay_status                                       varchar(10)    default 'disabled'       null,
    settings_completed_check_email                                 varchar(10)    default 'no'             null comment 'yes|no',
    settings_expenses_billable_by_default                          varchar(10)    default 'yes'            null comment 'yes|no',
    settings_tickets_edit_subject                                  text                                    null comment 'yes|no',
    settings_tickets_edit_body                                     text                                    null comment 'yes|no',
    settings_theme_name                                            varchar(60)    default 'default'        null comment 'default|darktheme',
    settings_theme_head                                            text                                    null,
    settings_theme_body                                            text                                    null,
    settings_track_thankyou_session_id                             text                                    null comment 'used to ensure we show thank you page just once',
    settings_proposals_prefix                                      varchar(30)    default 'PROP-'          null,
    settings_proposals_show_view_status                            varchar(10)    default 'yes'            null comment 'yes|no',
    settings_contracts_prefix                                      varchar(30)    default 'CONT-'          null,
    settings_contracts_show_view_status                            varchar(10)    default 'yes'            null comment 'yes|no',
    settings_cronjob_has_run                                       varchar(10)    default 'no'             null comment 'yes|no',
    settings_cronjob_last_run                                      datetime                                null
)
    engine = MyISAM;

create table if not exists crm_config2
(
    settings2_id                                                int auto_increment
        primary key,
    settings2_created                                           datetime                           not null,
    settings2_updated                                           datetime                           not null,
    settings2_bills_pdf_css                                     text                               null,
    settings2_captcha_api_site_key                              text                               null,
    settings2_captcha_api_secret_key                            text                               null,
    settings2_captcha_status                                    varchar(10)  default 'disabled'    null comment 'disabled|enabled',
    settings2_estimates_automation_default_status               varchar(10)  default 'disabled'    null comment 'disabled|enabled',
    settings2_estimates_automation_create_project               varchar(10)  default 'no'          null comment 'yes|no',
    settings2_estimates_automation_project_status               varchar(50)  default 'in_progress' null comment 'not_started | in_progress | on_hold',
    settings2_estimates_automation_project_title                text                               null comment 'default project title',
    settings2_estimates_automation_project_email_client         varchar(10)  default 'no'          null comment 'yes|no',
    settings2_estimates_automation_create_invoice               varchar(10)  default 'no'          null comment 'yes|no',
    settings2_estimates_automation_invoice_email_client         varchar(10)  default 'no'          null comment 'yes|no',
    settings2_estimates_automation_invoice_due_date             int          default 7             null,
    settings2_estimates_automation_create_tasks                 varchar(10)  default 'no'          null comment 'yes|no',
    settings2_estimates_automation_copy_attachments             varchar(10)  default 'yes'         null comment 'yes|no',
    settings2_extras_dimensions_billing                         varchar(10)  default 'disabled'    null comment 'enabled|disabled',
    settings2_extras_dimensions_default_unit                    varchar(30)  default 'm2'          null,
    settings2_extras_dimensions_show_measurements               varchar(10)  default 'no'          null comment 'show on the pd,web etc',
    settings2_projects_automation_default_status                varchar(10)  default 'disabled'    null comment 'disabled|enabled',
    settings2_projects_automation_create_invoices               varchar(10)  default 'no'          null comment 'yes|no',
    settings2_projects_automation_convert_estimates_to_invoices varchar(10)  default 'no'          null comment 'yes|no',
    settings2_projects_automation_skip_draft_estimates          varchar(10)  default 'yes'         null comment 'yes|no',
    settings2_projects_automation_skip_declined_estimates       varchar(10)  default 'yes'         null comment 'yes|no',
    settings2_projects_automation_invoice_unbilled_hours        varchar(10)  default 'no'          null comment 'yes|no',
    settings2_projects_automation_invoice_hourly_rate           decimal(10, 2)                     null,
    settings2_projects_automation_invoice_hourly_tax_1          int                                null,
    settings2_projects_automation_invoice_email_client          varchar(10)  default 'no'          null,
    settings2_projects_automation_invoice_due_date              int(20)      default 7             null,
    settings2_tasks_manage_dependencies                         varchar(60)  default 'super-users' null comment 'admin-users | super-users | all-task-users',
    settings2_tap_secret_key                                    text                               null,
    settings2_tap_publishable_key                               text                               null,
    settings2_tap_currency_code                                 text                               null,
    settings2_tap_language                                      varchar(10)  default 'en'          null comment 'arabic (ar) | english (en)',
    settings2_tap_display_name                                  text                               null,
    settings2_tap_status                                        varchar(10)  default 'disabled'    null comment 'enabled|disabled',
    settings2_paystack_secret_key                               text                               null,
    settings2_paystack_public_key                               text                               null,
    settings2_paystack_currency_code                            text                               null,
    settings2_paystack_display_name                             text                               null,
    settings2_paystack_status                                   varchar(10)  default 'disabled'    null comment 'enabled|disabled',
    settings2_file_folders_status                               varchar(10)  default 'enabled'     null comment 'enabled|disabled',
    settings2_file_folders_manage_assigned                      varchar(10)  default 'yes'         null comment 'yes|no',
    settings2_file_folders_manage_project_manager               varchar(10)  default 'yes'         null comment 'yes|no',
    settings2_file_folders_manage_client                        varchar(10)  default 'yes'         null comment 'yes|no',
    settings2_file_bulk_download                                varchar(10)  default 'enabled'     null comment 'enabled|disabled',
    settings2_spaces_team_space_id                              text                               null,
    settings2_spaces_team_space_status                          varchar(10)  default 'enabled'     null comment 'enabled|disabled',
    settings2_spaces_user_space_status                          varchar(10)  default 'enabled'     null comment 'enabled|disabled',
    settings2_spaces_team_space_title                           varchar(150) default 'Team Space'  null,
    settings2_spaces_user_space_title                           varchar(150) default 'My Space'    null,
    settings2_spaces_team_space_menu_name                       varchar(150) default 'Team Space'  null,
    settings2_spaces_user_space_menu_name                       varchar(150) default 'Space'       null,
    settings2_spaces_features_files                             varchar(10)  default 'enabled'     null comment 'enabled|disabled',
    settings2_spaces_features_notes                             varchar(10)  default 'enabled'     null comment 'enabled|disabled',
    settings2_spaces_features_comments                          varchar(10)  default 'enabled'     null comment 'enabled|disabled',
    settings2_spaces_features_tasks                             varchar(10)  default 'enabled'     null comment 'enabled|disabled',
    settings2_spaces_features_whiteboard                        varchar(10)  default 'enabled'     null comment 'enabled|disabled',
    settings2_spaces_features_checklists                        varchar(10)  default 'enabled'     null comment 'enabled|disabled',
    settings2_spaces_features_todos                             varchar(10)  default 'enabled'     null comment 'enabled|disabled',
    settings2_spaces_features_reminders                         varchar(10)  default 'enabled'     null comment 'enabled|disabled',
    settings2_tickets_replying_interface                        varchar(10)  default 'popup'       null comment 'popup|inline',
    settings2_tickets_archive_button                            varchar(10)  default 'yes'         null comment 'yes|no',
    settings2_projects_cover_images_show_on_project             varchar(10)  default 'no'          null comment 'yes|no',
    settings2_onboarding_status                                 varchar(10)  default 'disabled'    null comment 'enabled|disabled',
    settings2_onboarding_content                                text                               null,
    settings2_onboarding_view_status                            varchar(10)  default 'unseen'      null comment 'seen|unseen',
    settings2_tweak_reports_truncate_long_text                  varchar(10)  default 'yes'         null comment 'yes|no'
)
    engine = MyISAM;

create table if not exists crm_contratos
(
    doc_id                                  int auto_increment
        primary key,
    doc_unique_id                           varchar(150)                    null,
    doc_template                            varchar(150)                    null comment 'default',
    doc_created                             datetime                        not null,
    doc_updated                             datetime                        not null,
    doc_date_status_change                  datetime                        not null,
    doc_creatorid                           int                             not null comment 'use ( -1 ) for logged out user.',
    doc_categoryid                          int          default 11         null comment '11 is the default category',
    doc_heading                             varchar(250) default '#7493a9'  null comment 'e.g. contract',
    doc_heading_color                       varchar(30)  default '#7493a9'  null,
    doc_title                               varchar(250)                    null,
    doc_title_color                         varchar(30)                     null,
    doc_hero_direcory                       varchar(250)                    null,
    doc_hero_filename                       varchar(250)                    null,
    doc_hero_updated                        varchar(250) default 'no'       null comment 'ys|no (when no, we use default image path)',
    doc_body                                text                            null,
    doc_date_start                          date                            null comment 'Proposal Issue Date | Contract Start Date',
    doc_date_end                            date                            null comment 'Proposal Expiry Date | Contract End Date',
    doc_date_published                      date                            null,
    doc_date_last_emailed                   datetime                        null,
    doc_value                               decimal(10, 2)                  null,
    doc_client_id                           int                             null,
    doc_project_id                          int                             null,
    doc_lead_id                             int                             null,
    doc_notes                               text                            null,
    doc_viewed                              varchar(20)  default 'no'       null comment 'yes|no',
    doc_type                                varchar(150) default 'contract' null,
    doc_system_type                         varchar(150) default 'document' null comment 'document|template',
    doc_provider_signed_userid              int                             null,
    doc_provider_signed_date                datetime                        null,
    doc_provider_signed_first_name          varchar(150)                    null,
    doc_provider_signed_last_name           varchar(150)                    null,
    doc_provider_signed_signature_directory varchar(150)                    null,
    doc_provider_signed_signature_filename  varchar(150)                    null,
    doc_provider_signed_ip_address          varchar(150)                    null,
    doc_provider_signed_status              varchar(50)  default 'unsigned' null comment 'signed|unsigned',
    doc_signed_userid                       int                             null,
    doc_signed_date                         datetime                        null,
    doc_signed_first_name                   varchar(150) default ''         null,
    doc_signed_last_name                    varchar(150) default ''         null,
    doc_signed_signature_directory          varchar(150) default ''         null,
    doc_signed_signature_filename           varchar(150) default ''         null,
    doc_signed_status                       varchar(50)  default 'unsigned' null comment 'signed|unsigned',
    doc_signed_ip_address                   varchar(150)                    null,
    doc_fallback_client_first_name          varchar(150) default ''         null comment 'used for creating events when users are not logged in',
    doc_fallback_client_last_name           varchar(150) default ''         null comment 'used for creating events when users are not logged in',
    doc_fallback_client_email               varchar(150) default ''         null comment 'used for creating events when users are not logged in',
    doc_status                              varchar(100) default 'draft'    null comment 'draft|awaiting_signatures|active|expired',
    docresource_type                        varchar(100)                    null comment 'client|lead',
    docresource_id                          int                             null
);

create table if not exists crm_correoelectronico
(
    emaillog_id         int auto_increment
        primary key,
    emaillog_created    datetime                                  null,
    emaillog_updated    datetime                                  null,
    emaillog_email      varchar(100)                              null,
    emaillog_subject    varchar(200)                              null,
    emaillog_body       text                                      null,
    emaillog_attachment varchar(250) default 'attached file name' null
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_correoencola
(
    emailqueue_id                int auto_increment
        primary key,
    emailqueue_created           datetime                       not null,
    emailqueue_updated           datetime                       not null,
    emailqueue_to                varchar(150)                   null,
    emailqueue_from_email        varchar(150)                   null comment 'optional (used in sending client direct email)',
    emailqueue_from_name         varchar(150)                   null comment 'optional (used in sending client direct email)',
    emailqueue_subject           varchar(250)                   null,
    emailqueue_message           text                           null,
    emailqueue_type              varchar(150) default 'general' null comment 'general|pdf (used for emails that need to generate a pdf)',
    emailqueue_attachments       text                           null comment 'json of request(''attachments'')',
    emailqueue_resourcetype      varchar(10)                    null comment 'e.g. invoice. Used mainly for deleting records, when resource has been deleted',
    emailqueue_resourceid        int                            null,
    emailqueue_pdf_resource_type varchar(50)                    null comment 'estimate|invoice',
    emailqueue_pdf_resource_id   int                            null comment 'resource id (e.g. estimate id)',
    emailqueue_started_at        datetime                       null comment 'timestamp of when processing started',
    emailqueue_status            varchar(20)  default 'new'     null comment 'new|processing (set to processing by the cronjob, to avoid duplicate processing)'
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_cs_eventos
(
    cs_event_id            int auto_increment
        primary key,
    cs_event_created       date           not null,
    cs_event_updated       date           not null,
    cs_event_affliateid    int            not null,
    cs_event_invoiceid     int            not null,
    cs_event_project_title varchar(250)   null,
    cs_event_amount        decimal(10, 2) not null
);

create table if not exists crm_cs_gananciasdelafiliado
(
    cs_affiliate_earning_id                       int auto_increment
        primary key,
    cs_affiliate_earning_created                  datetime                         not null,
    cs_affiliate_earning_updated                  datetime                         not null,
    cs_affiliate_earning_projectid                int                              not null comment '[cs_affiliate_projects] table id',
    cs_affiliate_earning_invoiceid                int                              not null,
    cs_affiliate_earning_invoice_payment_date     datetime                         null,
    cs_affiliate_earning_commission_approval_date datetime                         null,
    cs_affiliate_earning_affiliateid              int                              not null,
    cs_affiliate_earning_amount                   decimal(10, 2)                   not null,
    cs_affiliate_earning_commission_rate          decimal(10, 2) default 0.00      not null comment 'set at the time of invoice payment',
    cs_affiliate_earning_status                   varchar(30)    default 'pending' not null comment 'paid|pending'
);

create table if not exists crm_cs_proyectosdelafiliado
(
    cs_affiliate_project_id              int auto_increment
        primary key,
    cs_affiliate_project_created         int                           not null,
    cs_affiliate_project_updated         int                           not null,
    cs_affiliate_project_creatorid       int                           not null,
    cs_affiliate_project_affiliateid     int                           not null,
    cs_affiliate_project_projectid       int                           not null,
    cs_affiliate_project_commission_rate decimal(10, 2)                null,
    cs_affiliate_project_status          varchar(100) default 'active' null comment 'active|suspended'
);

create table if not exists crm_dependenciasdetareasdeproducto
(
    product_task_dependency_id        int auto_increment
        primary key,
    product_task_dependency_created   date         not null,
    product_task_dependency_updated   date         not null,
    product_task_dependency_taskid    int          null,
    product_task_dependency_blockerid int          null,
    product_task_dependency_type      varchar(100) null comment 'cannot_complete|cannot_start'
);

create table if not exists crm_estadosdetareas
(
    taskstatus_id             int auto_increment
        primary key,
    taskstatus_created        datetime                       null,
    taskstatus_creatorid      int                            null,
    taskstatus_updated        datetime                       null,
    taskstatus_title          varchar(200)                   not null,
    taskstatus_position       int                            not null,
    taskstatus_color          varchar(100) default 'default' not null comment 'default|primary|success|info|warning|danger|lime|brown',
    taskstatus_system_default varchar(10)  default 'no'      not null comment 'yes | no'
)
    comment '[do not truncate]  expected to have 2 system default statuses (ID: 1 & 2) ''new'' & ''converted'' statuses '
    engine = MyISAM;

create table if not exists crm_estadosdetickets
(
    ticketstatus_id                     int auto_increment
        primary key,
    ticketstatus_created                datetime                       null,
    ticketstatus_creatorid              int                            null,
    ticketstatus_updated                datetime                       null,
    ticketstatus_title                  varchar(200)                   not null,
    ticketstatus_position               int                            not null,
    ticketstatus_color                  varchar(100) default 'default' not null comment 'default|primary|success|info|warning|danger|lime|brown',
    ticketstatus_use_for_client_replied varchar(10)  default 'no'      not null comment 'yes | no',
    ticketstatus_use_for_team_replied   varchar(10)  default 'no'      not null comment 'yes | no',
    ticketstatus_system_default         varchar(10)  default 'no'      not null comment 'yes | no'
)
    comment '[do not truncate]  expected to have 2 system default statuses (ID: 1 & 2) ''new'' & ''converted'' statuses '
    engine = MyISAM;

create table if not exists crm_estimaciones
(
    bill_estimateid                            int auto_increment
        primary key,
    bill_uniqueid                              varchar(100)                         null,
    bill_created                               datetime                             null,
    bill_updated                               datetime                             null,
    bill_date_sent_to_customer                 datetime                             null,
    bill_date_status_change                    datetime                             null,
    bill_clientid                              int                                  null,
    bill_projectid                             int                                  null,
    bill_proposalid                            int                                  null,
    bill_contractid                            int                                  null,
    bill_creatorid                             int                                  not null,
    bill_categoryid                            int            default 4             not null,
    bill_date                                  date                                 not null,
    bill_expiry_date                           date                                 null,
    bill_subtotal                              decimal(15, 2) default 0.00          not null,
    bill_discount_type                         varchar(30)    default 'none'        null comment 'amount | percentage | none',
    bill_discount_percentage                   decimal(15, 2) default 0.00          null comment 'actual amount or percentage',
    bill_discount_amount                       decimal(15, 2) default 0.00          null,
    bill_amount_before_tax                     decimal(15, 2) default 0.00          null,
    bill_tax_type                              varchar(20)    default 'summary'     null comment 'summary|inline|none',
    bill_tax_total_percentage                  decimal(15, 2) default 0.00          null comment 'percentage',
    bill_tax_total_amount                      decimal(15, 2) default 0.00          null comment 'amount',
    bill_adjustment_description                varchar(250)                         null,
    bill_adjustment_amount                     decimal(15, 2) default 0.00          null,
    bill_final_amount                          decimal(15, 2) default 0.00          null,
    bill_notes                                 text                                 null,
    bill_terms                                 text                                 null,
    bill_status                                varchar(50)    default 'draft'       not null comment 'draft | new | accepted | revised | declined | expired',
    bill_type                                  varchar(150)   default 'estimate'    not null comment 'estimate|invoice',
    bill_estimate_type                         varchar(150)   default 'estimate'    not null comment 'estimate|document',
    bill_visibility                            varchar(150)   default 'visible'     not null comment 'visible|hidden (used to prevent estimates that are still being cloned from showing in estimates list)',
    bill_viewed_by_client                      varchar(20)    default 'no'          null comment 'yes|no',
    bill_system                                varchar(20)    default 'no'          null comment 'yes|no',
    bill_converted_to_invoice                  varchar(20)    default 'no'          null comment 'Added as of V1.10',
    bill_converted_to_invoice_invoiceid        int                                  null comment 'Added as of V1.10',
    estimate_automation_status                 varchar(100)   default 'disabled'    null comment 'disabled|enabled',
    estimate_automation_create_project         varchar(50)    default 'no'          null comment 'yes|no',
    estimate_automation_project_title          varchar(250)                         null,
    estimate_automation_project_status         varchar(100)   default 'in_progress' null comment 'not_started | in_progress | on_hold',
    estimate_automation_create_tasks           varchar(50)    default 'no'          null comment 'yes|no',
    estimate_automation_project_email_client   varchar(50)    default 'no'          null comment 'yes|no',
    estimate_automation_create_invoice         varchar(50)    default 'no'          null comment 'yes|no',
    estimate_automation_invoice_due_date       int            default 7             null,
    estimate_automation_invoice_email_client   varchar(50)    default 'no'          null,
    estimate_automation_copy_attachments       varchar(50)    default 'no'          null comment 'yes|no',
    estimate_automation_log_created_project_id int                                  null,
    estimate_automation_log_created_invoice_id int                                  null
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_etiquetas
(
    tag_id           int auto_increment
        primary key,
    tag_created      datetime                   null,
    tag_updated      datetime                   null,
    tag_creatorid    int                        null,
    tag_title        varchar(100)               not null,
    tag_visibility   varchar(50) default 'user' not null comment 'public | user  (public tags are only created via admin settings)',
    tagresource_type varchar(50)                not null comment '[polymorph] invoice | project | client | lead | task | estimate | ticket | contract | note | subscription | contract | proposal',
    tagresource_id   int                        not null comment '[polymorph] e.g project_id'
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_eventos
(
    event_id                    int auto_increment
        primary key,
    event_created               datetime                   null comment '[notes] Events record the event, whilst timelines determine where the event is displayed',
    event_updated               datetime                   null,
    event_creatorid             int                        not null comment 'use ( -1 ) for logged out user.',
    event_clientid              int                        null comment 'for client type resources',
    event_creator_name          varchar(150)               null comment 'for events created by users who are not registered (e.g. accepting a proposal)',
    event_item                  varchar(150)               null comment 'status | project | task | lead | expense | estimate| comment | attachment | file | invoice | payment | assigned',
    event_item_id               int                        null comment 'e.g. invoice_id (used in the link shown in the even)',
    event_item_content          text                       null comment 'e.g. #INV-029200 (used in the text if the event, also in the link text)',
    event_item_content2         text                       null comment 'extra content',
    event_item_content3         text                       null comment 'extra content',
    event_item_content4         text                       null comment 'extra content',
    event_item_lang             varchar(150)               null comment '(e.g. - event_created_invoice found in the lang file )',
    event_item_lang_alt         varchar(150)               null comment 'Example: Fred posted a comment (as opposed to) You posed a comment',
    event_parent_type           varchar(150)               null comment 'used to identify the parent up the tree (e.g. for a task, parent is project) (.e.g. for a task comment, parent is task)',
    event_parent_id             varchar(150)               null comment 'id of the parent item (e.g project_id)',
    event_parent_title          varchar(150)               null comment 'e.g. task title',
    event_show_item             varchar(150) default 'yes' null comment 'yes|no (if the item should be shown in the notifications dopdown)',
    event_show_in_timeline      varchar(150) default 'yes' null comment 'yes|no (if this should show the project timeline)',
    event_notification_category varchar(150)               null comment '(e.g. notifications_new_invoice) This determins if a user will get a web notification, an email, both, or none. As per the settings in the [user] table and the login in the [eventTrackingRepo)',
    eventresource_type          varchar(50)                null comment '[polymorph] project | ticket | lead (e.g. if you want the event to show in the project timeline, then eventresource_type  must be set to project)',
    eventresource_id            int                        null comment '[polymorph] e.g project_id'
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_facturas
(
    bill_invoiceid                int auto_increment
        primary key,
    bill_uniqueid                 varchar(100)                     null,
    bill_created                  datetime                         null,
    bill_updated                  datetime                         null,
    bill_date_sent_to_customer    date                             null comment 'the date an invoice was published or lasts emailed to the customer',
    bill_date_status_change       datetime                         null,
    bill_clientid                 int                              not null,
    bill_projectid                int                              null comment 'optional',
    bill_subscriptionid           int                              null comment 'optional',
    bill_creatorid                int                              not null,
    bill_categoryid               int            default 4         not null,
    bill_date                     date                             not null,
    bill_due_date                 date                             null,
    bill_subtotal                 decimal(15, 2) default 0.00      not null,
    bill_discount_type            varchar(30)    default 'none'    null comment 'amount | percentage | none',
    bill_discount_percentage      decimal(15, 2) default 0.00      null comment 'actual amount or percentage',
    bill_discount_amount          decimal(15, 2) default 0.00      null,
    bill_amount_before_tax        decimal(15, 2) default 0.00      null,
    bill_tax_type                 varchar(20)    default 'summary' null comment 'summary|inline|none',
    bill_tax_total_percentage     decimal(15, 2) default 0.00      null comment 'percentage',
    bill_tax_total_amount         decimal(15, 2) default 0.00      null comment 'amount',
    bill_adjustment_description   varchar(250)                     null,
    bill_adjustment_amount        decimal(15, 2) default 0.00      null,
    bill_final_amount             decimal(15, 2) default 0.00      null,
    bill_notes                    text                             null,
    bill_terms                    text                             null,
    bill_status                   varchar(50)    default 'draft'   not null comment 'draft | due | overdue | paid | part_paid',
    bill_recurring                varchar(50)    default 'no'      null comment 'yes|no',
    bill_recurring_duration       int                              null comment 'e.g. 20 (for 20 days)',
    bill_recurring_period         varchar(30)                      null comment 'day | week | month | year',
    bill_recurring_cycles         int                              null comment '0 for infinity',
    bill_recurring_cycles_counter int                              null comment 'number of times it has been renewed',
    bill_recurring_last           date                             null comment 'date when it was last renewed',
    bill_recurring_next           date                             null comment 'date when it will next be renewed',
    bill_recurring_child          varchar(5)     default 'no'      null comment 'yes|no',
    bill_recurring_parent_id      int                              null comment 'if it was generated from a recurring invoice, the id of parent invoice',
    bill_overdue_reminder_sent    varchar(5)     default 'no'      null comment 'yes | no',
    bill_invoice_type             varchar(30)    default 'onetime' null comment 'onetime | subscription',
    bill_type                     varchar(20)    default 'invoice' null comment 'invoice|estimate',
    bill_visibility               varchar(20)    default 'visible' null comment 'visible|hidden (used to prevent invoices that are still being cloned from showing in invoices list)',
    bill_cron_status              varchar(20)    default 'none'    null comment 'none|processing|completed|error  (used to prevent collisions when recurring invoiced)',
    bill_cron_date                datetime                         null comment 'date when cron was run',
    bill_viewed_by_client         varchar(20)    default 'no'      null comment 'yes|no',
    bill_system                   varchar(20)    default 'no'      null comment 'yes|no'
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_gastos
(
    expense_id                 int auto_increment
        primary key,
    expense_importid           varchar(100)                       null,
    expense_created            date                               null,
    expense_updated            date                               null,
    expense_date               date                               null,
    expense_clientid           int                                null,
    expense_projectid          int                                null,
    expense_creatorid          int                                not null,
    expense_categoryid         int         default 7              not null,
    expense_amount             decimal(10, 2)                     not null,
    expense_description        text                               null,
    expense_type               text                               null comment 'business|client',
    expense_billable           varchar(30) default 'not_billable' null comment 'billable | not_billable',
    expense_billing_status     varchar(30) default 'not_invoiced' null comment 'invoiced | not_invoiced',
    expense_billable_invoiceid int                                null comment 'id of the invoice that it has been billed to'
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_gestordeproyectos
(
    projectsmanager_id        int auto_increment
        primary key,
    projectsmanager_created   datetime not null,
    projectsmanager_updated   datetime not null,
    projectsmanager_projectid int      null,
    projectsmanager_userid    int      not null
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_impuesto
(
    tax_id           int auto_increment
        primary key,
    tax_taxrateid    int                           not null comment 'Reference to tax rates table',
    tax_created      datetime                      not null,
    tax_updated      datetime                      not null,
    tax_name         varchar(100)                  null,
    tax_rate         decimal(10, 2)                null,
    tax_type         varchar(50) default 'summary' null comment 'summary|inline',
    tax_lineitem_id  int                           null comment 'for inline taxes',
    taxresource_type varchar(50)                   null comment 'invoice|estimate|lineitem',
    taxresource_id   int                           null
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_kb_categorias
(
    kbcategory_id             int auto_increment
        primary key,
    kbcategory_created        datetime                        not null,
    kbcategory_updated        datetime                        not null,
    kbcategory_creatorid      int                             not null,
    kbcategory_title          varchar(250)                    not null,
    kbcategory_description    text                            null,
    kbcategory_position       int                             null,
    kbcategory_visibility     varchar(50)  default 'everyone' null comment 'everyone | team | client',
    kbcategory_slug           varchar(250)                    null,
    kbcategory_icon           varchar(250)                    null,
    kbcategory_type           varchar(50)  default 'text'     null comment 'text|video',
    kbcategory_system_default varchar(250) default 'no'       null comment 'yes | no'
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_lineadearticulos
(
    lineitem_id                  int auto_increment
        primary key,
    lineitem_position            int                            null,
    lineitem_created             datetime                       null,
    lineitem_updated             datetime                       null,
    lineitem_description         text                           null,
    lineitem_rate                varchar(250)                   null,
    lineitem_unit                varchar(100)                   null,
    lineitem_quantity            float                          null,
    lineitem_total               decimal(15, 2)                 null,
    lineitemresource_linked_type varchar(30)                    null comment 'task | expense',
    lineitemresource_linked_id   int                            null comment 'e.g. task id',
    lineitemresource_type        varchar(50)                    null comment '[polymorph] invoice | estimate',
    lineitemresource_id          int                            null comment '[polymorph] e.g invoice_id',
    lineitem_type                varchar(10)  default 'plain'   null comment 'plain|time|dimensions',
    lineitem_time_hours          int                            null,
    lineitem_time_minutes        int                            null,
    lineitem_time_timers_list    text                           null comment 'comma separated list of timers',
    lineitem_dimensions_length   float                          null,
    lineitem_dimensions_width    float                          null,
    lineitem_tax_status          varchar(100) default 'taxable' null comment 'taxable|exempt  - this is inherited from the product/item setting',
    lineitem_linked_product_id   int                            null comment 'the original product that created this line item'
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_lineasdetiempo
(
    timeline_id           int auto_increment
        primary key,
    timeline_eventid      int         not null,
    timeline_resourcetype varchar(50) null comment 'invoices | projects | estimates | etc',
    timeline_resourceid   int         null comment 'the id of the item affected'
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_listasdecontrol
(
    checklist_id           int auto_increment
        primary key,
    checklist_position     int                            not null,
    checklist_created      datetime                       not null,
    checklist_updated      datetime                       not null,
    checklist_creatorid    int                            not null,
    checklist_clientid     int                            null,
    checklist_text         text                           not null,
    checklist_status       varchar(250) default 'pending' not null comment 'pending | completed',
    checklistresource_type varchar(50)                    not null,
    checklistresource_id   int                            not null
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_mensajes
(
    message_id               int auto_increment
        primary key,
    message_unique_id        varchar(100)                  not null,
    message_created          datetime                      not null,
    message_updated          datetime                      not null,
    message_timestamp        int                           not null,
    message_creatorid        int                           not null,
    message_source           varchar(150)                  not null comment 'sender unique id',
    message_target           varchar(150)                  not null comment 'receivers unique id',
    message_creator_uniqueid varchar(150)                  null,
    message_target_uniqueid  varchar(150)                  null,
    message_text             text                          null,
    message_file_name        varchar(250)                  null,
    message_file_directory   varchar(150)                  null,
    message_file_thumb_name  varchar(150)                  null,
    message_file_type        varchar(50)                   null comment 'file | image',
    message_type             varchar(150) default 'file'   null comment 'text | file',
    message_status           varchar(150) default 'unread' null comment 'read | unread'
);

create table if not exists crm_metas
(
    milestone_id        int auto_increment
        primary key,
    milestone_created   datetime                             not null,
    milestone_updated   datetime                             not null,
    milestone_creatorid int                                  not null,
    milestone_title     varchar(250) default 'uncategorised' not null,
    milestone_projectid int                                  null,
    milestone_position  int          default 1               not null,
    milestone_type      varchar(50)  default 'categorised'   not null comment 'categorised|uncategorised [1 uncategorised milestone if automatically created when a new project is created]'
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_notas
(
    note_id           int auto_increment
        primary key,
    note_created      datetime                     null comment 'always now()',
    note_updated      datetime                     null,
    note_creatorid    int                          null,
    note_title        varchar(250)                 null,
    note_description  text                         null,
    note_visibility   varchar(30) default 'public' null comment 'private|public',
    noteresource_type varchar(50)                  null comment '[polymorph] client | project | user | lead',
    noteresource_id   int                          null comment '[polymorph] e.g project_id'
)
    comment '[truncate]. Notes are always private to the user who created them. They are never visible to anyone else'
    engine = MyISAM;

create table if not exists crm_pagos
(
    payment_id             int auto_increment comment '[truncate]'
        primary key,
    payment_created        datetime                      null,
    payment_updated        datetime                      null,
    payment_creatorid      int                           null comment '''0'' for system',
    payment_date           date                          null,
    payment_invoiceid      int                           null comment 'invoice id',
    payment_subscriptionid int                           null comment 'subscription id',
    payment_clientid       int                           null,
    payment_projectid      int                           null,
    payment_amount         decimal(10, 2)                not null,
    payment_transaction_id varchar(100)                  null,
    payment_gateway        varchar(100)                  null comment 'paypal | stripe | cash | bank',
    payment_notes          text                          null,
    payment_type           varchar(50) default 'invoice' null comment 'invoice|subscription'
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_plantillasdecontrato
(
    contract_template_id            int auto_increment
        primary key,
    contract_template_created       datetime                      not null,
    contract_template_updated       datetime                      not null,
    contract_template_creatorid     int                           null,
    contract_template_title         varchar(250)                  null,
    contract_template_heading_color varchar(30) default '#7493a9' null,
    contract_template_title_color   varchar(30) default '#7493a9' null,
    contract_template_body          text                          null,
    contract_template_system        varchar(20) default 'no'      null comment 'yes|no'
);

create table if not exists crm_plantillasdecorreo
(
    emailtemplate_module_unique_id varchar(250)                  null,
    emailtemplate_module_name      varchar(250)                  null,
    emailtemplate_name             varchar(100)                  null,
    emailtemplate_lang             varchar(250)                  null comment 'to match to language',
    emailtemplate_type             varchar(30)                   null comment 'everyone|admin|client',
    emailtemplate_category         varchar(30)                   null comment 'modules|users|projects|tasks|leads|tickets|billing|estimates|other',
    emailtemplate_subject          varchar(250)                  null,
    emailtemplate_body             text                          null,
    emailtemplate_variables        text                          null,
    emailtemplate_created          datetime                      null,
    emailtemplate_updated          datetime                      null,
    emailtemplate_status           varchar(20) default 'enabled' null comment 'enabled|disabled',
    emailtemplate_language         varchar(50)                   null,
    emailtemplate_real_template    varchar(50) default 'yes'     null comment 'yes|no',
    emailtemplate_show_enabled     varchar(50) default 'yes'     null comment 'yes|no',
    emailtemplate_id               int auto_increment comment 'x'
        primary key
)
    comment '[do not truncate]' engine = MyISAM;

create table if not exists crm_plantillasdepropuesta
(
    proposal_template_id            int auto_increment
        primary key,
    proposal_template_created       datetime                      not null,
    proposal_template_updated       datetime                      not null,
    proposal_template_creatorid     int                           null,
    proposal_template_title         varchar(250)                  null,
    proposal_template_heading_color varchar(30) default '#FFFFFF' null,
    proposal_template_title_color   varchar(30) default '#FFFFFF' null,
    proposal_template_body          text                          null,
    proposal_template_estimate_id   int                           null,
    proposal_template_system        varchar(20) default 'no'      null comment 'yes|no'
);

create table if not exists crm_plantillasdewebmail
(
    webmail_template_id        int auto_increment
        primary key,
    webmail_template_created   datetime     not null,
    webmail_template_updated   datetime     not null,
    webmail_template_creatorid int          not null,
    webmail_template_name      varchar(150) null,
    webmail_template_body      text         null,
    webmail_template_type      text         null comment 'clients|leads'
);

create table if not exists crm_propuestas
(
    doc_id                         int auto_increment
        primary key,
    doc_unique_id                  varchar(150)                    null,
    doc_template                   varchar(150)                    null comment 'default',
    doc_created                    datetime                        not null,
    doc_updated                    datetime                        not null,
    doc_date_status_change         datetime                        null,
    doc_creatorid                  int                             not null comment 'use ( -1 ) for logged out user.',
    doc_categoryid                 int          default 11         null comment '11 is the default category',
    doc_heading                    varchar(250)                    null comment 'e.g. proposal',
    doc_heading_color              varchar(30)                     null,
    doc_title                      varchar(250)                    null,
    doc_title_color                varchar(30)                     null,
    doc_hero_direcory              varchar(250)                    null,
    doc_hero_filename              varchar(250)                    null,
    doc_hero_updated               varchar(250) default 'no'       null comment 'ys|no (when no, we use default image path)',
    doc_body                       text                            null,
    doc_date_start                 date                            null comment 'Proposal Issue Date | Contract Start Date',
    doc_date_end                   date                            null comment 'Proposal Expiry Date | Contract End Date',
    doc_date_published             date                            null,
    doc_date_last_emailed          datetime                        null,
    doc_client_id                  int                             null,
    doc_project_id                 int                             null,
    doc_lead_id                    int                             null,
    doc_notes                      text                            null,
    doc_viewed                     varchar(20)  default 'no'       null comment 'yes|no',
    doc_type                       varchar(150)                    null comment 'proposal|contract',
    doc_system_type                varchar(150) default 'document' null comment 'document|template',
    doc_signed_date                datetime                        null,
    doc_signed_first_name          varchar(150) default ''         null,
    doc_signed_last_name           varchar(150) default ''         null,
    doc_signed_signature_directory varchar(150) default ''         null,
    doc_signed_signature_filename  varchar(150) default ''         null,
    doc_signed_ip_address          varchar(150)                    null,
    doc_fallback_client_first_name varchar(150) default ''         null comment 'used for creating events when users are not logged in',
    doc_fallback_client_last_name  varchar(150) default ''         null comment 'used for creating events when users are not logged in',
    doc_fallback_client_email      varchar(150) default ''         null comment 'used for creating events when users are not logged in',
    doc_status                     varchar(100) default 'draft'    null comment 'draft|new|accepted|declined|revised|expired',
    docresource_type               varchar(100)                    null comment 'client|lead',
    docresource_id                 int                             null
);

create table if not exists crm_proyectos
(
    project_id                                       int auto_increment
        primary key,
    project_uniqueid                                 varchar(100)                         null comment 'optional',
    project_type                                     varchar(30)    default 'project'     not null comment 'project|template|space',
    project_reference                                varchar(250)                         null comment '[optiona] additional data for identifying a project',
    project_importid                                 varchar(100)                         null,
    project_created                                  datetime                             null,
    project_updated                                  datetime                             null,
    project_timestamp_created                        int                                  null,
    project_timestamp_updated                        int                                  null,
    project_clientid                                 int                                  null,
    project_creatorid                                int                                  not null comment 'creator of the project',
    project_categoryid                               int            default 1             null comment 'default category',
    project_cover_directory                          varchar(100)                         null,
    project_cover_filename                           varchar(100)                         null,
    project_cover_file_id                            int                                  null comment 'if this cover was made from an existing file',
    project_title                                    varchar(250)                         not null,
    project_date_start                               date                                 null,
    project_date_due                                 date                                 null,
    project_description                              text                                 null,
    project_status                                   varchar(50)    default 'not_started' null comment 'not_started | in_progress | on_hold | cancelled | completed',
    project_active_state                             varchar(10)    default 'active'      null comment 'active|archive',
    project_progress                                 tinyint(3)     default 0             null,
    project_billing_rate                             decimal(10, 2) default 0.00          null,
    project_billing_type                             varchar(40)    default 'hourly'      null comment 'hourly | fixed',
    project_billing_estimated_hours                  int            default 0             null comment 'estimated hours',
    project_billing_costs_estimate                   decimal(10, 2) default 0.00          null,
    project_progress_manually                        varchar(10)    default 'no'          null comment 'yes | no',
    clientperm_tasks_view                            varchar(10)    default 'yes'         null comment 'yes | no',
    clientperm_tasks_collaborate                     varchar(40)    default 'yes'         null comment 'yes | no',
    clientperm_tasks_create                          varchar(40)    default 'yes'         null comment 'yes | no',
    clientperm_timesheets_view                       varchar(40)    default 'yes'         null comment 'yes | no',
    clientperm_expenses_view                         varchar(40)    default 'no'          null comment 'yes | no',
    assignedperm_milestone_manage                    varchar(40)    default 'yes'         null comment 'yes | no',
    assignedperm_tasks_collaborate                   varchar(40)                          null comment 'yes | no',
    project_visibility                               varchar(40)    default 'visible'     null comment 'visible|hidden (used to prevent projects that are still being cloned from showing in projects list)',
    project_custom_field_1                           tinytext                             null,
    project_custom_field_2                           tinytext                             null,
    project_custom_field_3                           tinytext                             null,
    project_custom_field_4                           tinytext                             null,
    project_custom_field_5                           tinytext                             null,
    project_custom_field_6                           tinytext                             null,
    project_custom_field_7                           tinytext                             null,
    project_custom_field_8                           tinytext                             null,
    project_custom_field_9                           tinytext                             null,
    project_custom_field_10                          tinytext                             null,
    project_custom_field_11                          datetime                             null,
    project_custom_field_12                          datetime                             null,
    project_custom_field_13                          datetime                             null,
    project_custom_field_14                          datetime                             null,
    project_custom_field_15                          datetime                             null,
    project_custom_field_16                          datetime                             null,
    project_custom_field_17                          datetime                             null,
    project_custom_field_18                          datetime                             null,
    project_custom_field_19                          datetime                             null,
    project_custom_field_20                          datetime                             null,
    project_custom_field_21                          text                                 null,
    project_custom_field_22                          text                                 null,
    project_custom_field_23                          text                                 null,
    project_custom_field_24                          text                                 null,
    project_custom_field_25                          text                                 null,
    project_custom_field_26                          text                                 null,
    project_custom_field_27                          text                                 null,
    project_custom_field_28                          text                                 null,
    project_custom_field_29                          text                                 null,
    project_custom_field_30                          text                                 null,
    project_custom_field_31                          varchar(20)                          null,
    project_custom_field_32                          varchar(20)                          null,
    project_custom_field_33                          varchar(20)                          null,
    project_custom_field_34                          varchar(20)                          null,
    project_custom_field_35                          varchar(20)                          null,
    project_custom_field_36                          varchar(20)                          null,
    project_custom_field_37                          varchar(20)                          null,
    project_custom_field_38                          varchar(20)                          null,
    project_custom_field_39                          varchar(20)                          null,
    project_custom_field_40                          varchar(20)                          null,
    project_custom_field_41                          varchar(150)                         null,
    project_custom_field_42                          varchar(150)                         null,
    project_custom_field_43                          varchar(150)                         null,
    project_custom_field_44                          varchar(150)                         null,
    project_custom_field_45                          varchar(150)                         null,
    project_custom_field_46                          varchar(150)                         null,
    project_custom_field_47                          varchar(150)                         null,
    project_custom_field_48                          varchar(150)                         null,
    project_custom_field_49                          varchar(150)                         null,
    project_custom_field_50                          varchar(150)                         null,
    project_custom_field_51                          int                                  null,
    project_custom_field_52                          int                                  null,
    project_custom_field_53                          int                                  null,
    project_custom_field_54                          int                                  null,
    project_custom_field_55                          int                                  null,
    project_custom_field_56                          int                                  null,
    project_custom_field_57                          int                                  null,
    project_custom_field_58                          int                                  null,
    project_custom_field_59                          int                                  null,
    project_custom_field_60                          int                                  null,
    project_custom_field_61                          decimal(10, 2)                       null,
    project_custom_field_62                          decimal(10, 2)                       null,
    project_custom_field_63                          decimal(10, 2)                       null,
    project_custom_field_64                          decimal(10, 2)                       null,
    project_custom_field_65                          decimal(10, 2)                       null,
    project_custom_field_66                          decimal(10, 2)                       null,
    project_custom_field_67                          decimal(10, 2)                       null,
    project_custom_field_68                          decimal(10, 2)                       null,
    project_custom_field_69                          decimal(10, 2)                       null,
    project_custom_field_70                          decimal(10, 2)                       null,
    project_automation_status                        varchar(30)    default 'disabled'    null comment 'disabled|enabled',
    project_automation_create_invoices               varchar(30)    default 'no'          null comment 'yes|no',
    project_automation_convert_estimates_to_invoices varchar(30)    default 'no'          null comment 'yes|no',
    project_automation_invoice_unbilled_hours        varchar(30)    default 'no'          null comment 'yes|no',
    project_automation_invoice_hourly_rate           decimal(10, 2)                       null,
    project_automation_invoice_hourly_tax_1          int                                  null,
    project_automation_invoice_email_client          varchar(30)    default 'no'          null comment 'yes|no',
    project_automation_invoice_due_date              int            default 0             null
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_proyectosasignados
(
    projectsassigned_id        int auto_increment comment '[truncate]'
        primary key,
    projectsassigned_projectid int      null,
    projectsassigned_userid    int      null,
    projectsassigned_created   datetime null,
    projectsassigned_updated   datetime null
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_recordatorios
(
    reminder_id           int auto_increment
        primary key,
    reminder_created      datetime                  not null,
    reminder_updated      datetime                  not null,
    reminder_userid       int                       null,
    reminder_datetime     datetime                  null,
    reminder_timestamp    timestamp                 null,
    reminder_title        varchar(250)              null,
    reminder_meta         varchar(250)              null,
    reminder_notes        text                      null,
    reminder_status       varchar(10) default 'new' null comment 'active|due',
    reminder_sent         varchar(10) default 'no'  null comment 'yes|no',
    reminderresource_type varchar(50)               null comment 'project|client|estimate|lead|task|invoice|ticket',
    reminderresource_id   int                       null comment 'linked resoucre id'
)
    engine = MyISAM;

create table if not exists crm_registros
(
    log_id           int auto_increment
        primary key,
    log_uniqueid     varchar(100)               null comment 'optional',
    log_created      datetime                   not null,
    log_updated      datetime                   not null,
    log_creatorid    int                        null,
    log_text         text                       null comment 'either free text or a (lang) string',
    log_text_type    varchar(20) default 'text' null comment 'text|lang',
    log_data_1       varchar(250)               null comment 'optional data',
    log_data_2       varchar(250)               null comment 'optional data',
    log_data_3       varchar(250)               null comment 'optional data',
    log_payload      text                       null comment 'optional',
    logresource_type varchar(60)                null comment 'debug|subscription|invoice|etc',
    logresource_id   int                        null
)
    engine = MyISAM;

create table if not exists crm_respuestasdeticket
(
    ticketreply_id        int auto_increment
        primary key,
    ticketreply_created   datetime not null,
    ticketreply_updated   datetime not null,
    ticketreply_creatorid int      not null,
    ticketreply_clientid  int      null,
    ticketreply_ticketid  int      not null,
    ticketreply_text      text     not null
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_roles
(
    role_id                              int auto_increment
        primary key,
    role_created                         datetime                         null,
    role_updated                         datetime                         null,
    role_system                          varchar(10)  default 'no'        not null comment 'yes | no (system roles cannot be deleted)',
    role_type                            varchar(10)                      not null comment 'client|team',
    role_name                            varchar(100)                     not null,
    role_clients                         tinyint      default 0           not null comment 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
    role_contacts                        tinyint                          not null comment 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
    role_contracts                       tinyint      default 0           not null comment 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
    role_invoices                        tinyint      default 0           not null comment 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
    role_estimates                       tinyint      default 0           not null comment 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
    role_proposals                       tinyint      default 0           not null comment 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
    role_payments                        tinyint      default 0           not null comment 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
    role_items                           tinyint      default 0           not null comment 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
    role_tasks                           tinyint      default 0           not null comment 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
    role_tasks_scope                     varchar(20)  default 'own'       not null comment 'own | global',
    role_projects                        tinyint      default 0           not null comment 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
    role_projects_scope                  varchar(20)  default 'own'       not null comment 'own | global',
    role_projects_billing                varchar(20)  default '0'         not null comment 'none (0) | view (1) | view-add-edit (2)',
    role_leads                           tinyint      default 0           not null comment 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
    role_leads_scope                     varchar(20)  default 'own'       not null comment 'own | global',
    role_expenses                        tinyint      default 0           not null comment 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
    role_expenses_scope                  varchar(20)  default 'own'       not null comment 'own | global',
    role_timesheets                      int(4)       default 0           not null comment 'none (0) | view (1) | view-delete (2)',
    role_timesheets_scope                varchar(20)  default 'own'       not null comment 'own | global',
    role_team                            tinyint      default 0           not null comment 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
    role_team_scope                      varchar(20)  default 'global'    not null comment 'own | global',
    role_tickets                         tinyint      default 0           not null comment 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
    role_knowledgebase                   tinyint      default 0           not null comment 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
    role_manage_knowledgebase_categories varchar(20)  default 'no'        not null comment 'yes|no',
    role_assign_projects                 varchar(20)  default 'no'        not null comment 'yes|no',
    role_assign_leads                    varchar(20)  default 'no'        not null comment 'yes|no',
    role_assign_tasks                    varchar(20)  default 'no'        not null comment 'yes|no',
    role_set_project_permissions         varchar(20)  default 'no'        not null comment 'yes|no',
    role_subscriptions                   varchar(20)  default '0'         not null comment 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
    role_templates_projects              varchar(20)  default '1'         not null comment 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
    role_templates_contracts             varchar(20)  default '1'         not null comment 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
    role_templates_proposals             varchar(20)  default '1'         not null comment 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
    role_content_import                  varchar(20)  default 'yes'       not null comment 'yes|no',
    role_content_export                  varchar(20)  default 'yes'       not null comment 'yes|no',
    role_module_cs_affiliate             varchar(20)  default '3'         not null comment 'global',
    role_homepage                        varchar(100) default 'dashboard' not null,
    role_messages                        varchar(20)  default 'yes'       not null comment 'yes|no',
    role_reports                         varchar(20)  default 'no'        not null comment 'yes|no'
)
    comment '[do not truncate] [roles 1,2,3 required] [role 1 = admin] [role 2 = client] [role 3 = staff]'
    engine = MyISAM;

create table if not exists crm_seguimientodeeventos
(
    eventtracking_id        int auto_increment
        primary key,
    eventtracking_created   datetime                     not null,
    eventtracking_updated   datetime                     not null,
    eventtracking_eventid   int                          not null,
    eventtracking_userid    int                          not null,
    eventtracking_status    varchar(30) default 'unread' null comment 'read|unread',
    eventtracking_email     varchar(50) default 'no'     null comment 'yes|no',
    eventtracking_source    varchar(50)                  null comment 'the actual item (e.g. file | comment | invoice)',
    eventtracking_source_id varchar(50)                  null comment 'the id of the actual item',
    parent_type             varchar(50)                  null comment 'used to locate the main event in the events table. Also used for marking the event as read, once the parent has been viewed. (e.g. for invoice, parent is invoice. For comment task, parent is task)',
    parent_id               int                          null,
    resource_type           varchar(50)                  null comment 'Also used for marking events as read, for ancillary items like (project comments, project file) where just viewing a project is enough',
    resource_id             int                          null
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_seguimientodemensajes
(
    messagestracking_id                int auto_increment
        primary key,
    messagestracking_created           datetime     not null,
    messagestracking_update            datetime     not null,
    messagestracking_massage_unique_id varchar(120) not null,
    messagestracking_target            varchar(120) null,
    messagestracking_user_unique_id    varchar(120) null,
    messagestracking_type              varchar(50)  null comment 'read|delete'
);

create table if not exists crm_sesiones
(
    id            varchar(250) not null,
    user_id       int          null,
    ip_address    varchar(45)  null,
    user_agent    text         null,
    payload       text         not null,
    created_at    datetime     null,
    updated_at    datetime     null,
    last_activity int          not null
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_sesionesdepago
(
    session_id               int auto_increment
        primary key,
    session_created          datetime       null,
    session_updated          datetime       null,
    session_creatorid        int            null comment 'user making the payment',
    session_creator_fullname varchar(150)   null,
    session_creator_email    varchar(150)   null,
    session_gateway_name     varchar(150)   null comment 'stripe | paypal | etc',
    session_gateway_ref      varchar(150)   null comment 'Stripe - The checkout_session_id | Paypal -',
    session_amount           decimal(10, 2) null comment 'amount of the payment',
    session_invoices         varchar(250)   null comment '[currently] - single invoice id | [future] - comma seperated list of invoice id''s that are for this payment',
    session_subscription     int            null comment 'subscription id',
    session_payload          text           null
)
    comment 'Track payment sessions so that IPN/Webhook calls can be linked to the correct invoice. Cronjob can be used to cleanup this table for any records older than 72hrs'
    engine = MyISAM;

create table if not exists crm_suscripciones
(
    subscription_id                        int auto_increment
        primary key,
    subscription_gateway_id                varchar(250)                     null,
    subscription_created                   datetime                         null,
    subscription_updated                   datetime                         null,
    subscription_creatorid                 int                              not null,
    subscription_clientid                  int                              not null,
    subscription_categoryid                int            default 4         not null,
    subscription_projectid                 int                              null comment 'optional',
    subscription_gateway_product           varchar(250)                     null comment 'stripe product id',
    subscription_gateway_price             varchar(250)                     null comment 'stripe price id',
    subscription_gateway_product_name      varchar(250)                     null comment 'e.g. Glod Plan',
    subscription_gateway_interval          int                              null comment 'e.g. 2',
    subscription_gateway_period            varchar(50)                      null comment 'e.g. months',
    subscription_date_started              datetime                         null,
    subscription_date_ended                datetime                         null,
    subscription_date_renewed              date                             null comment 'from stripe',
    subscription_date_next_renewal         date                             null comment 'from stripe',
    subscription_gateway_last_message      text                             null comment 'from stripe',
    subscription_gateway_last_message_date datetime                         null,
    subscription_subtotal                  decimal(10, 2) default 0.00      not null,
    subscription_amount_before_tax         decimal(10, 2) default 0.00      null,
    subscription_tax_percentage            decimal(10, 2) default 0.00      null comment 'percentage',
    subscription_tax_amount                decimal(10, 2) default 0.00      null comment 'amount',
    subscription_final_amount              decimal(10, 2) default 0.00      null,
    subscription_notes                     text                             null,
    subscription_status                    varchar(50)    default 'pending' null comment 'pending | active | failed | paused | cancelled',
    subscription_visibility                varchar(50)    default 'visible' null comment 'visible | invisible',
    subscription_cron_status               varchar(20)    default 'none'    null comment 'none|processing|completed|error  (used to prevent collisions when recurring invoiced)',
    subscription_cron_date                 datetime                         null comment 'date when cron was run'
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_tabladeconfig
(
    tableconfig_id         int auto_increment
        primary key,
    tableconfig_created    datetime                     not null,
    tableconfig_updated    datetime                     not null,
    tableconfig_userid     int                          not null,
    tableconfig_table_name varchar(150)                 not null,
    tableconfig_column_1   varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_2   varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_3   varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_4   varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_5   varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_6   varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_7   varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_8   varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_9   varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_10  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_11  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_12  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_13  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_14  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_15  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_16  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_17  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_18  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_19  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_20  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_21  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_22  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_23  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_24  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_25  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_26  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_27  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_28  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_29  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_30  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_31  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_32  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_33  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_34  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_35  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_36  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_37  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_38  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_39  varchar(20) default 'hidden' null comment 'hidden|displayed',
    tableconfig_column_40  varchar(20) default 'hidden' null comment 'hidden|displayed'
);

create table if not exists crm_tareas
(
    task_id                             int auto_increment
        primary key,
    task_importid                       varchar(100)                        null,
    task_position                       double                              not null comment 'increment by 16384',
    task_created                        datetime                            null comment 'always now()',
    task_updated                        datetime                            null,
    task_creatorid                      int                                 null,
    task_clientid                       int                                 null comment 'optional',
    task_projectid                      int                                 null comment 'project_id',
    task_date_start                     date                                null,
    task_date_due                       date                                null,
    task_title                          varchar(250)                        null,
    task_description                    text                                null,
    task_client_visibility              varchar(100) default 'yes'          null,
    task_milestoneid                    int                                 null comment 'new tasks must be set to the [uncategorised] milestone',
    task_previous_status                varchar(100) default 'new'          null,
    task_priority                       varchar(100) default 'normal'       not null comment 'normal | high | urgent',
    task_status                         int          default 1              null,
    task_active_state                   varchar(100) default 'active'       null comment 'active|archived',
    task_billable                       varchar(5)   default 'yes'          null comment 'yes | no',
    task_billable_status                varchar(20)  default 'not_invoiced' null comment 'invoiced | not_invoiced',
    task_billable_invoiceid             int                                 null comment 'id of the invoice that it has been billed to',
    task_billable_lineitemid            int                                 null comment 'id of line item that was billed',
    task_visibility                     varchar(40)  default 'visible'      null comment 'visible|hidden (used to prevent tasks that are still being cloned from showing in tasks list)',
    task_overdue_notification_sent      varchar(40)  default 'no'           null comment 'yes|no',
    task_recurring                      varchar(40)  default 'no'           null comment 'yes|no',
    task_recurring_duration             int                                 null comment 'e.g. 20 (for 20 days)',
    task_recurring_period               varchar(30)                         null comment 'day | week | month | year',
    task_recurring_cycles               int                                 null comment '0 for infinity',
    task_recurring_cycles_counter       int          default 0              null comment 'number of times it has been renewed',
    task_recurring_last                 date                                null comment 'date when it was last renewed',
    task_recurring_next                 date                                null comment 'date when it will next be renewed',
    task_recurring_child                varchar(10)  default 'no'           null comment 'yes|no',
    task_recurring_parent_id            datetime                            null comment 'if it was generated from a recurring invoice, the id of parent invoice',
    task_recurring_copy_checklists      varchar(10)  default 'yes'          null comment 'yes|no',
    task_recurring_copy_files           varchar(10)  default 'yes'          null comment 'yes|no',
    task_recurring_automatically_assign varchar(10)  default 'yes'          null comment 'yes|no',
    task_recurring_finished             varchar(10)  default 'no'           null comment 'yes|no',
    task_cloning_original_task_id       varchar(10)                         null,
    task_custom_field_1                 tinytext                            null,
    task_custom_field_2                 tinytext                            null,
    task_custom_field_3                 tinytext                            null,
    task_custom_field_4                 tinytext                            null,
    task_custom_field_5                 tinytext                            null,
    task_custom_field_6                 tinytext                            null,
    task_custom_field_7                 tinytext                            null,
    task_custom_field_8                 tinytext                            null,
    task_custom_field_9                 tinytext                            null,
    task_custom_field_10                tinytext                            null,
    task_custom_field_11                datetime                            null,
    task_custom_field_12                datetime                            null,
    task_custom_field_13                datetime                            null,
    task_custom_field_14                datetime                            null,
    task_custom_field_15                datetime                            null,
    task_custom_field_16                datetime                            null,
    task_custom_field_17                datetime                            null,
    task_custom_field_18                datetime                            null,
    task_custom_field_19                datetime                            null,
    task_custom_field_20                datetime                            null,
    task_custom_field_21                text                                null,
    task_custom_field_22                text                                null,
    task_custom_field_23                text                                null,
    task_custom_field_24                text                                null,
    task_custom_field_25                text                                null,
    task_custom_field_26                text                                null,
    task_custom_field_27                text                                null,
    task_custom_field_28                text                                null,
    task_custom_field_29                text                                null,
    task_custom_field_30                text                                null,
    task_custom_field_31                varchar(20)                         null,
    task_custom_field_32                varchar(20)                         null,
    task_custom_field_33                varchar(20)                         null,
    task_custom_field_34                varchar(20)                         null,
    task_custom_field_35                varchar(20)                         null,
    task_custom_field_36                varchar(20)                         null,
    task_custom_field_37                varchar(20)                         null,
    task_custom_field_38                varchar(20)                         null,
    task_custom_field_39                varchar(20)                         null,
    task_custom_field_40                varchar(20)                         null,
    task_custom_field_41                varchar(150)                        null,
    task_custom_field_42                varchar(150)                        null,
    task_custom_field_43                varchar(150)                        null,
    task_custom_field_44                varchar(150)                        null,
    task_custom_field_45                varchar(150)                        null,
    task_custom_field_46                varchar(150)                        null,
    task_custom_field_47                varchar(150)                        null,
    task_custom_field_48                varchar(150)                        null,
    task_custom_field_49                varchar(150)                        null,
    task_custom_field_50                varchar(150)                        null,
    task_custom_field_51                int                                 null,
    task_custom_field_52                int                                 null,
    task_custom_field_53                int                                 null,
    task_custom_field_54                int                                 null,
    task_custom_field_55                int                                 null,
    task_custom_field_56                int                                 null,
    task_custom_field_57                int                                 null,
    task_custom_field_58                int                                 null,
    task_custom_field_59                int                                 null,
    task_custom_field_60                int                                 null,
    task_custom_field_61                decimal(10, 2)                      null,
    task_custom_field_62                decimal(10, 2)                      null,
    task_custom_field_63                decimal(10, 2)                      null,
    task_custom_field_64                decimal(10, 2)                      null,
    task_custom_field_65                decimal(10, 2)                      null,
    task_custom_field_66                decimal(10, 2)                      null,
    task_custom_field_67                decimal(10, 2)                      null,
    task_custom_field_68                decimal(10, 2)                      null,
    task_custom_field_69                decimal(10, 2)                      null,
    task_custom_field_70                decimal(10, 2)                      null
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_tareasasignadas
(
    tasksassigned_id      int auto_increment comment '[truncate]'
        primary key,
    tasksassigned_taskid  int      not null,
    tasksassigned_userid  int      null,
    tasksassigned_created datetime null,
    tasksassigned_updated datetime null
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_tareasdependientes
(
    tasksdependency_id        int auto_increment
        primary key,
    tasksdependency_created   int                           not null,
    tasksdependency_updated   int                           not null,
    tasksdependency_creatorid int                           null,
    tasksdependency_projectid int                           null,
    tasksdependency_clientid  int                           null,
    tasksdependency_taskid    int                           null,
    tasksdependency_blockerid int                           null,
    tasksdependency_type      varchar(100)                  null comment 'cannot_complete|cannot_start',
    tasksdependency_status    varchar(100) default 'active' null comment 'active|fulfilled'
);

create table if not exists crm_tareasdeproducto
(
    product_task_id          int auto_increment
        primary key,
    product_task_created     date         not null,
    product_task_updated     date         not null,
    product_task_creatorid   int          null,
    product_task_itemid      int          null,
    product_task_title       varchar(250) null,
    product_task_description text         null
)
    engine = MyISAM;

create table if not exists crm_temporizadores
(
    timer_id                int auto_increment
        primary key,
    timer_created           datetime                           null,
    timer_updated           datetime                           null,
    timer_creatorid         int                                null,
    timer_started           int                                null comment 'unix time stam for when the timer was started',
    timer_stopped           int         default 0              null comment 'unix timestamp for when the timer was stopped',
    timer_time              int         default 0              null comment 'seconds',
    timer_taskid            int                                null,
    timer_projectid         int         default 0              null comment 'needed for repository filtering',
    timer_clientid          int         default 0              null comment 'needed for repository filtering',
    timer_status            varchar(20) default 'running'      null comment 'running | stopped',
    timer_billing_status    varchar(50) default 'not_invoiced' null comment 'invoiced | not_invoiced',
    timer_billing_invoiceid int                                null comment 'invoice id, if billed'
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_tickets
(
    ticket_id              int auto_increment
        primary key,
    ticket_created         datetime                     null,
    ticket_updated         datetime                     null,
    ticket_creatorid       int                          not null,
    ticket_categoryid      int         default 9        not null,
    ticket_clientid        int                          null,
    ticket_projectid       int                          null,
    ticket_subject         varchar(250)                 null,
    ticket_message         text                         null,
    ticket_priority        varchar(50) default 'normal' not null comment 'normal | high | urgent',
    ticket_last_updated    datetime                     null,
    ticket_status          tinyint     default 1        not null comment 'numeric status id',
    ticket_active_state    varchar(20) default 'active' null comment 'active|archived',
    ticket_custom_field_1  tinytext                     null,
    ticket_custom_field_2  tinytext                     null,
    ticket_custom_field_3  tinytext                     null,
    ticket_custom_field_4  tinytext                     null,
    ticket_custom_field_5  tinytext                     null,
    ticket_custom_field_6  tinytext                     null,
    ticket_custom_field_7  tinytext                     null,
    ticket_custom_field_8  tinytext                     null,
    ticket_custom_field_9  tinytext                     null,
    ticket_custom_field_10 tinytext                     null,
    ticket_custom_field_11 tinytext                     null,
    ticket_custom_field_12 tinytext                     null,
    ticket_custom_field_13 tinytext                     null,
    ticket_custom_field_14 tinytext                     null,
    ticket_custom_field_15 tinytext                     null,
    ticket_custom_field_16 tinytext                     null,
    ticket_custom_field_17 tinytext                     null,
    ticket_custom_field_18 tinytext                     null,
    ticket_custom_field_19 tinytext                     null,
    ticket_custom_field_20 tinytext                     null,
    ticket_custom_field_21 tinytext                     null,
    ticket_custom_field_22 tinytext                     null,
    ticket_custom_field_23 tinytext                     null,
    ticket_custom_field_24 tinytext                     null,
    ticket_custom_field_25 tinytext                     null,
    ticket_custom_field_26 tinytext                     null,
    ticket_custom_field_27 tinytext                     null,
    ticket_custom_field_28 tinytext                     null,
    ticket_custom_field_29 tinytext                     null,
    ticket_custom_field_30 tinytext                     null,
    ticket_custom_field_31 tinytext                     null,
    ticket_custom_field_32 tinytext                     null,
    ticket_custom_field_33 tinytext                     null,
    ticket_custom_field_34 tinytext                     null,
    ticket_custom_field_35 tinytext                     null,
    ticket_custom_field_36 tinytext                     null,
    ticket_custom_field_37 tinytext                     null,
    ticket_custom_field_38 tinytext                     null,
    ticket_custom_field_39 tinytext                     null,
    ticket_custom_field_40 tinytext                     null,
    ticket_custom_field_41 tinytext                     null,
    ticket_custom_field_42 tinytext                     null,
    ticket_custom_field_43 tinytext                     null,
    ticket_custom_field_44 tinytext                     null,
    ticket_custom_field_45 tinytext                     null,
    ticket_custom_field_46 tinytext                     null,
    ticket_custom_field_47 tinytext                     null,
    ticket_custom_field_48 tinytext                     null,
    ticket_custom_field_49 tinytext                     null,
    ticket_custom_field_50 tinytext                     null,
    ticket_custom_field_51 tinytext                     null,
    ticket_custom_field_52 tinytext                     null,
    ticket_custom_field_53 tinytext                     null,
    ticket_custom_field_54 tinytext                     null,
    ticket_custom_field_55 tinytext                     null,
    ticket_custom_field_56 tinytext                     null,
    ticket_custom_field_57 tinytext                     null,
    ticket_custom_field_58 tinytext                     null,
    ticket_custom_field_59 tinytext                     null,
    ticket_custom_field_60 tinytext                     null,
    ticket_custom_field_61 tinytext                     null,
    ticket_custom_field_62 tinytext                     null,
    ticket_custom_field_63 tinytext                     null,
    ticket_custom_field_64 tinytext                     null,
    ticket_custom_field_65 tinytext                     null,
    ticket_custom_field_66 tinytext                     null,
    ticket_custom_field_67 tinytext                     null,
    ticket_custom_field_68 tinytext                     null,
    ticket_custom_field_69 tinytext                     null,
    ticket_custom_field_70 tinytext                     null
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_tiposdeimpuesto
(
    taxrate_id         int auto_increment
        primary key,
    taxrate_uniqueid   varchar(200)                   not null comment 'Used in <js> for identification',
    taxrate_created    datetime                       not null,
    taxrate_updated    datetime                       not null,
    taxrate_creatorid  int                            not null,
    taxrate_name       varchar(100)                   not null,
    taxrate_value      decimal(10, 2)                 not null,
    taxrate_type       varchar(100) default 'user'    not null comment 'system|user|temp|client',
    taxrate_clientid   int                            null,
    taxrate_estimateid int                            null,
    taxrate_invoiceid  int                            null,
    taxrate_status     varchar(20)  default 'enabled' not null comment 'enabled|disabled'
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_trabajos
(
    id           bigint unsigned auto_increment
        primary key,
    queue        varchar(255)     not null,
    payload      longtext         not null,
    attempts     tinyint unsigned not null,
    reserved_at  int unsigned     null,
    available_at int unsigned     not null,
    created_at   int unsigned     not null
)
    comment '[truncate]' engine = MyISAM
                         collate = utf8mb4_unicode_ci;

create table if not exists crm_trabajosfallidos
(
    id         bigint unsigned auto_increment
        primary key,
    connection text                                not null,
    queue      text                                not null,
    payload    longtext                            not null,
    exception  longtext                            not null,
    failed_at  timestamp default CURRENT_TIMESTAMP not null
)
    comment '[truncate]' engine = MyISAM
                         collate = utf8mb4_unicode_ci;

create table if not exists crm_unidades
(
    unit_id             int auto_increment
        primary key,
    unit_created        datetime                 null,
    unit_update         datetime                 null,
    unit_creatorid      int         default 1    null,
    unit_name           varchar(50)              not null,
    unit_system_default varchar(50) default 'no' not null comment 'yes|no',
    unit_time_default   varchar(50) default 'no' null comment 'yes|no (used to identify time unit)'
)
    comment '[truncate]' engine = MyISAM;

create table if not exists crm_usuarios
(
    id                                     int auto_increment
        primary key,
    unique_id                              varchar(150)                     null,
    created                                datetime                         null,
    updated                                datetime                         null,
    deleted                                datetime                         null comment 'date when acccount was deleted',
    creatorid                              int                              null,
    email                                  varchar(255)                     null,
    password                               varchar(255)                     not null,
    first_name                             varchar(100)                     not null,
    last_name                              varchar(100)                     not null,
    phone                                  varchar(100)                     null,
    position                               varchar(255)                     null,
    clientid                               int                              null comment 'for client users',
    account_owner                          varchar(10)  default 'no'        null comment 'yes | no',
    primary_admin                          varchar(10)  default 'no'        null comment 'yes | no (only 1 primary admin - created during setup)',
    avatar_directory                       varchar(100)                     null,
    avatar_filename                        varchar(100)                     null,
    type                                   varchar(150)                     not null comment 'client | team |contact',
    status                                 varchar(20)  default 'active'    null comment 'active|suspended|deleted',
    role_id                                int          default 2           not null comment 'for team users',
    last_seen                              datetime                         null,
    theme                                  varchar(100) default 'default'   null,
    last_ip_address                        varchar(100)                     null,
    social_facebook                        varchar(200)                     null,
    social_twitter                         varchar(200)                     null,
    social_linkedin                        varchar(200)                     null,
    social_github                          varchar(200)                     null,
    social_dribble                         varchar(200)                     null,
    pref_language                          varchar(200) default 'english'   null comment 'english|french|etc',
    pref_email_notifications               varchar(10)  default 'yes'       null comment 'yes | no',
    pref_leftmenu_position                 varchar(50)  default 'collapsed' null comment 'collapsed | open',
    pref_statspanel_position               varchar(50)  default 'collapsed' null comment 'collapsed | open',
    pref_filter_own_tasks                  varchar(50)  default 'no'        null comment 'Show only a users tasks in the tasks list',
    pref_filter_own_projects               varchar(50)  default 'no'        null comment 'Show only a users projects in the projects list',
    pref_filter_show_archived_projects     varchar(50)  default 'no'        null comment 'Show archived projects',
    pref_filter_show_archived_tasks        varchar(50)  default 'no'        null comment 'Show archived projects',
    pref_filter_show_archived_leads        varchar(50)  default 'no'        null comment 'Show archived projects',
    pref_filter_show_archived_tickets      varchar(50)  default 'no'        null comment 'Show archived tickets',
    pref_filter_own_leads                  varchar(50)  default 'no'        null comment 'Show only a users projects in the leads list',
    pref_view_tasks_layout                 varchar(50)  default 'kanban'    null comment 'list|kanban',
    pref_view_leads_layout                 varchar(50)  default 'kanban'    null comment 'list|kanban',
    pref_view_projects_layout              varchar(50)  default 'list'      null comment 'list|card|milestone|pipeline|category|gnatt',
    pref_theme                             varchar(100) default 'default'   null,
    remember_token                         varchar(150)                     null,
    remember_filters_tickets_status        varchar(20)  default 'disabled'  null comment 'enabled|disabled',
    remember_filters_tickets_payload       text                             null,
    remember_filters_projects_status       varchar(20)  default 'disabled'  null comment 'enabled|disabled',
    remember_filters_projects_payload      text                             null,
    remember_filters_invoices_status       varchar(20)  default 'disabled'  null comment 'enabled|disabled',
    remember_filters_invoices_payload      text                             null,
    remember_filters_estimates_status      varchar(20)  default 'disabled'  null comment 'enabled|disabled',
    remember_filters_estimates_payload     text                             null,
    remember_filters_contracts_status      varchar(20)  default 'disabled'  null comment 'enabled|disabled',
    remember_filters_contracts_payload     text                             null,
    remember_filters_payments_status       varchar(20)  default 'disabled'  null comment 'enabled|disabled',
    remember_filters_payments_payload      text                             null,
    remember_filters_proposals_status      varchar(20)  default 'disabled'  null comment 'enabled|disabled',
    remember_filters_proposals_payload     text                             null,
    remember_filters_clients_status        varchar(20)  default 'disabled'  null comment 'enabled|disabled',
    remember_filters_clients_payload       text                             null,
    remember_filters_leads_status          varchar(20)  default 'disabled'  null comment 'enabled|disabled',
    remember_filters_leads_payload         text                             null,
    remember_filters_tasks_status          varchar(20)  default 'disabled'  null comment 'enabled|disabled',
    remember_filters_tasks_payload         text                             null,
    remember_filters_subscriptions_status  varchar(20)  default 'disabled'  null comment 'enabled|disabled',
    remember_filters_subscriptions_payload text                             null,
    remember_filters_products_status       varchar(20)  default 'disabled'  null comment 'enabled|disabled',
    remember_filters_products_payload      text                             null,
    remember_filters_expenses_status       varchar(20)  default 'disabled'  null comment 'enabled|disabled',
    remember_filters_expenses_payload      text                             null,
    remember_filters_timesheets_status     varchar(20)  default 'disabled'  null comment 'enabled|disabled',
    remember_filters_timesheets_payload    text                             null,
    forgot_password_token                  varchar(150)                     null comment 'random token',
    forgot_password_token_expiry           datetime                         null,
    force_password_change                  varchar(10)  default 'no'        null comment 'yes|no',
    notifications_system                   varchar(10)  default 'no'        null comment 'no| yes | yes_email [everyone] NB: database defaults for all notifications are ''no'' actual values must be set in the settings config file',
    notifications_new_project              varchar(10)  default 'no'        null comment 'no| yes_email [client]',
    notifications_projects_activity        varchar(10)  default 'no'        null comment 'no | yes | yes_email [everyone]',
    notifications_billing_activity         varchar(10)  default 'no'        null comment 'no | yes | yes_email |[team]',
    notifications_new_assignement          varchar(10)  default 'no'        null comment 'no | yes | yes_email [team]',
    notifications_leads_activity           varchar(10)  default 'no'        null comment 'no | yes | yes_email [team]',
    notifications_tasks_activity           varchar(10)  default 'no'        null comment 'no | yes | yes_email  [everyone]',
    notifications_tickets_activity         varchar(10)  default 'no'        null comment 'no | yes | yes_email  [everyone]',
    notifications_reminders                varchar(10)  default 'yes_email' null comment 'yes_email | no',
    thridparty_stripe_customer_id          varchar(150)                     null comment 'optional - when customer pays via ',
    dashboard_access                       varchar(150) default 'yes'       null comment 'yes|no',
    welcome_email_sent                     varchar(150) default 'no'        null comment 'yes|no',
    space_uniqueid                         varchar(150)                     null
)
    comment '[truncate] except user id 0 & 1' engine = MyISAM;

create table if not exists crm_webforms
(
    webform_id                 int auto_increment
        primary key,
    webform_uniqueid           varchar(100)                   null,
    webform_created            datetime                       not null,
    webform_updated            datetime                       not null,
    webform_creatorid          int                            not null,
    webform_title              varchar(100)                   null,
    webform_type               varchar(100)                   null comment 'lead|etc',
    webform_builder_payload    text                           null comment 'json object from form builder',
    webform_thankyou_message   text                           null,
    webform_notify_assigned    varchar(10)  default 'no'      null comment 'yes|no',
    webform_notify_admin       varchar(10)  default 'no'      null comment 'yes|no',
    webform_submissions        tinyint      default 0         null,
    webform_user_captcha       varchar(10)  default 'no'      null comment 'yes|no',
    webform_submit_button_text varchar(100)                   null,
    webform_background_color   varchar(100) default '#FFFFFF' null comment 'white default',
    webform_lead_title         varchar(100)                   null,
    webform_status             varchar(100) default 'enabled' null comment 'enabled|disabled'
);

create table if not exists crm_webhooks
(
    webhooks_id                    int auto_increment
        primary key,
    webhooks_created               datetime                  not null,
    webhooks_updated               datetime                  not null,
    webhooks_creatorid             int         default 0     null,
    webhooks_gateway_name          varchar(100)              null comment 'stripe|paypal|etc',
    webhooks_type                  varchar(100)              null comment 'type of call, as sent by gateway',
    webhooks_payment_type          varchar(30)               null comment 'onetime|subscription',
    webhooks_payment_amount        decimal(10, 2)            null comment '(optional)',
    webhooks_payment_transactionid varchar(150)              null comment 'payment transaction id',
    webhooks_matching_reference    varchar(100)              null comment 'e.g. Stripe (checkout session id) | Paypal ( random string) that is used to match the webhook/ipn to the initial payment_session',
    webhooks_matching_attribute    varchar(100)              null comment 'mainly used to record what is happening with a subscription (e.g cancelled|renewed)',
    webhooks_payload               text                      null comment '(optional) json payload',
    webhooks_comment               text                      null comment '(optional)',
    webhooks_started_at            datetime                  null comment 'when the cronjob started this webhook',
    webhooks_completed_at          datetime                  null comment 'when the cronjob completed this webhook',
    webhooks_attempts              tinyint     default 0     null comment 'the number of times this webhook has been attempted',
    webhooks_status                varchar(20) default 'new' null comment 'new | processing | failed | completed   (set to processing by the cronjob, to avoid duplicate processing)'
)
    comment 'Record all actionable webhooks, for later execution by a cronjob' engine = MyISAM;

create table if not exists cuentas_contables
(
    cuentas_contablesid int auto_increment
        primary key,
    codigocontable      varchar(30)  default '' not null,
    descripcion         varchar(100) default '' not null,
    nivel               tinyint      default 0  not null,
    tipo                varchar(1)   default '' not null,
    fechacreacion       datetime(3)             not null,
    usuariocreacion     varchar(25)  default '' not null,
    fechamodificacion   datetime(3)             null,
    usuariomodificacion varchar(25)  default '' null,
    constraint codigocontable
        unique (codigocontable)
)
    charset = utf8mb4;

create table if not exists activos
(
    activosid                bigint auto_increment
        primary key,
    activos_responsablesid   int              default 1    not null,
    activos_departamentosid  int              default 1    not null,
    activos_gruposid         int              default 1    not null,
    descripcion              varchar(100)     default ''   not null,
    estado                   tinyint unsigned default 1    not null,
    codigocontable_debe      varchar(30)      default ''   not null,
    codigocontable_haber     varchar(30)      default ''   not null,
    tipocalculodepreciacion  tinyint unsigned default 1    not null,
    codigobarras             varchar(20)      default ''   not null,
    color                    varchar(30)      default ''   not null,
    serie                    varchar(30)      default ''   not null,
    estadofisico             tinyint unsigned default 1    not null,
    observaciones            varchar(150)     default ''   not null,
    fechadquisicion          date                          not null,
    fechiniciodepreciacion   date                          not null,
    fechaultimaasignacion    date                          not null,
    fechadadobaja            date                          null,
    precioadquisicion        decimal(14, 2)   default 0.00 not null,
    valorresidual            decimal(14, 2)   default 0.00 not null,
    valordepreciacion        decimal(14, 2)   default 0.00 not null,
    porcetajedepreciacion    decimal(12, 2)   default 0.00 null,
    valormensualdepreciacion decimal(14, 2)   default 0.00 not null,
    centros_costosid         int              default 0    null,
    fechacreacion            datetime(3)                   not null,
    usuariocreacion          varchar(25)      default ''   not null,
    fechamodificacion        datetime(3)                   null,
    usuariomodificacion      varchar(25)      default ''   not null,
    constraint activos_ibfk_167
        foreign key (activos_gruposid) references activos_grupos (activos_gruposid),
    constraint activos_ibfk_168
        foreign key (activos_departamentosid) references activos_departamentos (activos_departamentosid),
    constraint activos_ibfk_171
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint activos_ibfk_172
        foreign key (activos_responsablesid) references activos_responsables (activos_responsablesid),
    constraint activos_ibfk_298
        foreign key (codigocontable_debe) references cuentas_contables (codigocontable),
    constraint activos_ibfk_299
        foreign key (codigocontable_haber) references cuentas_contables (codigocontable)
)
    charset = utf8mb4;

create table if not exists activos_depreciaciones
(
    activos_depreciacionesid bigint auto_increment
        primary key,
    activosid                bigint         default 0    not null,
    fecha                    date                        not null,
    mes                      int            default 0    not null,
    dias                     int            default 0    not null,
    depreciacionmensual      decimal(14, 2) default 0.00 not null,
    depreciacionanual        decimal(14, 2) default 0.00 not null,
    saldoadepreciar          decimal(14, 2) default 0.00 not null,
    libros_diariosid         bigint         default 0    not null,
    constraint activos_depreciaciones_ibfk_173
        foreign key (activosid) references activos (activosid)
)
    charset = utf8mb4;

create table if not exists activos_historial_asignaciones
(
    activos_historial_asignacionesid bigint auto_increment
        primary key,
    activos_responsablesid           int           default 0  not null,
    activos_departamentosid          int           default 0  not null,
    fecha                            date                     not null,
    observaciones                    varchar(1000) default '' not null,
    activosid                        bigint        default 0  not null,
    centros_costosid                 int           default 0  not null,
    fechacreacion                    datetime(3)              not null,
    usuariocreacion                  varchar(25)   default '' not null,
    fechamodificacion                datetime(3)              null,
    usuariomodificacion              varchar(25)   default '' not null,
    constraint activos_historial_asignaciones_ibfk_169
        foreign key (activosid) references activos (activosid)
)
    charset = utf8mb4;

create table if not exists activos_historial_mantenimientos
(
    activos_historial_mantenimientosid bigint auto_increment
        primary key,
    activosid                          bigint       default 0  null,
    fecha                              date                    not null,
    detalle                            varchar(150) default '' not null,
    fechaproximo                       date                    null,
    detalleproximo                     varchar(150) default '' not null,
    fechacreacion                      datetime(3)             not null,
    usuariocreacion                    varchar(25)  default '' not null,
    fechamodificacion                  datetime(3)             null,
    usuariomodificacion                varchar(25)  default '' not null,
    constraint activos_historial_mantenimientos_ibfk_170
        foreign key (activosid) references activos (activosid)
)
    charset = utf8mb4;

create table if not exists bancos
(
    bancosid              int auto_increment
        primary key,
    codigocontable        varchar(30)      default '0' not null,
    descripcion           varchar(50)      default '0' not null,
    tipocuenta            tinyint          default 0   not null,
    cuenta                varchar(20)      default ''  not null,
    fechaapertura         date                         null,
    secuencialcheque      bigint unsigned  default 0   not null,
    estado                tinyint          default 0   not null,
    tipousuario           tinyint unsigned default 0   not null,
    titularcuenta         varchar(50)      default ''  not null,
    telefonooficialcuenta varchar(50)      default ''  not null,
    fechacreacion         datetime(3)                  not null,
    usuariocreacion       varchar(25)      default '0' null,
    fechamodificacion     datetime(3)                  null,
    usuariomodificacion   varchar(25)      default ''  not null,
    constraint bancos_ibfk_40
        foreign key (codigocontable) references cuentas_contables (codigocontable)
)
    charset = utf8mb4;

create table if not exists cajas
(
    cajasid             int auto_increment
        primary key,
    codigocontable      varchar(30)    default '0'  not null,
    descripcion         varchar(50)    default ''   null,
    controlasaldos      tinyint        default 0    not null,
    estado              tinyint        default 0    not null,
    valorapertura       decimal(14, 2) default 0.00 not null,
    fechacreacion       datetime(3)                 not null,
    usuariocreacion     varchar(25)    default ''   not null,
    fechamodificacion   datetime(3)                 null,
    usuariomodificacion varchar(25)    default ''   not null,
    constraint cajas_ibfk_21
        foreign key (codigocontable) references cuentas_contables (codigocontable)
)
    charset = utf8mb4;

create table if not exists cajas_cierres
(
    cajas_cierresid     bigint auto_increment
        primary key,
    cajasid             int              default 0          not null,
    recolectoresid      bigint unsigned  default 0          not null,
    fechaapertura       datetime(3)                         not null,
    facturadoresid      int              default 0          not null,
    moneda1ctv          int              default 0          not null,
    moneda5ctv          int              default 0          not null,
    moneda10ctv         int              default 0          not null,
    moneda25ctv         int              default 0          not null,
    moneda50ctv         int              default 0          not null,
    moneda1dol          int              default 0          not null,
    billete1dol         int              default 0          not null,
    billete5dol         int              default 0          not null,
    billete10dol        int              default 0          not null,
    billete20dol        int              default 0          not null,
    billete50dol        int              default 0          not null,
    billete100dol       int              default 0          not null,
    totalefectivo       decimal(14, 2)   default 0.00       not null,
    totalcheque         decimal(14, 2)   default 0.00       not null,
    totalvoucher        decimal(14, 2)   default 0.00       not null,
    saldo               decimal(14, 2)   default 0.00       not null,
    totalretenciones    decimal(14, 2)   default 0.00       not null,
    totalcredito        decimal(14, 2)   default 0.00       not null,
    totalegreso         decimal(14, 2)   default 0.00       not null,
    observacion         varchar(50)      default ''         not null,
    bloqueado           tinyint          default 0          not null,
    fechacierre         date                                null,
    horaapertura        time             default '00:00:00' not null,
    horacierre          time             default '00:00:00' null,
    estado_sync         tinyint unsigned default 0          not null,
    fechacreacion       datetime(3)                         not null,
    usuariocreacion     varchar(25)      default ''         not null,
    fechamodificacion   datetime(3)                         null,
    usuariomodificacion varchar(25)      default ''         not null,
    constraint cajas_cierres_ibfk_90
        foreign key (cajasid) references cajas (cajasid)
)
    charset = utf8mb4;

create table if not exists cuentasporcobrar_alterno
(
    cuentasporcobrarid    bigint auto_increment
        primary key,
    clientesid            bigint         default 0        not null,
    clientes_contratosid  bigint         default 0        not null,
    documentosid          bigint         default 0        not null,
    forma_pago_empresaid  int            default 1        not null,
    forma_pago_sri_codigo varchar(2)     default '01'     not null,
    cajasid               int            default 1        not null,
    bancosid              int            default 0        not null,
    tipo                  varchar(2)     default ''       not null,
    importe               decimal(18, 6) default 0.000000 not null,
    numerochequedeposito  varchar(20)    default ''       not null,
    centros_costosid      int            default 0        null,
    origen                varchar(15)    default ''       not null,
    emision               date                            not null,
    recepcion             date                            not null,
    vence                 date                            not null,
    vendedoresid          int            default 0        not null,
    cobrosid              bigint         default 0        null,
    cobradoresid          int            default 0        not null,
    relaciondocumentoid   bigint         default 0        null,
    secuencial            varchar(15)    default ''       not null,
    capital               decimal(14, 2) default 0.00     not null,
    interes               decimal(14, 2) default 0.00     not null,
    concepto              varchar(150)   default ''       not null,
    asientocontable       bigint         default 0        null,
    reciboindividual      varchar(10)    default ''       not null,
    reciboagrupado        varchar(10)    default ''       not null,
    usuariocreacion       varchar(25)    default '0'      null,
    fechacreacion         datetime(3)                     null,
    usuariomodificacion   varchar(25)    default '0'      null,
    fechamodificacion     datetime(3)                     null
)
    charset = utf8mb4;

create table if not exists depositos
(
    cajasid                   int              default 0    not null,
    centros_costosid          int              default 1    not null,
    depositosid               bigint auto_increment
        primary key,
    cajatrasnferenciaid       bigint           default 0    null,
    fecha                     date                          not null,
    referencia                varchar(15)      default ''   not null,
    bancosid                  int              default 0    not null,
    concepto                  varchar(150)     default ''   not null,
    beneficiario              varchar(50)      default ''   not null,
    total_efectivo            decimal(14, 2)   default 0.00 not null,
    total_cheque              decimal(14, 2)   default 0.00 not null,
    total_tarjeta             decimal(14, 2)   default 0.00 not null,
    total                     decimal(14, 2)   default 0.00 not null,
    comisionestarjetas        decimal(14, 2)   default 0.00 not null,
    total_retencioniva        decimal(14, 2)   default 0.00 not null,
    total_retencionrenta      decimal(14, 2)   default 0.00 not null,
    numerodocumento           varchar(15)      default ''   not null,
    total_retenido            decimal(14, 2)   default 0.00 not null,
    valorneto                 decimal(14, 2)   default 0.00 null,
    asientocontable           bigint           default 0    null,
    sri_codigo_impuesto_iva   varchar(25)      default ''   not null,
    porcentaje_iva            tinyint unsigned default 0    not null,
    valorretencion_iva        decimal(14, 2)   default 0.00 not null,
    baseimponible_iva         decimal(14, 2)   default 0.00 not null,
    baseimponible_renta       decimal(14, 2)   default 0.00 not null,
    sri_codigo_impuesto_renta varchar(25)      default ''   not null,
    porcentaje_renta          tinyint unsigned default 0    not null,
    valorretencion_renta      decimal(14, 2)   default 0.00 not null,
    fechacreacion             datetime(3)                   not null,
    usuariocreacion           varchar(20)      default ''   not null,
    fechamodificacion         datetime(3)                   null,
    usuariomodificacion       varchar(20)      default ''   not null
)
    charset = utf8mb4;

create table if not exists dinardap
(
    dinardapid         bigint auto_increment
        primary key,
    codigoentidad      varchar(7)        default ''   not null,
    fechadatos         date                           not null,
    tipoidentificacion varchar(1)        default ''   not null,
    identificacion     varchar(20)       default ''   not null,
    razonsocial        varchar(100)      default ''   not null,
    clasedesujeto      varchar(1)        default ''   not null,
    provincia          varchar(2)        default ''   not null,
    canton             varchar(2)        default ''   null,
    parroquia          varchar(2)        default ''   not null,
    sexo               varchar(1)        default ''   not null,
    estadocivil        varchar(1)        default ''   not null,
    origeningresos     varchar(1)        default ''   not null,
    valoroperacion     decimal(17, 2)    default 0.00 not null,
    saldooperacion     decimal(17, 2)    default 0.00 not null,
    fechaconcesion     date                           not null,
    fechavencimiento   date                           not null,
    fechaexigible      date                           not null,
    plazooperacion     int unsigned      default 0    not null,
    periodicidaddepago int unsigned      default 0    not null,
    diasmorosidad      smallint unsigned default 0    not null,
    montomorosidad     decimal(17, 2)    default 0.00 not null,
    montointeresmora   decimal(17, 2)    default 0.00 not null,
    valorporvencer1    decimal(17, 2)    default 0.00 not null,
    valorporvencer31   decimal(17, 2)    default 0.00 not null,
    valorporvencer91   decimal(17, 2)    default 0.00 not null,
    valorporvencer181  decimal(17, 2)    default 0.00 not null,
    valorporvencer361  decimal(17, 2)    default 0.00 not null,
    valorvencido1      decimal(17, 2)    default 0.00 not null,
    valorvencido31     decimal(17, 2)    default 0.00 not null,
    valorvencido91     decimal(17, 2)    default 0.00 not null,
    valorvencido181    decimal(17, 2)    default 0.00 not null,
    valorvencido361    decimal(17, 2)    default 0.00 not null,
    valordemanda       decimal(17, 2)    default 0.00 not null,
    carteracastiga     decimal(17, 2)    default 0.00 not null,
    cuotadelcredito    decimal(17, 2)    default 0.00 not null,
    fechadecancelacion date                           not null,
    formadecancelacion varchar(1)        default ''   not null
)
    charset = utf8mb4;

create table if not exists documentos_anulados
(
    docuentos_anuladosid int auto_increment
        primary key,
    periodo              varchar(6)  default '' not null,
    sri_documentoscodigo varchar(3)  default '' not null,
    descripcion          varchar(50) default '' not null,
    establecimiento      varchar(3)  default '' not null,
    puntoemision         varchar(3)  default '' not null,
    desde                varchar(9)  default '' not null,
    hasta                varchar(9)  default '' not null,
    autorizacion         varchar(49) default '' not null
)
    charset = utf8mb4;

create table if not exists ecommerce_carrito
(
    ecommerce_carritosid bigint auto_increment
        primary key,
    clientesid           bigint         default 0          null,
    medidasid            int            default 0          not null,
    productosid          bigint         default 0          not null,
    almacenesid          int            default 0          not null,
    cantidad             decimal(20, 8) default 0.00000000 not null,
    cantidadfactor       decimal(20, 8) default 0.00000000 not null,
    precio               decimal(20, 8) default 0.00000000 not null,
    precioiva            decimal(20, 8) default 0.00000000 not null,
    descuento            decimal(13, 8) default 0.00000000 not null,
    iva                  decimal(4, 2)  default 0.00       not null,
    usuario_temporalid   varchar(50)    default ''         null
)
    charset = utf8mb4;

create table if not exists ecommerce_comentarios
(
    ecommerce_comentariosid bigint auto_increment
        primary key,
    productosid             bigint           default 0  not null,
    clientesid              bigint           default 0  not null,
    comentario              varchar(300)     default '' not null,
    valoracion              tinyint unsigned default 0  not null,
    estado                  tinyint          default 0  not null,
    fechacreacion           datetime(3)                 not null
)
    charset = utf8mb4;

create table if not exists ecommerce_lista_deseos
(
    ecommerce_lista_deseosid bigint auto_increment
        primary key,
    clientesid               bigint default 0 not null,
    productosid              bigint default 0 not null
)
    charset = utf8mb4;

create table if not exists empresas_certificado
(
    empresas_certificadosid   int auto_increment
        primary key,
    fechacreacion             datetime(3)                 not null,
    usuariocreacion           varchar(25)      default '' not null,
    fechamodificacion         datetime(3)                 null,
    usuariomodificacion       varchar(25)      default '' not null,
    de_ambiente               tinyint unsigned default 0  null,
    de_contriespecial         varchar(10)      default '' not null,
    de_llevacontabilidad      tinyint unsigned default 0  not null,
    de_tipoidentificacion     varchar(50)      default '' not null,
    de_identificacion_empresa varchar(20)      default '' not null,
    de_razonsocial            varchar(300)     default '' not null,
    de_nombrecomercial        varchar(300)     default '' not null,
    de_direccion              varchar(150)     default '' not null,
    de_email                  varchar(300)     default '' not null,
    de_telefono               varchar(15)      default '' not null,
    de_whtasapp               varchar(15)      default '' not null,
    de_caducacer              date                        not null,
    de_certificadodigital     longblob                    not null,
    de_clavecertificado       varchar(100)     default '' not null,
    de_fechacertificado       date                        not null,
    de_correo_predeterminado  varchar(150)     default '' not null,
    de_informacion            varchar(800)     default '' not null,
    de_sql_factura            longtext                    not null,
    de_sql_retencion          longtext                    not null,
    de_sql_notacredito        longtext                    not null,
    de_sql_notadebito         longtext                    not null,
    de_sql_guiaremision       longtext                    not null,
    de_sql_liquidacioncompra  longtext                    not null,
    de_tiposql_factura        tinyint unsigned default 0  not null
)
    charset = utf8mb4;

create table if not exists facturadores
(
    facturadoresid                 int auto_increment
        primary key,
    centros_costosid               int               default 1        not null,
    recibo_cobrosid                int               default 0        not null,
    nombres                        varchar(50)       default ''       not null,
    clave                          varchar(10)       default ''       not null,
    facturador                     tinyint           default 1        not null,
    vendedor                       tinyint           default 0        not null,
    cobrador                       tinyint           default 0        not null,
    despachador                    tinyint           default 0        not null,
    estado                         tinyint           default 1        not null,
    tarifasid                      bigint            default 0        not null,
    modificaprecios                tinyint           default 0        not null,
    selecionaprecios               tinyint           default 1        not null,
    modificadescuentos             tinyint           default 0        not null,
    administrador                  tinyint           default 0        not null,
    modificasecuencias             tinyint           default 0        not null,
    selecionasecuancias            tinyint           default 0        not null,
    seleccionaralmacenes           tinyint           default 0        not null,
    seleccionarvendedor            tinyint           default 0        not null,
    modificaiva                    tinyint           default 0        not null,
    descuentopermitido             smallint unsigned default 100      not null,
    movil_registra_ubicacion       tinyint           default 1        not null,
    movil_todos_clientes           tinyint           default 0        not null,
    movil_dias_historial           tinyint unsigned  default 30       not null,
    movil_fecha_actulizacion       datetime(3)                        null,
    movil_captura_desde            varchar(8)        default '080000' not null,
    movil_captura_hasta            varchar(8)        default '18000'  not null,
    movil_captura_intervalo        tinyint unsigned  default 10       not null,
    movil_metros_cerca_empresa     tinyint unsigned  default 50       not null,
    movil_obliga_ubicacion_empresa tinyint           default 0        not null,
    telefono                       varchar(15)       default ''       not null,
    correo                         varchar(50)       default ''       not null,
    meta                           decimal(12, 2)    default 0.00     not null,
    parametros_json                varchar(500)      default '{}'     not null,
    fechacreacion                  datetime(3)                        not null,
    usuariocreacion                varchar(25)       default ''       not null,
    fechamodificacion              datetime(3)                        null,
    usuariomodificacion            varchar(25)       default ''       not null,
    constraint facturadores_ibfk_23
        foreign key (centros_costosid) references centros_costos (centros_costosid)
)
    charset = utf8mb4;

create table if not exists facturadores_almacenes
(
    Facturadores_AlmacenesID int auto_increment
        primary key,
    facturadoresid           int     default 0 not null,
    almacenesid              int     default 0 not null,
    principal                tinyint default 0 null,
    constraint facturadores_almacenes_ibfk_25
        foreign key (facturadoresid) references facturadores (facturadoresid),
    constraint facturadores_almacenes_ibfk_34
        foreign key (almacenesid) references almacenes (almacenesid)
)
    charset = utf8mb4;

create table if not exists facturadores_cajas
(
    facturadores_cajasid bigint auto_increment
        primary key,
    facturadoresid       int     default 1 not null,
    cajasid              int     default 1 not null,
    principal            tinyint default 0 not null,
    constraint facturadoresid_cajasid
        unique (cajasid, facturadoresid),
    constraint facturadores_cajas_ibfk_27
        foreign key (facturadoresid) references facturadores (facturadoresid),
    constraint facturadores_cajas_ibfk_30
        foreign key (cajasid) references cajas (cajasid)
)
    charset = utf8mb4;

create table if not exists facturadores_comiciones
(
    facturadores_comicionesid bigint auto_increment
        primary key,
    diasinicio                int               default 0    not null,
    diasfin                   smallint unsigned default 0    not null,
    porcentaje                decimal(4, 2)     default 0.00 not null,
    facturadoresid            int               default 0    not null
)
    charset = utf8mb4;

create table if not exists facturadores_localizacion
(
    facturadores_localizacionesid bigint auto_increment
        primary key,
    vendedoresid                  int         default 0  null,
    fechahora                     datetime(3)            null,
    latitud                       varchar(30) default '' not null,
    longitud                      varchar(30) default '' not null,
    estado                        tinyint     default 0  not null,
    constraint facturadores_localizacion_ibfk_195
        foreign key (vendedoresid) references facturadores (facturadoresid)
)
    charset = utf8mb4;

create table if not exists facturadores_tarifas
(
    facturadores_tarifasid int auto_increment
        primary key,
    facturadoresid         int     default 0 not null,
    tarifasid              bigint  default 0 not null,
    principal              tinyint default 0 null,
    constraint facturadores_tarifas_ibfk_26
        foreign key (facturadoresid) references facturadores (facturadoresid)
)
    charset = utf8mb4;

create table if not exists facturas_apartados
(
    facturas_apartadosid bigint auto_increment
        primary key,
    fecha                datetime(3)                       not null,
    cantidaddigitada     decimal(14, 2) default 0.00       not null,
    productosid          bigint         default 0          not null,
    total                decimal(14, 2) default 0.00       not null,
    medidasid            int            default 1          not null,
    precio               decimal(20, 8) default 0.00000000 not null,
    precioiva            decimal(20, 8) default 0.00000000 not null,
    descuento            decimal(13, 8) default 0.00000000 not null,
    facturadoresid       int            default 0          not null,
    clientesid           bigint         default 0          not null,
    tarifasid            bigint         default 1          not null
)
    charset = utf8mb4;

create table if not exists facturas_exportacion
(
    facturasid             bigint         default 0    not null,
    facturas_exportacionid bigint auto_increment
        primary key,
    tipoincoterm           varchar(30)    default ''   null,
    lugarIncoterm          varchar(30)    default ''   not null,
    paisorigen             varchar(3)     default ''   not null,
    puertoembarque         varchar(30)    default ''   not null,
    puertodestino          varchar(30)    default ''   not null,
    paisdestino            varchar(3)     default ''   not null,
    paisadquisicion        varchar(3)     default ''   not null,
    fleteinternacional     decimal(12, 2) default 0.00 not null,
    segurointernacional    decimal(12, 2) default 0.00 not null,
    gastosaduaneros        decimal(12, 2) default 0.00 not null,
    gastostransporteotros  decimal(12, 2) default 0.00 not null,
    numerodae              varchar(30)    default ''   null,
    numerotransporte       varchar(30)    default ''   null,
    fechaembarque          date                        null,
    tipoexportacion        varchar(2)     default '01' not null,
    tipoingresoexterior    varchar(3)     default ''   not null,
    grabarentalocal        varchar(2)     default 'NO' not null,
    grabarentaexterior     decimal(14, 2) default 0.00 not null
)
    charset = utf8mb4;

create table if not exists forma_pago_sri
(
    forma_pago_sriid      int auto_increment
        primary key,
    forma_pago_sri_codigo varchar(2)  default '' not null,
    descripcion           varchar(50) default '' not null,
    fechavalidodesde      date                   not null,
    fechavalidohasta      date                   not null,
    constraint forma_pago_sri_codigo
        unique (forma_pago_sri_codigo)
)
    charset = utf8mb4;

create table if not exists forma_pago_empresa
(
    forma_pago_empresaid  int auto_increment
        primary key,
    forma_pago_tipo       varchar(2)    default ''   not null,
    descripcion           varchar(50)   default ''   not null,
    forma_pago_sri_codigo varchar(2)    default ''   not null,
    recargo               decimal(5, 2) default 0.00 not null,
    fechacreacion         datetime(3)                not null,
    usuariocreacion       varchar(25)   default ''   not null,
    fechamodificacion     datetime(3)                null,
    usuariomodificacion   varchar(25)   default ''   not null,
    constraint forma_pago_tipo
        unique (forma_pago_tipo),
    constraint forma_pago_empresa_ibfk_3
        foreign key (forma_pago_sri_codigo) references forma_pago_sri (forma_pago_sri_codigo)
)
    charset = utf8mb4;

create table if not exists facturadores_forma_pago
(
    facturadores_forma_pagoid int auto_increment
        primary key,
    facturadoresid            int     default 0 not null,
    forma_pago_empresaid      int     default 0 not null,
    principal                 tinyint default 0 not null,
    constraint facturadores_forma_pago_ibfk_22
        foreign key (forma_pago_empresaid) references forma_pago_empresa (forma_pago_empresaid),
    constraint facturadores_forma_pago_ibfk_28
        foreign key (facturadoresid) references facturadores (facturadoresid)
)
    charset = utf8mb4;

create table if not exists garantias
(
    garantiasid         int auto_increment
        primary key,
    garantias_codigo    varchar(10)      default ''         not null,
    secuencial          varchar(15)      default ''         not null,
    clientesid          bigint           default 0          not null,
    emision             date                                not null,
    estado              varchar(9)       default '0'        not null,
    tecnicosid          int              default 0          not null,
    fecha_entrega       date                                not null,
    entregado           varchar(50)      default ''         not null,
    recibido            varchar(50)      default ''         not null,
    contacto            varchar(30)      default ''         not null,
    telefono            varchar(50)      default ''         not null,
    total               decimal(20, 8)   default 0.00000000 null,
    tipo                tinyint unsigned default 0          not null,
    estadoavance        varchar(50)      default ''         not null,
    valoravance         decimal(5, 2)    default 0.00       not null,
    documentosid        bigint           default 0          null,
    origen              varchar(15)      default ''         not null,
    fechacreacion       datetime(3)                         not null,
    usuariocreacion     varchar(25)      default ''         not null,
    usuariomodificacion varchar(25)      default ''         not null,
    fechamodificacion   datetime(3)                         null,
    constraint garantias_codigo
        unique (garantias_codigo)
)
    charset = utf8mb4;

create table if not exists garantias_detalles
(
    garantias_detallesid int auto_increment
        primary key,
    garantiasid          int            default 0    not null,
    productosid          bigint         default 0    not null,
    tecnicosid           int            default 0    not null,
    serie                varchar(30)    default ''   not null,
    marca                varchar(25)    default ''   not null,
    modelo               varchar(30)    default ''   not null,
    descripcion          varchar(50)    default ''   not null,
    estado               tinyint        default 0    not null,
    estado_global        varchar(10)    default ''   not null,
    observacion          varchar(300)   default ''   not null,
    problema             varchar(300)   default ''   not null,
    valor                decimal(12, 2) default 0.00 not null,
    constraint garantias_detalles_ibfk_228
        foreign key (garantiasid) references garantias (garantiasid)
)
    charset = utf8mb4;

create table if not exists garantias_seguimientos
(
    garantias_seguimientosid int auto_increment
        primary key,
    garantias_detallesid     int          default 0  not null,
    tecnicosid               int          default 0  not null,
    fecha                    date                    not null,
    observacio_recepcion     varchar(300) default '' not null,
    mantenimiento            varchar(300) default '' not null,
    recomendacion            varchar(300) default '' not null,
    fechaproxima             date                    not null,
    asientocontable          bigint       default 0  not null,
    usuariocreacion          varchar(25)  default '' not null,
    fechacreacion            datetime(3)             not null,
    usuariomodificacion      varchar(25)  default '' not null,
    fechamodificiacion       datetime(3)             null,
    constraint garantias_seguimientos_ibfk_229
        foreign key (garantias_detallesid) references garantias_detalles (garantias_detallesid)
)
    charset = utf8mb4;

create table if not exists garantias_repuestos
(
    garantias_repuestosid    int auto_increment
        primary key,
    centros_costosid         int            default 0          not null,
    garantias_detallesid     int            default 0          not null,
    garantias_seguimientosid int            default 0          not null,
    movinventarios_tiposid   int            default 0          not null,
    almacenesid              int            default 0          not null,
    clientesid               bigint         default 0          not null,
    medidasid                int            default 0          not null,
    productosid              bigint         default 0          not null,
    cantidaddigitada         decimal(14, 2) default 0.00       not null,
    cantidadfactor           decimal(20, 8) default 0.00000000 not null,
    cantidad                 decimal(20, 8) default 0.00000000 not null,
    precio                   decimal(20, 8) default 0.00000000 not null,
    precioiva                decimal(20, 8) default 0.00000000 not null,
    iva                      decimal(4, 2)  default 0.00       not null,
    costo                    decimal(20, 8) default 0.00000000 not null,
    facturado                tinyint        default 0          not null,
    constraint garantias_repuestos_ibfk_230
        foreign key (garantias_seguimientosid) references garantias_seguimientos (garantias_seguimientosid)
)
    charset = utf8mb4;

create table if not exists integraciones
(
    integracionesid int auto_increment
        primary key,
    descripcion     varchar(50)      default '' not null,
    tipo            tinyint unsigned default 1  not null,
    parametros      longtext                    null
)
    charset = utf8mb4;

create table if not exists libros_diarios
(
    libros_diariosid    bigint auto_increment
        primary key,
    codigoasiento       varchar(10)    default ''   not null,
    referencia          varchar(15)    default ''   not null,
    fecha               date                        not null,
    concepto            varchar(200)   default ''   not null,
    debito              decimal(14, 2) default 0.00 not null,
    credito             decimal(14, 2) default 0.00 not null,
    origen              varchar(15)    default ''   not null,
    mayorizado          tinyint        default 0    not null,
    verificado          tinyint        default 0    not null,
    anulado             tinyint        default 0    not null,
    usuariocreacion     varchar(25)    default ''   not null,
    fechacreacion       datetime(3)                 not null,
    usuariomodificacion varchar(25)    default ''   not null,
    fechamodificacion   datetime(3)                 null,
    constraint codigoasiento
        unique (codigoasiento)
)
    charset = utf8mb4;

create table if not exists libros_diarios_detalles
(
    libros_diariosid          bigint         default 0    not null,
    centros_costosid          int            default 0    not null,
    libros_diarios_detallesid bigint auto_increment
        primary key,
    codigocontable            varchar(30)    default ''   not null,
    referencia                varchar(15)    default ''   not null,
    concepto                  varchar(200)   default ''   not null,
    importe                   decimal(14, 2) default 0.00 not null,
    anulado                   tinyint        default 0    not null,
    constraint libros_diarios_detalles_ibfk_11
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint libros_diarios_detalles_ibfk_4
        foreign key (codigocontable) references cuentas_contables (codigocontable),
    constraint libros_diarios_detalles_ibfk_5
        foreign key (libros_diariosid) references libros_diarios (libros_diariosid)
)
    charset = utf8mb4;

create table if not exists marketing
(
    marketingid         bigint auto_increment
        primary key,
    descripcion         varchar(100) default '' not null,
    emision             date                    not null,
    mensaje             longtext                null,
    adjuntos            longtext                null,
    fechacreacion       datetime(3)             not null,
    usuariocreacion     varchar(25)  default '' not null,
    fechamodificacion   datetime(3)             null,
    usuariomodificacion varchar(25)  default '' not null
)
    charset = utf8mb4;

create table if not exists marketing_detalles
(
    marketing_detallesid bigint auto_increment
        primary key,
    marketingid          bigint           default 0  not null,
    celular              varchar(15)      default '' not null,
    estado               tinyint unsigned default 0  not null,
    descripcion          varchar(100)     default '' not null,
    constraint marketing_detalles_ibfk_297
        foreign key (marketingid) references marketing (marketingid)
)
    charset = utf8mb4;

create table if not exists marketing_plantillas
(
    marketing_plantillasid int auto_increment
        primary key,
    descripcion            varchar(30)      default '' not null,
    tipo_envio             tinyint unsigned default 1  not null,
    tipo_plantilla         tinyint unsigned default 1  not null,
    contenido              longtext                    null,
    fechacreacion          datetime(3)                 not null,
    usuariocreacion        varchar(25)      default '' not null,
    fechamodificacion      datetime(3)                 null,
    usuariomodificacion    varchar(25)      default '' not null
)
    charset = utf8mb4;

create table if not exists medidas
(
    medidasid           int auto_increment
        primary key,
    descripcion         varchar(30) default ''  not null,
    descripcioncorta    varchar(10) default ''  not null,
    fechacreacion       datetime(3)             not null,
    usuariocreacion     varchar(25) default ''  not null,
    fechamodificacion   datetime(3)             null,
    usuariomodificacion varchar(25) default '0' null
)
    charset = utf8mb4;

create table if not exists movimientos_conceptos
(
    movimientos_conceptosid int auto_increment
        primary key,
    descripcion             varchar(50)      default '' null,
    codigocontable          varchar(30)      default '' not null,
    usuariocreacion         varchar(25)      default '' not null,
    fechacreacion           datetime(3)                 not null,
    usuariomodificacion     varchar(25)      default '' not null,
    fechamodificacion       datetime(3)                 null,
    tipo                    tinyint unsigned default 1  not null
)
    charset = utf8mb4;

create table if not exists movbanco
(
    movbancosid             bigint auto_increment
        primary key,
    documentosid            bigint         default 0    not null,
    tipomovimiento          varchar(2)     default '0'  not null,
    bancosid                int            default 0    not null,
    centros_costosid        int            default 1    not null,
    fechamovimiento         date                        not null,
    fechavence              date                        not null,
    conciliacion_bancariaid bigint         default 0    not null,
    transferencia_cajasid   bigint         default 0    not null,
    transferencia_bancosid  bigint         default 0    not null,
    transferenciaemision    date                        null,
    comprobante             varchar(15)    default ''   not null,
    depositosid             bigint         default 0    not null,
    origen                  varchar(15)    default ''   not null,
    numerodocumento         varchar(15)    default ''   not null,
    documentoorigen         varchar(15)    default ''   not null,
    importe                 decimal(14, 2) default 0.00 not null,
    tipo                    varchar(2)     default ''   not null,
    concepto                varchar(150)   default ''   not null,
    beneficiario            varchar(100)   default ''   not null,
    asientocontable         bigint         default 0    not null,
    fechacreacion           datetime(3)                 not null,
    usuariocreacion         varchar(25)    default ''   not null,
    fechamodificacion       datetime(3)                 null,
    usuariomodificacion     varchar(25)    default '0'  null,
    movimientos_conceptosid int            default 1    not null,
    constraint movbanco_ibfk_119
        foreign key (movimientos_conceptosid) references movimientos_conceptos (movimientos_conceptosid),
    constraint movbanco_ibfk_196
        foreign key (bancosid) references bancos (bancosid),
    constraint movbanco_ibfk_301
        foreign key (centros_costosid) references centros_costos (centros_costosid)
)
    charset = utf8mb4;

create table if not exists movcaja
(
    movcajasid               bigint auto_increment
        primary key,
    movimientos_conceptosid  int              default 1    not null,
    forma_pago_empresaid     int              default 0    not null,
    centros_costosid         int              default 1    not null,
    documentosid             bigint           default 0    not null,
    fechamovimiento          date                          not null,
    fechavence               date                          not null,
    cajasid                  int              default 0    not null,
    bancotarjetaid           bigint           default 0    not null,
    depositosid              bigint           default 0    null,
    importe                  decimal(14, 2)   default 0.00 not null,
    tipo                     varchar(2)       default ''   not null,
    comprobante              varchar(15)      default ''   not null,
    origen                   varchar(15)      default ''   not null,
    numerochequevoucher      varchar(20)      default ''   not null,
    concepto                 varchar(150)     default ''   not null,
    documentoorigen          varchar(15)      default ''   not null,
    beneficiario             varchar(100)     default ''   not null,
    transferencia_cajasid    bigint           default 0    not null,
    transferencia_bancosid   bigint           default 0    not null,
    transferenciaemision     date                          null,
    asientocontable          bigint           default 0    not null,
    tarjetas_retencionesid   bigint           default 0    not null,
    retencionestablecimiento varchar(3)       default ''   not null,
    retencionpuntoemision    varchar(3)       default ''   not null,
    retencionsecuencia       varchar(9)       default ''   not null,
    retenciontipo            tinyint unsigned default 0    not null,
    vouchercomicion          decimal(12, 2)   default 0.00 not null,
    voucherrenta             decimal(12, 2)   default 0.00 not null,
    voucheriva               decimal(12, 2)   default 0.00 not null,
    estado_sync              tinyint unsigned default 0    not null,
    usuariocreacion          varchar(25)      default ''   not null,
    fechacreacion            datetime(3)                   not null,
    usuariomodificacion      varchar(25)      default ''   not null,
    fechamodificacion        datetime(3)                   null,
    constraint movcaja_ibfk_118
        foreign key (movimientos_conceptosid) references movimientos_conceptos (movimientos_conceptosid),
    constraint movcaja_ibfk_300
        foreign key (centros_costosid) references centros_costos (centros_costosid)
)
    charset = utf8mb4;

create table if not exists movinventarios_tipos
(
    movinventarios_tiposid int auto_increment
        primary key,
    descripcion            varchar(50) default ''  not null,
    codigocontable         varchar(30) default '0' not null,
    estado                 tinyint     default 0   not null,
    costea                 tinyint     default 0   not null,
    modulos                varchar(50) default ''  not null,
    orden                  int         default 0   not null,
    interno                tinyint     default 0   not null,
    tipocalculo            tinyint     default 0   not null
)
    charset = utf8mb4;

create table if not exists ingresos
(
    ingresosid              bigint auto_increment
        primary key,
    ingresoscodigo          varchar(10)    default ''         not null,
    centros_costosid        int            default 0          not null,
    fecha                   date                              not null,
    movinventarios_tiposid  int            default 0          not null,
    almacenesid             int            default 0          not null,
    concepto                varchar(200)   default ''         not null,
    observacion             varchar(75)    default ''         not null,
    total                   decimal(20, 8) default 0.00000000 not null,
    asientocontable         bigint         default 0          not null,
    movimientos_conceptosid int            default 14         not null,
    origen                  varchar(15)    default ''         not null,
    fechacreacion           datetime(3)                       not null,
    usuariocreacion         varchar(25)    default ''         not null,
    usuariomodificacion     varchar(25)    default ''         not null,
    fechamodificacion       datetime(3)                       null,
    constraint ingresoscodigo
        unique (ingresoscodigo),
    constraint ingresos_ibfk_102
        foreign key (movinventarios_tiposid) references movinventarios_tipos (movinventarios_tiposid),
    constraint ingresos_ibfk_103
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint ingresos_ibfk_108
        foreign key (movimientos_conceptosid) references movimientos_conceptos (movimientos_conceptosid),
    constraint ingresos_ibfk_95
        foreign key (almacenesid) references almacenes (almacenesid)
)
    charset = utf8mb4;

create table if not exists movinventario_variantes_detalles
(
    movinventario_variantes_detallesid bigint auto_increment
        primary key,
    movinventario_variantesid          bigint         default 0          not null,
    documentosid                       bigint         default 0          not null,
    origen                             varchar(15)    default ''         not null,
    movinventarios_tiposid             int            default 0          not null,
    cantidad                           decimal(20, 8) default 0.00000000 null,
    constraint movinventario_variantes_detalles_ibfk_310
        foreign key (movinventarios_tiposid) references movinventarios_tipos (movinventarios_tiposid)
)
    charset = utf8mb4;

create table if not exists nomina_cargos
(
    nomina_cargosid     int auto_increment
        primary key,
    descripcion         varchar(50) default '' not null,
    estado              tinyint     default 1  not null,
    fechacreacion       datetime(3)            not null,
    usuariocreacion     varchar(25) default '' not null,
    fechamodificacion   datetime(3)            null,
    usuariomodificacion varchar(25) default '' not null
)
    charset = utf8mb4;

create table if not exists nomina_departamentos
(
    nomina_departamentosid int auto_increment
        primary key,
    descripcion            varchar(50) default '' not null,
    estado                 tinyint     default 1  not null,
    codigocontable_debe    varchar(30) default '' not null,
    codigocontable_haber   varchar(30) default '' not null,
    fechacreacion          datetime(3)            not null,
    fechamodificacion      datetime(3)            null,
    usuariocreacion        varchar(25) default '' not null,
    usuariomodificacion    varchar(25) default '' not null
)
    charset = utf8mb4;

create table if not exists nomina_empleados
(
    nomina_empleadosid     bigint auto_increment
        primary key,
    nomina_departamentosid int               default 1    not null,
    nomina_cargosid        int               default 1    not null,
    centros_costosid       int               default 1    not null,
    provinciasid           varchar(2)        default ''   null,
    ciudadesid             varchar(4)        default ''   null,
    parroquiasid           varchar(6)        default ''   null,
    empleado_bancosid      tinyint unsigned  default 1    not null,
    empleado_forma_pago    tinyint unsigned  default 1    not null,
    tipoidentificacion     varchar(1)        default ''   not null,
    identificacion         varchar(20)       default ''   not null,
    apellidos              varchar(150)      default ''   not null,
    nombres                varchar(150)      default ''   not null,
    direccion              varchar(300)      default ''   not null,
    telefono1              varchar(15)       default ''   not null,
    telefono2              varchar(15)       default ''   not null,
    email                  varchar(150)      default ''   not null,
    genero                 tinyint unsigned  default 1    not null,
    estadocivil            tinyint unsigned  default 1    not null,
    tipolicencia           tinyint unsigned  default 1    not null,
    nacionalidad           varchar(30)       default ''   not null,
    fechanacimiento        date                           null,
    edad                   smallint unsigned default 18   not null,
    tiposalario            tinyint unsigned  default 1    not null,
    salario                decimal(7, 2)     default 0.00 not null,
    tipoempleado           tinyint unsigned  default 1    not null,
    pesonacontacto         varchar(150)      default ''   not null,
    telefonocontacto       varchar(20)       default ''   not null,
    numerocontrato         varchar(30)       default ''   not null,
    fechacontrato          date                           null,
    empleado_tipocuenta    tinyint unsigned  default 1    not null,
    empleado_numerocuenta  varchar(30)       default ''   not null,
    fechasalida            date                           null,
    decimotercero          tinyint           default 0    not null,
    decimocuarto           tinyint           default 0    not null,
    fondosreserva          tinyint           default 0    not null,
    cargasfamiliares       tinyint unsigned  default 0    not null,
    estado                 tinyint           default 1    not null,
    iessasumido            tinyint           default 0    not null,
    propietario            tinyint           default 0    not null,
    fechacreacion          datetime(3)                    not null,
    usuariocreacion        varchar(25)       default ''   not null,
    fechamodificacion      datetime(3)                    null,
    usuariomodificacion    varchar(25)       default ''   not null,
    constraint nomina_empleados_ibfk_176
        foreign key (nomina_departamentosid) references nomina_departamentos (nomina_departamentosid),
    constraint nomina_empleados_ibfk_177
        foreign key (nomina_cargosid) references nomina_cargos (nomina_cargosid)
)
    charset = utf8mb4;

create table if not exists nomina_empleados_cargas
(
    nomina_empleados_cargasid bigint auto_increment
        primary key,
    nomina_empleadosid        bigint       default 0  not null,
    identificacion            varchar(20)  default '' not null,
    nombres                   varchar(100) default '' not null,
    apellidos                 varchar(100) default '' not null,
    fechanacimiento           date                    not null,
    parentesco                varchar(30)  default '' not null,
    estado                    tinyint      default 0  not null,
    estudiante                tinyint      default 0  not null,
    constraint nomina_empleados_cargas_ibfk_236
        foreign key (nomina_empleadosid) references nomina_empleados (nomina_empleadosid)
)
    charset = utf8mb4;

create table if not exists nomina_prestamos
(
    nomina_prestamosid  bigint auto_increment
        primary key,
    nomina_empleadosid  bigint            default 0          not null,
    tipo                int               default 1          not null,
    nomina_rubrosid     bigint            default 0          not null,
    emision             date                                 not null,
    vence               date                                 not null,
    total               decimal(20, 8)    default 0.00000000 not null,
    numero_cuotas       smallint unsigned default 0          not null,
    anticiposlotesid    varchar(10)       default ''         not null,
    fechacreacion       datetime(3)                          not null,
    usuariocreacion     varchar(25)       default ''         not null,
    fechamodificacion   datetime(3)                          null,
    usuariomodificacion varchar(25)       default ''         not null
)
    charset = utf8mb4;

create table if not exists nomina_prestamos_creditos
(
    nomina_prestamos_creditosid bigint auto_increment
        primary key,
    nomina_prestamosid          bigint         default 0    not null,
    vence                       date                        not null,
    valor                       decimal(14, 2) default 0.00 not null,
    numero_cuotas               varchar(7)     default ''   not null,
    constraint nomina_prestamos_creditos_ibfk_191
        foreign key (nomina_prestamosid) references nomina_prestamos (nomina_prestamosid)
)
    charset = utf8mb4;

create table if not exists nomina_prestamos_creditos_detalles
(
    nomina_prestamos_creditos_detallesid bigint auto_increment
        primary key,
    nomina_prestamos_creditosid          bigint         default 0    not null,
    nomina_rolesid                       bigint         default 0    not null,
    valor                                decimal(14, 2) default 0.00 not null,
    constraint nomina_prestamos_creditos_detalles_ibfk_192
        foreign key (nomina_prestamos_creditosid) references nomina_prestamos_creditos (nomina_prestamos_creditosid)
)
    charset = utf8mb4;

create table if not exists nomina_roles
(
    nomina_rolesid      bigint auto_increment
        primary key,
    fechas              datetime(3)                   not null,
    tipo_rol            tinyint unsigned default 1    not null,
    descripcion         varchar(100)     default ''   null,
    sueldobasico        decimal(14, 2)   default 0.00 not null,
    asientocontable     bigint           default 0    not null,
    bloqueado           tinyint          default 0    not null,
    pagado              tinyint          default 0    not null,
    fechabloqueo        date                          null,
    fechacreacion       datetime(3)                   not null,
    usuariocreacion     varchar(25)      default ''   not null,
    fechamodificacion   datetime(3)                   null,
    usuariomodificacion varchar(25)      default ''   not null
)
    charset = utf8mb4;

create table if not exists nomina_roles_detalles
(
    nomina_roles_detallesid  bigint auto_increment
        primary key,
    nomina_rolesid           bigint         default 0    not null,
    nomina_roles_empleadosid bigint         default 0    not null,
    nomina_roles_rubrosid    bigint         default 0    not null,
    centros_costosid         int            default 0    not null,
    valor                    decimal(14, 2) default 0.00 not null,
    provision                tinyint        default 0    null,
    codigocontable_debe      varchar(30)    default ''   not null,
    codigocontable_haber     varchar(30)    default ''   null,
    parametros_json          varchar(500)   default ''   null
)
    charset = utf8mb4;

create table if not exists nomina_roles_empleados
(
    nomina_roles_empleadosid bigint auto_increment
        primary key,
    nomina_rolesid           bigint           default 0    null,
    nomina_empleadosid       bigint           default 0    not null,
    nomina_departamentosid   int              default 1    not null,
    nomina_cargosid          int              default 1    not null,
    centros_costosid         int              default 1    not null,
    tipoidentificacion       varchar(1)       default ''   not null,
    identificacion           varchar(20)      default ''   not null,
    apellidos                varchar(150)     default ''   not null,
    nombres                  varchar(150)     default ''   not null,
    salario                  decimal(7, 2)    default 0.00 not null,
    tipoempleado             tinyint unsigned default 1    not null,
    decimotercero            tinyint          default 0    not null,
    decimocuarto             tinyint          default 0    not null,
    fondosreserva            tinyint          default 0    not null,
    cargasfamiliares         tinyint unsigned default 0    not null,
    iessasumido              tinyint          default 0    not null,
    propietario              tinyint          default 0    not null,
    constraint nomina_roles_empleados_ibfk_189
        foreign key (nomina_rolesid) references nomina_roles (nomina_rolesid),
    constraint nomina_roles_empleados_ibfk_190
        foreign key (nomina_empleadosid) references nomina_empleados (nomina_empleadosid)
)
    charset = utf8mb4;

create table if not exists nomina_rubros
(
    nomina_rubrosid      bigint auto_increment
        primary key,
    rubros_codigo        varchar(10)      default '' not null,
    descripcion          varchar(100)     default '' not null,
    descripcionimpresion varchar(20)      default '' not null,
    visibleimpresion     tinyint          default 0  not null,
    orden                tinyint unsigned default 0  not null,
    codigocontable_debe  varchar(30)      default '' not null,
    codigocontable_haber varchar(30)      default '' not null,
    estado               tinyint          default 0  not null,
    tipo_calculo         tinyint unsigned default 2  not null,
    provision            tinyint          default 0  not null,
    formula_estandar     varchar(1000)    default '' not null,
    formula              varchar(1000)    default '' not null,
    grupo                tinyint unsigned default 1  not null,
    visible              tinyint          default 0  not null,
    extencion_debe       varchar(10)      default '' not null,
    extencion_haber      varchar(10)      default '' not null,
    disponibleprestamos  tinyint          default 0  not null,
    disponibleanticipos  tinyint          default 0  not null,
    fechacreacion        date                        not null,
    usuariocreacion      varchar(25)      default '' null,
    fechamodificacion    datetime(3)                 null,
    usuariomodificacion  varchar(25)      default '' null,
    descuentos           tinyint          default 0  not null,
    constraint rubros_codigo
        unique (rubros_codigo)
)
    charset = utf8mb4;

create table if not exists nomina_roles_rubros
(
    nomina_roles_rubrosid bigint auto_increment
        primary key,
    nomina_rubrosid       bigint           default 0  not null,
    nomina_rolesid        bigint           default 0  not null,
    rubros_codigo         varchar(10)      default '' not null,
    descripcion           varchar(100)     default '' not null,
    descripcionimpresion  varchar(20)      default '' not null,
    visibleimpresion      tinyint          default 0  not null,
    orden                 tinyint unsigned default 0  not null,
    codigocontable_debe   varchar(30)      default '' not null,
    codigocontable_haber  varchar(30)      default '' not null,
    estado                tinyint          default 0  not null,
    tipo_calculo          tinyint unsigned default 2  not null,
    provision             tinyint          default 0  not null,
    formula_estandar      varchar(1000)    default '' not null,
    formula               varchar(1000)    default '' not null,
    grupo                 tinyint unsigned default 1  not null,
    visible               tinyint          default 0  not null,
    extencion_debe        varchar(10)      default '' not null,
    extencion_haber       varchar(10)      default '' not null,
    descuentos            tinyint          default 0  not null,
    constraint nomina_roles_rubros_ibfk_187
        foreign key (nomina_rolesid) references nomina_roles (nomina_rolesid),
    constraint nomina_roles_rubros_ibfk_188
        foreign key (nomina_rubrosid) references nomina_rubros (nomina_rubrosid)
)
    charset = utf8mb4;

create table if not exists pagos_aprobaciones
(
    pagos_aprobacionesid      bigint auto_increment
        primary key,
    pagos_aprobaciones_codigo varchar(10)      default '' null,
    asistente                 varchar(75)      default '' null,
    fecha_aprobacion1         datetime(3)                 not null,
    tesorero                  varchar(75)      default '' not null,
    fecha_aprobacion2         datetime(3)                 null,
    gerente                   varchar(75)      default '' not null,
    fecha_aprobacion3         datetime(3)                 null,
    estado                    tinyint unsigned default 0  not null,
    fechacreacion             datetime(3)                 not null,
    usuariocreacion           varchar(25)      default '' not null,
    fechamodificacion         datetime(3)                 null,
    usuariomodificacion       varchar(25)      default '' not null,
    numero_comprobante        varchar(30)      default '' null,
    numero_orden              varchar(30)      default '' null,
    constraint pagos_aprobaciones_codigo
        unique (pagos_aprobaciones_codigo)
)
    charset = utf8mb4;

create table if not exists parroquias
(
    parroquiasid varchar(6)  default '' not null,
    parroquia    varchar(75) default '' not null,
    constraint parroquiasid
        unique (parroquiasid)
)
    charset = utf8mb4;

create table if not exists produccion_procesos
(
    produccion_procesosid bigint auto_increment
        primary key,
    descripcion           varchar(50)   default ' ' not null,
    procesos_codigo       varchar(15)   default ''  not null,
    especificaciones      varchar(1000) default ''  not null,
    padreid               bigint        default 0   not null,
    tipo                  varchar(1)    default 'G' not null,
    estado                tinyint       default 1   not null,
    fechacreacion         datetime(3)               not null,
    usuariocreacion       varchar(20)   default ''  not null,
    fechamodificacion     datetime(3)               null,
    usuariomodificacion   varchar(20)   default ''  not null
)
    charset = utf8mb4;

create table if not exists produccion
(
    produccionesid        bigint auto_increment
        primary key,
    produccion_codigo     varchar(10)  default '' not null,
    produccion_procesosid bigint       default 0  not null,
    salidasid             bigint       default 0  not null,
    ingresosid            bigint       default 0  not null,
    fechaorden            date                    not null,
    fechaentrega          date                    not null,
    centros_costosid      int          default 1  not null,
    detalle1              varchar(100) default '' not null,
    detalle2              varchar(100) default '' not null,
    detalle3              varchar(100) default '' not null,
    explotada             tinyint      default 0  not null,
    terminada             tinyint      default 0  not null,
    fechacreacion         datetime(3)             not null,
    usuariocreacion       varchar(20)  default '' not null,
    fechamodificacion     datetime(3)             null,
    usuariomodificacion   varchar(20)  default '' not null,
    constraint produccion_codigo
        unique (produccion_codigo),
    constraint produccion_ibfk_133
        foreign key (produccion_procesosid) references produccion_procesos (produccion_procesosid),
    constraint produccion_ibfk_134
        foreign key (centros_costosid) references centros_costos (centros_costosid)
)
    charset = utf8mb4;

create table if not exists produccion_recetas
(
    produccion_recetasid bigint auto_increment
        primary key,
    recetas_codigo       varchar(50)    default ''       not null,
    productosid          bigint         default 0        not null,
    valor_mod            decimal(18, 6) default 0.000000 not null,
    valor_cif            decimal(18, 6) default 0.000000 not null,
    usuariocreacion      varchar(20)    default ''       not null,
    fechacreacion        datetime(3)                     not null,
    fechamodificacion    datetime(3)                     null,
    usuariomodificacion  varchar(20)    default ''       not null,
    constraint recetas_codigo
        unique (recetas_codigo)
)
    charset = utf8mb4;

create table if not exists productos_categorias
(
    productos_categoriasid bigint auto_increment
        primary key,
    descripcion            varchar(50)  default '' not null,
    imagen                 longblob                null,
    ecommerceid            int          default 0  not null,
    parametros_json        varchar(500) default '' not null,
    fechacreacion          datetime(3)             not null,
    usuariocreacion        varchar(25)  default '' not null,
    fechamodificacion      datetime(3)             null,
    usuariomodificacion    varchar(25)  default '' not null
)
    charset = utf8mb4;

create table if not exists productos_colores
(
    productos_coloresid int auto_increment
        primary key,
    color               varchar(30) default '' not null,
    constraint color
        unique (color)
)
    charset = utf8mb4;

create table if not exists productos_lineas
(
    productos_lineasid         bigint auto_increment
        primary key,
    descripcion                varchar(50)  default '' not null,
    imagen                     longblob                null,
    ecommerceid                int          default 0  not null,
    cuentacontable_inventarios varchar(30)  default '' not null,
    cuentacontable_ventas      varchar(30)  default '' not null,
    cuentacontable_costo       varchar(30)  default '' not null,
    parametros_json            varchar(500) default '' not null,
    fechacreacion              datetime(3)             not null,
    usuariocreacion            varchar(25)  default '' not null,
    fechamodificacion          datetime(3)             null,
    usuariomodificacion        varchar(25)  default '' not null
)
    charset = utf8mb4;

create table if not exists productos_series
(
    productos_seriesid bigint auto_increment
        primary key,
    docingresoid       int         default 0  not null,
    origeningreso      varchar(15) default '' not null,
    productosid        bigint      default 0  not null,
    docegresoid        int         default 0  not null,
    origenegreso       varchar(15) default '' not null,
    snmotor            varchar(30) default '' not null,
    almacenesid        int         default 0  not null,
    snchasis           varchar(30) default '' not null,
    anio               varchar(20) default '' not null,
    color1             varchar(20) default '' not null,
    color2             varchar(30) default '' not null,
    ramv               varchar(20) default '' not null
)
    charset = utf8mb4;

create table if not exists productos_subcategoria
(
    productos_subcategoriasid int auto_increment
        primary key,
    descripcion               varchar(50)  default '' not null,
    imagen                    longblob                null,
    ecommerceid               int          default 0  not null,
    parametros_json           varchar(500) default '' not null,
    fechacreacion             datetime(3)             not null,
    usuariocreacion           varchar(25)  default '' not null,
    fechamodificacion         datetime(3)             null,
    usuariomodificacion       varchar(25)  default '' not null
)
    charset = utf8mb4;

create table if not exists productos_subgrupo
(
    productos_subgruposid int auto_increment
        primary key,
    descripcion           varchar(50)  default '' not null,
    imagen                longblob                null,
    ecommerceid           int          default 0  not null,
    parametros_json       varchar(500) default '' not null,
    fechacreacion         datetime(3)             not null,
    usuariocreacion       varchar(25)  default '' not null,
    fechamodificacion     datetime(3)             null,
    usuariomodificacion   varchar(25)  default '' not null
)
    charset = utf8mb4;

create table if not exists productos_variantes
(
    productos_variantesid bigint auto_increment
        primary key,
    productos_coloresid   int         default 0  not null,
    talla                 varchar(20) default '' not null
)
    charset = utf8mb4;

create table if not exists proveedores_cuentas
(
    proveedores_cuentasid int auto_increment
        primary key,
    clientes_bancosid     int         default 0  not null,
    proveedoresid         bigint      default 0  not null,
    tipo                  tinyint     default 1  not null,
    numero_cuenta         varchar(16) default '' null,
    principal             tinyint     default 0  not null,
    constraint proveedores_cuentas_ibfk_305
        foreign key (clientes_bancosid) references clientes_bancos (clientes_bancosid)
)
    charset = utf8mb4;

create table if not exists proveedores_grupos
(
    proveedores_gruposid bigint auto_increment
        primary key,
    descripcion          varchar(30) default '' not null,
    usuariocreacion      varchar(25) default '' not null,
    fechacreacion        datetime(3)            not null,
    usuariomodificacion  varchar(25) default '' not null,
    fechamodificacion    datetime(3)            null
)
    charset = utf8mb4;

create table if not exists proveedores
(
    proveedoresid             bigint auto_increment
        primary key,
    forma_pago_empresaid      int          default 0    not null,
    proveedores_gruposid      bigint       default 1    not null,
    codigocontable            varchar(30)  default ''   not null,
    tipoidentificacion        varchar(2)   default '0'  not null,
    identificacion            varchar(20)  default ''   not null,
    razonsocial               varchar(300) default ''   not null,
    nombrescomercial          varchar(120) default ''   not null,
    sustentotributario        varchar(2)   default '0'  not null,
    direccion                 varchar(300) default ''   not null,
    sri_rentaivabienes        bigint       default 0    not null,
    sri_rentaivaservicios     bigint       default 0    not null,
    email                     varchar(150) default ''   null,
    tipocompra                tinyint      default 1    not null,
    estado                    tinyint      default 1    not null,
    observaciones             varchar(150) default ''   not null,
    telefono1                 varchar(15)  default ''   not null,
    telefono2                 varchar(15)  default ''   not null,
    sri_residente             varchar(2)   default ''   not null,
    sri_paispago              varchar(5)   default ''   not null,
    sri_relacionado           tinyint      default 0    not null,
    sri_tipo_proveedor        varchar(2)   default '01' not null,
    sri_contribuyenteespecial tinyint      default 0    not null,
    sri_llevacontabilidad     tinyint      default 0    not null,
    sri_tiporegimen           tinyint      default 1    not null,
    usuariocreacion           varchar(25)  default ''   not null,
    fechacreacion             datetime(3)               not null,
    usuariomodificacion       varchar(25)  default '0'  not null,
    fechamodificacion         datetime(3)               null,
    constraint proveedores_ibfk_19
        foreign key (proveedores_gruposid) references proveedores_grupos (proveedores_gruposid),
    constraint proveedores_ibfk_6
        foreign key (codigocontable) references cuentas_contables (codigocontable),
    constraint proveedores_ibfk_7
        foreign key (forma_pago_empresaid) references forma_pago_empresa (forma_pago_empresaid)
)
    charset = utf8mb4;

create table if not exists compras_ordenes
(
    compras_ordenesid      bigint auto_increment
        primary key,
    compras_ordenes_codigo varchar(10)    default ''         not null,
    documentosid           bigint         default 0          not null,
    centros_costosid       int            default 1          not null,
    proveedoresid          bigint         default 0          not null,
    almacenesid            int            default 0          not null,
    emision                date                              not null,
    concepto               varchar(200)   default ''         not null,
    descuento              decimal(7, 2)  default 0.00       not null,
    subtotal               decimal(20, 8) default 0.00000000 not null,
    subtotalconiva         decimal(20, 8) default 0.00000000 not null,
    subtotalsiniva         decimal(20, 8) default 0.00000000 not null,
    total_iva              decimal(16, 4) default 0.0000     not null,
    total                  decimal(14, 2) default 0.00       not null,
    estado                 varchar(1)     default '0'        null,
    aprobada               tinyint        default 0          null,
    fechacreacion          datetime(3)                       not null,
    usuariocreacion        varchar(25)    default ''         not null,
    fechamodificacion      datetime(3)                       null,
    usuariomodificacion    varchar(25)    default ''         not null,
    constraint compras_ordenes_codigo
        unique (compras_ordenes_codigo),
    constraint compras_ordenes_ibfk_208
        foreign key (proveedoresid) references proveedores (proveedoresid),
    constraint compras_ordenes_ibfk_210
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint compras_ordenes_ibfk_213
        foreign key (almacenesid) references almacenes (almacenesid)
)
    charset = utf8mb4;

create table if not exists compras_recepciones
(
    compras_recepcionesid      bigint auto_increment
        primary key,
    compras_recepciones_codigo varchar(10)    default ''         not null,
    centros_costosid           int            default 1          not null,
    documentosid               bigint         default 0          not null,
    proveedoresid              bigint         default 0          not null,
    almacenesid                int            default 0          not null,
    movinventarios_tiposid     int            default 0          not null,
    emision                    date                              not null,
    concepto                   varchar(200)   default ''         not null,
    descuento                  decimal(7, 2)  default 0.00       not null,
    subtotal                   decimal(20, 8) default 0.00000000 not null,
    subtotalconiva             decimal(20, 8) default 0.00000000 not null,
    subtotalsiniva             decimal(20, 8) default 0.00000000 not null,
    total_iva                  decimal(16, 4) default 0.0000     not null,
    total                      decimal(14, 2) default 0.00       not null,
    estado                     varchar(1)     default '0'        not null,
    asientocontable            bigint         default 0          not null,
    fechacreacion              datetime(3)                       not null,
    usuariocreacion            varchar(25)    default ''         not null,
    fechamodificacion          datetime(3)                       null,
    usuariomodificacion        varchar(25)    default ''         not null,
    constraint compras_recepciones_codigo
        unique (compras_recepciones_codigo),
    constraint compras_recepciones_ibfk_209
        foreign key (proveedoresid) references proveedores (proveedoresid),
    constraint compras_recepciones_ibfk_211
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint compras_recepciones_ibfk_212
        foreign key (movinventarios_tiposid) references movinventarios_tipos (movinventarios_tiposid),
    constraint compras_recepciones_ibfk_214
        foreign key (almacenesid) references almacenes (almacenesid)
)
    charset = utf8mb4;

create table if not exists cuentasporpagar
(
    cuentasporpagarid     int auto_increment
        primary key,
    centros_costosid      int            default 0    not null,
    documentosid          bigint         default 0    not null,
    forma_pago_empresaid  int            default 0    not null,
    proveedoresid         bigint         default 0    not null,
    forma_pago_sri_codigo varchar(2)     default ''   not null,
    bancosid              int            default 0    not null,
    cajasid               int            default 0    not null,
    tipo                  varchar(2)     default ''   not null,
    secuencia             varchar(10)    default ''   null,
    origen                varchar(50)    default ''   not null,
    importe               decimal(14, 2) default 0.00 not null,
    emision               date                        not null,
    vence                 date                        not null,
    numerochequedeposito  varchar(15)    default ''   not null,
    pagosid               bigint         default 0    null,
    asientocontable       bigint         default 0    not null,
    relaciondocumentoid   bigint         default 0    not null,
    concepto              varchar(150)   default ''   not null,
    fechacreacion         datetime(3)                 null,
    usuariocreacion       varchar(25)    default '0'  null,
    fechamodificacion     datetime(3)                 null,
    usuariomodificacion   varchar(25)    default '0'  null,
    constraint cuentasporpagar_ibfk_76
        foreign key (proveedoresid) references proveedores (proveedoresid)
)
    charset = utf8mb4;

create table if not exists pagos
(
    pagosid                 bigint auto_increment
        primary key,
    pagoscodigo             varchar(10)    default ''   not null,
    proveedoresid           bigint         default 0    not null,
    forma_pago_empresaid    int            default 0    not null,
    centros_costosid        int            default 1    not null,
    fechaemision            date                        not null,
    cajasid                 int            default 0    not null,
    bancosid                int            default 0    not null,
    tipo                    varchar(2)     default ''   not null,
    fechavencimiento        date                        null,
    movimientos_conceptosid int            default 4    not null,
    importe                 decimal(14, 2) default 0.00 not null,
    anticipo                decimal(14, 2) default 0.00 null,
    concepto                varchar(150)   default ''   not null,
    asientocontable         bigint         default 0    not null,
    fechacreacion           datetime(3)                 not null,
    usuariomodificacion     varchar(25)    default ''   not null,
    fechamodificacion       datetime(3)                 null,
    usuariocreacion         varchar(25)    default ''   not null,
    constraint pagoscodigo
        unique (pagoscodigo),
    constraint pagos_ibfk_117
        foreign key (movimientos_conceptosid) references movimientos_conceptos (movimientos_conceptosid),
    constraint pagos_ibfk_303
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint pagos_ibfk_87
        foreign key (proveedoresid) references proveedores (proveedoresid),
    constraint pagos_ibfk_89
        foreign key (forma_pago_empresaid) references forma_pago_empresa (forma_pago_empresaid)
)
    charset = utf8mb4;

create table if not exists pagos_aprobaciones_detalles
(
    pagos_aprobaciones_detallesid bigint auto_increment
        primary key,
    pagos_aprobacionesid          bigint         default 0    not null,
    documentosid                  bigint         default 0    not null,
    secuencia                     varchar(10)    default ''   not null,
    emision                       date                        not null,
    vence                         date                        not null,
    proveedoresid                 bigint         default 0    not null,
    concepto                      varchar(150)   default ''   not null,
    importe                       decimal(14, 2) default 0.00 not null,
    saldo_registro                decimal(14, 2) default 0.00 not null,
    estado1                       tinyint        default 0    not null,
    estado2                       tinyint        default 0    null,
    estado3                       tinyint        default 0    not null,
    constraint pagos_aprobaciones_detalles_ibfk_312
        foreign key (pagos_aprobacionesid) references pagos_aprobaciones (pagos_aprobacionesid),
    constraint pagos_aprobaciones_detalles_ibfk_313
        foreign key (proveedoresid) references proveedores (proveedoresid)
)
    charset = utf8mb4;

create table if not exists pagos_detalles
(
    pagos_detallesid bigint auto_increment
        primary key,
    documentosid     bigint         default 0    not null,
    fechaemision     date                        not null,
    fechavencimiento date                        not null,
    secuencia        varchar(15)    default ''   not null,
    importe          decimal(14, 2) default 0.00 not null,
    saldo            decimal(14, 2) default 0.00 not null,
    pagosid          bigint         default 0    not null,
    constraint pagos_detalles_ibfk_83
        foreign key (pagosid) references pagos (pagosid)
)
    charset = utf8mb4;

create table if not exists proveedores_creditos
(
    proveedores_creditosid bigint auto_increment
        primary key,
    documentosid           bigint           default 0    not null,
    proveedoresid          bigint           default 0    not null,
    origen                 varchar(15)      default ''   not null,
    numerocuota            tinyint unsigned default 0    not null,
    fecha_vence            date                          not null,
    fecha_cobro            date                          null,
    valor_cuota            decimal(12, 2)   default 0.00 not null,
    abono_cuota            decimal(12, 2)   default 0.00 not null,
    abono_capital          decimal(12, 2)   default 0.00 not null,
    interes                decimal(12, 2)   default 0.00 not null,
    saldo_cuota            decimal(12, 2)   default 0.00 not null,
    saldo                  decimal(12, 2)   default 0.00 not null,
    constraint proveedores_creditos_ibfk_125
        foreign key (proveedoresid) references proveedores (proveedoresid)
)
    charset = utf8mb4;

create table if not exists proveedores_creditos_detalles
(
    proveedores_creditos_detallesid bigint auto_increment
        primary key,
    proveedores_creditosid          bigint         default 0    not null,
    pagosid                         bigint         default 0    not null,
    valor_abono                     decimal(12, 2) default 0.00 not null,
    constraint proveedores_creditos_detalles_ibfk_124
        foreign key (proveedores_creditosid) references proveedores_creditos (proveedores_creditosid)
)
    charset = utf8mb4;

create table if not exists provincias
(
    provinciasid varchar(2)  default '0' not null,
    provincia    varchar(40) default ''  not null,
    constraint provinciasid
        unique (provinciasid)
)
    charset = utf8mb4;

create table if not exists restaurante_pisos
(
    restaurante_pisosid int auto_increment
        primary key,
    descripcion         varchar(50) default '' not null,
    fechacreacion       datetime(3)            not null,
    usuariocreacion     varchar(25) default '' not null,
    fechamodificacion   datetime(3)            null,
    usuariomodificacion varchar(25) default '' not null
)
    charset = utf8mb4;

create table if not exists restaurante_mesas
(
    restaurante_mesasid int auto_increment
        primary key,
    restaurante_pisosid int              default 0  not null,
    descripcion         varchar(50)      default '' not null,
    estado              tinyint unsigned default 1  not null,
    fechacreacion       datetime(3)                 not null,
    usuariocreacion     varchar(25)      default '' not null,
    fechamodificacion   datetime(3)                 null,
    usuariomodificacion varchar(25)      default '' not null,
    constraint restaurante_mesas_ibfk_203
        foreign key (restaurante_pisosid) references restaurante_pisos (restaurante_pisosid)
)
    charset = utf8mb4;

create table if not exists rutas
(
    rutasid     int auto_increment
        primary key,
    descripcion varchar(30) default '' not null
)
    charset = utf8mb4;

create table if not exists clientes
(
    clientesid                   bigint auto_increment
        primary key,
    clientescodigo               varchar(10)      default ''    not null,
    codigocontable               varchar(30)      default ''    not null,
    clientes_gruposid            bigint           default 1     not null,
    provinciasid                 varchar(2)       default ''    not null,
    ciudadesid                   varchar(4)       default ''    not null,
    razonsocial                  varchar(300)     default ''    not null,
    parroquiasid                 varchar(6)       default ''    not null,
    clientes_rutasid             int              default 1     not null,
    clientes_zonasid             bigint           default 1     not null,
    nombrecomercial              varchar(300)     default ''    not null,
    direccion                    varchar(300)     default ''    not null,
    direccionreferencia          varchar(300)     default ''    not null,
    identificacion               varchar(20)      default ''    not null,
    tipoidentificacion           varchar(1)       default ''    not null,
    email                        varchar(300)     default ''    not null,
    telefono1                    varchar(15)      default ''    null,
    observacion                  varchar(300)     default ''    not null,
    telefono2                    varchar(15)      default ''    null,
    telefono3                    varchar(15)      default ''    null,
    tipodestino                  tinyint unsigned default 0     not null,
    vendedoresid                 int              default 3     not null,
    cobradoresid                 int              default 3     not null,
    sri_contribuyenteespecial    tinyint          default 0     not null,
    creditocupo                  decimal(12, 2)   default 0.00  not null,
    sri_tiporegimen              tinyint          default 0     not null,
    creditodias                  smallint         default 0     not null,
    descuento                    decimal(7, 2)    default 0.00  not null,
    sri_codigo_impuestosiva      varchar(5)       default ''    not null,
    sri_codigo_impuestosrenta    varchar(5)       default '312' not null,
    estado                       tinyint          default 0     not null,
    entidadbancaria              tinyint          default 0     not null,
    sri_relacionado              tinyint          default 0     not null,
    sri_tipo_cliente             tinyint unsigned default 1     not null,
    sri_llevacontabilidad        tinyint          default 0     not null,
    tarifasid                    bigint           default 1     not null,
    forma_pago_empresaid         int              default 0     not null,
    ordenvisita                  int unsigned     default 0     not null,
    latitud                      varchar(30)      default ''    not null,
    longitud                     varchar(30)      default ''    not null,
    conyugeidentificacion        varchar(20)      default ''    not null,
    conyugenombres               varchar(100)     default ''    not null,
    conyugedireccion             varchar(150)     default ''    not null,
    conyugetelefono              varchar(15)      default ''    not null,
    garanteidentificacion        varchar(20)      default ''    not null,
    garantenombres               varchar(100)     default ''    not null,
    garantedireccion             varchar(150)     default ''    not null,
    garantetelefono              varchar(15)      default ''    not null,
    garanteconyugeidentificacion varchar(20)      default ''    not null,
    garanteconyugenombres        varchar(100)     default ''    not null,
    garanteconyugedireccion      varchar(150)     default ''    not null,
    garanteconyugetelefono       varchar(15)      default ''    not null,
    ecommerceid                  int              default 0     not null,
    clave                        varchar(300)     default ''    not null,
    sexo                         varchar(1)       default 'M'   not null,
    estadocivil                  varchar(1)       default 'S'   not null,
    origeningresos               varchar(1)       default 'V'   not null,
    fechanacimiento              date                           null,
    email_login                  varchar(100)     default ''    not null,
    codigo_verificacion          varchar(100)     default ''    not null,
    estado_sync                  tinyint unsigned default 0     not null,
    usuariocreacion              varchar(25)      default ''    not null,
    fechacreacion                datetime(3)                    not null,
    usuariomodificacion          varchar(25)      default ''    not null,
    fechamodificacion            datetime(3)                    null,
    uuid                         varchar(36)      default ''    not null,
    constraint clientescodigo
        unique (clientescodigo),
    constraint clientes_ibfk_1
        foreign key (codigocontable) references cuentas_contables (codigocontable),
    constraint clientes_ibfk_10
        foreign key (ciudadesid) references ciudades (ciudadesid),
    constraint clientes_ibfk_198
        foreign key (clientes_rutasid) references rutas (rutasid),
    constraint clientes_ibfk_20
        foreign key (clientes_zonasid) references clientes_zonas (clientes_zonasid),
    constraint clientes_ibfk_35
        foreign key (clientes_gruposid) references clientes_grupos (clientes_gruposid),
    constraint clientes_ibfk_50
        foreign key (vendedoresid) references facturadores (facturadoresid),
    constraint clientes_ibfk_51
        foreign key (cobradoresid) references facturadores (facturadoresid),
    constraint clientes_ibfk_8
        foreign key (parroquiasid) references parroquias (parroquiasid),
    constraint clientes_ibfk_9
        foreign key (provinciasid) references provincias (provinciasid)
)
    charset = utf8mb4;

create table if not exists acumulativos
(
    acumulativosid        bigint auto_increment
        primary key,
    emision               date                                not null,
    acumulativos_codigo   varchar(10)      default ''         null,
    forma_pago_empresaid  int              default 1          not null,
    facturadoresid        int              default 1          not null,
    clientesid            bigint           default 1          not null,
    clientes_sucursalesid bigint           default 0          not null,
    almacenesid           int              default 1          not null,
    almacen_reservadosid  int              default 0          not null,
    centros_costosid      int              default 0          not null,
    vendedoresid          int              default 1          not null,
    tarifasid             bigint           default 1          not null,
    concepto              varchar(150)     default ''         not null,
    origen                varchar(15)      default ''         not null,
    documentosid          bigint           default 0          not null,
    observacion           varchar(1500)    default ''         not null,
    subtotal              decimal(20, 8)   default 0.00000000 not null,
    subtotalsiniva        decimal(20, 8)   default 0.00000000 not null,
    subtotalconiva        decimal(20, 8)   default 0.00000000 not null,
    total_descuento       decimal(20, 8)   default 0.00000000 not null,
    subtotalneto          decimal(20, 8)   default 0.00000000 not null,
    total_iva             decimal(16, 4)   default 0.0000     not null,
    total                 decimal(20, 8)   default 0.00000000 not null,
    estado                tinyint unsigned default 1          not null,
    estado_sync           tinyint unsigned default 0          not null,
    fechacreacion         datetime(3)                         not null,
    usuariocreacion       varchar(25)      default ''         not null,
    fechamodificacion     datetime(3)                         null,
    usuariomodificacion   varchar(25)      default ''         not null,
    constraint acumulativos_codigo
        unique (acumulativos_codigo),
    constraint acumulativos_ibfk_287
        foreign key (almacenesid) references almacenes (almacenesid),
    constraint acumulativos_ibfk_288
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint acumulativos_ibfk_289
        foreign key (facturadoresid) references facturadores (facturadoresid),
    constraint acumulativos_ibfk_290
        foreign key (vendedoresid) references facturadores (facturadoresid),
    constraint acumulativos_ibfk_291
        foreign key (clientesid) references clientes (clientesid),
    constraint acumulativos_ibfk_296
        foreign key (almacen_reservadosid) references almacenes (almacenesid)
)
    charset = utf8mb4;

create table if not exists alumnos
(
    alumnosid           bigint auto_increment
        primary key,
    clientesid          bigint           default 0    not null,
    tipoidentificacion  varchar(1)       default ''   not null,
    nombres             varchar(50)      default ''   not null,
    apellidos           varchar(50)      default ''   not null,
    identificacion      varchar(20)      default ''   not null,
    porcentaje_beca     tinyint unsigned default 0    not null,
    valor_colegiatura   decimal(14, 2)   default 0.00 not null,
    fechanacimiento     date                          not null,
    direccion           varchar(300)     default ''   not null,
    valor_matricula     decimal(14, 2)   default 0.00 not null,
    seccionesid         tinyint unsigned default 0    not null,
    alumnos_cursosid    bigint           default 0    not null,
    paraleloid          varchar(1)       default ''   not null,
    estado              tinyint          default 0    not null,
    usuariocreacion     varchar(25)      default ''   not null,
    fechacreacion       datetime(3)                   not null,
    usuariomodificacion varchar(25)      default ''   not null,
    fechamodificacion   datetime(3)                   null,
    constraint alumnos_ibfk_314
        foreign key (alumnos_cursosid) references alumnos_cursos (alumnos_cursosid),
    constraint alumnos_ibfk_315
        foreign key (clientesid) references clientes (clientesid)
)
    charset = utf8mb4;

create table if not exists clientes_contratos
(
    clientes_contratosid bigint auto_increment
        primary key,
    clientesid           bigint            default 0        not null,
    clientes_cuentasid   int               default 0        not null,
    tipoidentificacion   varchar(1)        default ''       not null,
    contrato_codigo      varchar(10)       default ''       not null,
    fechacontrato        date                               not null,
    tecnicosid           int               default 0        not null,
    fechainstalacion     date                               not null,
    estado               tinyint unsigned  default 0        not null,
    tarifa               decimal(14, 6)    default 0.000000 not null,
    clientes_zonasid     bigint            default 0        not null,
    clientes_rutasid     int               default 0        not null,
    latitud              varchar(30)       default ''       not null,
    longitud             varchar(30)       default ''       not null,
    tipocobro            tinyint           default 0        not null,
    tipo_vivienda        int               default 0        not null,
    direccion            varchar(300)      default ''       not null,
    referencia           varchar(150)      default ''       not null,
    productosid          bigint            default 0        not null,
    tipotarifa           int               default 0        not null,
    numeroposte          varchar(10)       default ''       not null,
    tipocomparticion     int               default 0        not null,
    velocidadsubida      smallint unsigned default 0        not null,
    velocidadbajada      smallint unsigned default 0        not null,
    fechacorte           date                               null,
    tipogeneracion       tinyint unsigned  default 1        not null,
    clientes_gruposid    bigint            default 1        not null,
    usuariocreacion      varchar(25)       default ''       not null,
    fechacreacion        datetime(3)                        not null,
    usuariomodificacion  varchar(25)       default ''       not null,
    fechamodificacion    datetime(3)                        null,
    observacion          varchar(300)      default ''       not null,
    puerto               varchar(5)        default ''       not null,
    constraint clientes_contratos_ibfk_197
        foreign key (clientesid) references clientes (clientesid),
    constraint clientes_contratos_ibfk_199
        foreign key (clientes_rutasid) references rutas (rutasid)
)
    charset = utf8mb4;

create table if not exists clientes_creditos
(
    clientes_creditosid bigint auto_increment
        primary key,
    documentosid        bigint           default 0    not null,
    clientesid          bigint           default 0    not null,
    origen              varchar(15)      default ''   not null,
    numerocuota         tinyint unsigned default 0    not null,
    fecha_vence         date                          not null,
    fecha_cobro         date                          null,
    valor_cuota         decimal(12, 2)   default 0.00 not null,
    abono_cuota         decimal(12, 2)   default 0.00 not null,
    abono_capital       decimal(12, 2)   default 0.00 not null,
    interes             decimal(12, 2)   default 0.00 not null,
    saldo_cuota         decimal(12, 2)   default 0.00 not null,
    saldo               decimal(12, 2)   default 0.00 not null,
    constraint clientes_creditos_ibfk_123
        foreign key (clientesid) references clientes (clientesid)
)
    charset = utf8mb4;

create table if not exists clientes_creditos_gestiones
(
    clientes_creditos_gestionesid bigint auto_increment
        primary key,
    clientesid                    bigint           default 0          not null,
    tipo_actual                   tinyint unsigned default 1          not null,
    tipo_proximo                  tinyint unsigned default 1          not null,
    estado                        tinyint unsigned default 1          not null,
    fecha_actual                  date                                not null,
    fecha_proxima                 date                                not null,
    hora_inicio                   time             default '00:00:00' null,
    hora_finaliza                 time             default '00:00:00' null,
    observacio                    varchar(300)     default ''         not null,
    usuariocreacion               varchar(25)      default ''         not null,
    fechacreacion                 datetime(3)                         not null,
    usuariomodificacion           varchar(25)      default ''         not null,
    fechamodificacion             datetime(3)                         null,
    constraint clientes_creditos_gestiones_ibfk_235
        foreign key (clientesid) references clientes (clientesid)
)
    charset = utf8mb4;

create table if not exists clientes_imagenes
(
    clientes_imagenesid bigint auto_increment
        primary key,
    clientesid          bigint  default 0 not null,
    principal           tinyint default 0 not null,
    imagen              longblob          null,
    constraint clientes_imagenes_ibfk_238
        foreign key (clientesid) references clientes (clientesid)
)
    charset = utf8mb4;

create table if not exists clientes_sucursales
(
    clientes_sucursalesid bigint auto_increment
        primary key,
    clientesid            bigint           default 0   not null,
    ciudadesid            varchar(4)       default '0' not null,
    descripcion           varchar(50)      default ''  not null,
    direccion             varchar(100)     default ''  not null,
    telefono1             varchar(15)      default ''  not null,
    telefono2             varchar(15)      default ''  not null,
    principal             tinyint          default 0   not null,
    estado                tinyint unsigned default 1   not null,
    fechacreacion         datetime(3)                  not null,
    usuariocreacion       varchar(25)      default ''  not null,
    fechamodificacion     datetime(3)                  null,
    usuariomodificacion   varchar(25)      default ''  not null,
    constraint clientes_sucursales_ibfk_47
        foreign key (clientesid) references clientes (clientesid),
    constraint clientes_sucursales_ibfk_48
        foreign key (ciudadesid) references ciudades (ciudadesid)
)
    charset = utf8mb4;

create table if not exists clientes_vehiculos
(
    clientes_vehiculosid bigint auto_increment
        primary key,
    clientesid           bigint           default 0     not null,
    descripcion          varchar(50)      default ''    null,
    estado               tinyint          default 1     not null,
    matricula            varchar(30)      default ''    not null,
    marca                varchar(25)      default ''    not null,
    modelo               varchar(25)      default ''    not null,
    chasis               varchar(30)      default ''    not null,
    motor                varchar(30)      default ''    not null,
    cilindraje           decimal(7, 3)    default 0.000 not null,
    color1               varchar(20)      default ''    null,
    color2               varchar(20)      default ''    null,
    tipo_combustible     tinyint unsigned default 1     not null,
    kilometraje          decimal          default 0     not null,
    potencia             decimal          default 0     not null,
    torque               decimal          default 0     not null,
    anio_fabricacion     varchar(4)       default ''    null,
    ultima_revision      date                           null,
    proxima_revision     date                           null,
    observaciones        varchar(150)     default ''    not null,
    usuariocreacion      varchar(25)      default ''    not null,
    fechacreacion        datetime(3)                    not null,
    usuariomodificacion  varchar(25)      default ''    not null,
    fechamodificacion    datetime(3)                    null,
    tipo_vehiculo        tinyint unsigned default 1     not null,
    constraint clientes_vehiculos_ibfk_204
        foreign key (clientesid) references clientes (clientesid)
)
    charset = utf8mb4;

create table if not exists clientes_visitas
(
    clientes_visitasid bigint auto_increment
        primary key,
    documentosid       bigint           default 0          not null,
    clientesid         bigint           default 0          not null,
    vendedoresid       int              default 0          not null,
    fechahora          datetime(3)                         not null,
    hora_inicio        time             default '00:00:00' not null,
    hora_finaliza      time             default '00:00:00' not null,
    motivovisita       tinyint unsigned default 1          not null,
    estado             tinyint          default 0          not null,
    contacto           varchar(30)      default ''         not null,
    observacion        varchar(300)     default ''         not null,
    tipovisita         tinyint unsigned default 1          not null,
    latitud            varchar(30)      default ''         not null,
    longitud           varchar(30)      default ''         not null,
    constraint clientes_visitas_ibfk_193
        foreign key (clientesid) references clientes (clientesid),
    constraint clientes_visitas_ibfk_194
        foreign key (vendedoresid) references facturadores (facturadoresid)
)
    charset = utf8mb4;

create table if not exists cobros
(
    cobrosid                 bigint auto_increment
        primary key,
    cobroscodigo             varchar(10)      default ''   not null,
    clientesid               bigint           default 0    not null,
    forma_pago_empresaid     int              default 0    not null,
    centros_costosid         int              default 1    not null,
    cajasid                  int              default 0    not null,
    fechaemision             date                          not null,
    bancosid                 int              default 0    not null,
    fecharecepcion           date                          not null,
    fechavencimiento         date                          not null,
    asientocontable          bigint           default 0    not null,
    cobradoresid             int              default 0    not null,
    tipo                     varchar(2)       default ''   not null,
    movimientos_conceptosid  int              default 3    not null,
    importe                  decimal(14, 2)   default 0.00 null,
    anticipo                 decimal(14, 2)   default 0.00 null,
    concepto                 varchar(150)     default ''   null,
    uuid                     varchar(36)      default ''   not null,
    estado_sync              tinyint unsigned default 0    not null,
    usuariocreacion          varchar(25)      default ''   not null,
    fechacreacion            datetime(3)                   not null,
    usuariomodificacion      varchar(25)      default ''   not null,
    fechamodificacion        datetime(3)                   null,
    interes                  decimal(14, 2)   default 0.00 not null,
    relacionado_documentosid int              default 0    not null,
    tipo_credito             int              default 0    not null,
    origen                   varchar(15)      default ''   null,
    constraint cobroscodigo
        unique (cobroscodigo),
    constraint cobros_ibfk_107
        foreign key (movimientos_conceptosid) references movimientos_conceptos (movimientos_conceptosid),
    constraint cobros_ibfk_302
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint cobros_ibfk_85
        foreign key (clientesid) references clientes (clientesid),
    constraint cobros_ibfk_86
        foreign key (cobradoresid) references facturadores (facturadoresid),
    constraint cobros_ibfk_88
        foreign key (forma_pago_empresaid) references forma_pago_empresa (forma_pago_empresaid)
)
    charset = utf8mb4;

create table if not exists clientes_creditos_detalles
(
    clientes_creditos_detallesid bigint auto_increment
        primary key,
    clientes_creditosid          bigint         default 0    not null,
    cobrosid                     bigint         default 0    not null,
    valor_abono                  decimal(12, 2) default 0.00 not null,
    constraint clientes_creditos_detalles_ibfk_120
        foreign key (clientes_creditosid) references clientes_creditos (clientes_creditosid),
    constraint clientes_creditos_detalles_ibfk_121
        foreign key (cobrosid) references cobros (cobrosid)
)
    charset = utf8mb4;

create table if not exists cobros_detalles
(
    cobros_detallesid bigint auto_increment
        primary key,
    importe           decimal(14, 2)   default 0.00 not null,
    capital           decimal(14, 2)   default 0.00 not null,
    documentosid      bigint           default 0    not null,
    interes           decimal(14, 2)   default 0.00 not null,
    saldo             decimal(14, 2)   default 0.00 not null,
    fechaemision      date                          not null,
    fecharecepcion    date                          not null,
    fechavence        date                          not null,
    secuencia         varchar(15)      default ''   not null,
    concepto          varchar(150)     default ''   not null,
    cobrosid          bigint           default 0    not null,
    tipo              tinyint unsigned default 0    not null,
    constraint cobros_detalles_ibfk_84
        foreign key (cobrosid) references cobros (cobrosid)
)
    charset = utf8mb4;

create table if not exists cuentasporcobrar
(
    cuentasporcobrarid    bigint auto_increment
        primary key,
    clientesid            bigint           default 0    not null,
    clientes_contratosid  bigint           default 0    not null,
    documentosid          bigint           default 0    not null,
    forma_pago_empresaid  int              default 1    not null,
    forma_pago_sri_codigo varchar(2)       default '01' not null,
    cajasid               int              default 1    not null,
    bancosid              int              default 0    not null,
    tipo                  varchar(2)       default ''   not null,
    importe               decimal(14, 2)   default 0.00 not null,
    numerochequedeposito  varchar(20)      default ''   not null,
    centros_costosid      int              default 0    null,
    origen                varchar(15)      default ''   not null,
    emision               date                          not null,
    recepcion             date                          not null,
    vence                 date                          not null,
    vendedoresid          int              default 0    not null,
    cobrosid              bigint           default 0    null,
    cobradoresid          int              default 0    not null,
    relaciondocumentoid   bigint           default 0    null,
    secuencial            varchar(15)      default ''   not null,
    capital               decimal(14, 2)   default 0.00 not null,
    interes               decimal(14, 2)   default 0.00 not null,
    concepto              varchar(150)     default ''   not null,
    asientocontable       bigint           default 0    null,
    reciboindividual      varchar(10)      default ''   not null,
    reciboagrupado        varchar(10)      default ''   not null,
    estado                tinyint unsigned default 0    not null,
    usuariocreacion       varchar(25)      default '0'  null,
    fechacreacion         datetime(3)                   null,
    usuariomodificacion   varchar(25)      default '0'  null,
    fechamodificacion     datetime(3)                   null,
    constraint cuentasporcobrar_ibfk_75
        foreign key (clientesid) references clientes (clientesid)
)
    charset = utf8mb4;

create table if not exists entregas
(
    entregasid                     bigint auto_increment
        primary key,
    sucursalesid                   bigint           default 0          null,
    sucursales_destinosid          bigint           default 0          not null,
    emision                        date                                not null,
    entregas_codigo                varchar(10)      default ''         not null,
    forma_pago_empresaid           int              default 1          not null,
    facturadoresid                 int              default 1          not null,
    clientesid                     bigint           default 1          not null,
    clientes_sucursalesid          bigint           default 0          not null,
    almacenesid                    int              default 1          not null,
    centros_costosid               int              default 0          not null,
    vendedoresid                   int              default 1          not null,
    tarifasid                      bigint           default 1          not null,
    concepto                       varchar(150)     default ''         not null,
    origen                         varchar(15)      default ''         not null,
    documentosid                   bigint           default 0          not null,
    observacion                    varchar(1500)    default ''         not null,
    subtotal                       decimal(20, 8)   default 0.00000000 not null,
    subtotalsiniva                 decimal(20, 8)   default 0.00000000 not null,
    subtotalconiva                 decimal(20, 8)   default 0.00000000 not null,
    total_descuento                decimal(20, 8)   default 0.00000000 not null,
    subtotalneto                   decimal(20, 8)   default 0.00000000 not null,
    total_iva                      decimal(16, 4)   default 0.0000     not null,
    total                          decimal(20, 8)   default 0.00000000 not null,
    asientocontable                bigint           default 0          not null,
    receptor_clientesid            bigint           default 0          not null,
    receptor_clientes_sucursalesid bigint           default 0          not null,
    relaciondocumentoid            bigint           default 0          not null,
    estado_sync                    tinyint unsigned default 0          not null,
    fechacreacion                  datetime(3)                         not null,
    usuariocreacion                varchar(25)      default ''         not null,
    fechamodificacion              datetime(3)                         null,
    usuariomodificacion            varchar(25)      default ''         not null,
    estado                         tinyint unsigned default 0          not null,
    constraint entregas_codigo
        unique (entregas_codigo),
    constraint entregas_ibfk_151
        foreign key (almacenesid) references almacenes (almacenesid),
    constraint entregas_ibfk_157
        foreign key (clientesid) references clientes (clientesid),
    constraint entregas_ibfk_159
        foreign key (facturadoresid) references facturadores (facturadoresid),
    constraint entregas_ibfk_160
        foreign key (vendedoresid) references facturadores (facturadoresid),
    constraint entregas_ibfk_163
        foreign key (centros_costosid) references centros_costos (centros_costosid)
)
    charset = utf8mb4;

create table if not exists entregas_detalles
(
    entregas_detallesid bigint auto_increment
        primary key,
    entregasid          bigint         default 0          not null,
    centros_costosid    int            default 0          not null,
    productosid         bigint         default 0          not null,
    medidasid           int            default 0          not null,
    almacenesid         int            default 0          not null,
    cantidaddigitada    decimal(14, 2) default 0.00       not null,
    cantidad            decimal(20, 8) default 0.00000000 not null,
    cantidadfactor      decimal(20, 8) default 0.00000000 not null,
    peso                decimal(12, 2) default 0.00       not null,
    precio              decimal(20, 8) default 0.00000000 not null,
    iva                 int            default 0          not null,
    precioiva           decimal(20, 8) default 0.00000000 not null,
    preciovisible       decimal(20, 8) default 0.00000000 not null,
    descuento           decimal(13, 8) default 0.00000000 not null,
    informacion         varchar(1500)  default ''         not null,
    informaciondetalle  varchar(300)   default ''         not null,
    costo               decimal(20, 8) default 0.00000000 not null,
    detalle_relacionid  bigint         default 0          not null,
    constraint entregas_detalles_ibfk_149
        foreign key (entregasid) references entregas (entregasid),
    constraint entregas_detalles_ibfk_153
        foreign key (almacenesid) references almacenes (almacenesid),
    constraint entregas_detalles_ibfk_155
        foreign key (medidasid) references medidas (medidasid),
    constraint entregas_detalles_ibfk_165
        foreign key (centros_costosid) references centros_costos (centros_costosid)
)
    charset = utf8mb4;

create table if not exists ordenes
(
    ordenesid            bigint auto_increment
        primary key,
    ordenes_codigo       varchar(10)      default ''   not null,
    clientesid           bigint           default 0    not null,
    clientes_contratosid bigint           default 0    not null,
    emision              datetime(3)                   not null,
    finalizacion         datetime(3)                   not null,
    tecnicosid           int              default 0    not null,
    tipo_orden           tinyint unsigned default 0    not null,
    tipo_corte           tinyint unsigned default 0    not null,
    estado               tinyint unsigned default 0    not null,
    direccionnueva       varchar(300)     default ''   not null,
    motivo               varchar(200)     default ''   not null,
    observacioncliente   varchar(300)     default ''   not null,
    observaciontecnico   varchar(300)     default ''   not null,
    total                decimal(14, 2)   default 0.00 not null,
    origen               varchar(15)      default ''   not null,
    documentosid         bigint           default 0    not null,
    usuariocreacion      varchar(25)      default ''   not null,
    fechacreacion        datetime(3)                   not null,
    usuariomodificacion  varchar(25)      default ''   not null,
    fechamodificacion    datetime(3)                   null,
    constraint ordenes_codigo
        unique (ordenes_codigo),
    constraint ordenes_ibfk_201
        foreign key (clientesid) references clientes (clientesid),
    constraint ordenes_ibfk_202
        foreign key (tecnicosid) references facturadores (facturadoresid)
)
    charset = utf8mb4;

create table if not exists ordenes_detalles
(
    ordenes_detallesid bigint auto_increment
        primary key,
    productosid        bigint         default 0          not null,
    cantidad           decimal(14, 2) default 0.00       not null,
    precio             decimal(20, 8) default 0.00000000 not null,
    precioiva          decimal(20, 8) default 0.00000000 not null,
    ordenesid          bigint         default 0          not null,
    constraint ordenes_detalles_ibfk_200
        foreign key (ordenesid) references ordenes (ordenesid)
)
    charset = utf8mb4;

create table if not exists parametros_empresa
(
    parametros_empresaid                   int auto_increment
        primary key,
    dbdatos                                varchar(30)       default ''                          not null,
    almacenesid                            int               default 1                           null,
    tipoidentificacion                     varchar(1)        default ''                          not null,
    identificacion                         varchar(20)       default ''                          not null,
    razonsocial                            varchar(300)      default ''                          not null,
    nombrecomercial                        varchar(300)      default ''                          not null,
    direccion                              varchar(150)      default ''                          not null,
    clientesid                             bigint            default 1                           not null,
    tipoidentificacionreprecentantelegal   varchar(1)        default ''                          not null,
    identificacionreprecentantelegal       varchar(13)       default ''                          null,
    nombrereprecentantelegal               varchar(50)       default ''                          null,
    tipoidentificacioncontador             varchar(1)        default ''                          not null,
    identificacioncontador                 varchar(13)       default ''                          null,
    nombrecontador                         varchar(50)       default ''                          null,
    telefono1                              varchar(15)       default ''                          null,
    telefono2                              varchar(15)       default ''                          null,
    telefono3                              varchar(15)       default ''                          null,
    email                                  varchar(300)      default ''                          not null,
    logo                                   longblob                                              null,
    provinciasid                           varchar(2)        default ''                          not null,
    tiporegimen                            tinyint unsigned  default 1                           not null,
    ciudadesid                             varchar(4)        default ''                          not null,
    parroquiasid                           varchar(6)        default ''                          not null,
    codigocontable_clientes                varchar(30)       default ''                          not null,
    codigocontable_proveedores             varchar(30)       default ''                          not null,
    codigocontable_cajas                   varchar(30)       default ''                          not null,
    codigocontable_bancos                  varchar(30)       default ''                          not null,
    codigocontable_inventarioconiva        varchar(30)       default ''                          not null,
    codigocontable_inventariosiniva        varchar(30)       default ''                          not null,
    codigocontable_costoconiva             varchar(30)       default ''                          not null,
    codigocontable_costosiniva             varchar(30)       default ''                          not null,
    codigocontable_ventaconiva             varchar(30)       default ''                          not null,
    codigocontable_ventasiniva             varchar(30)       default ''                          not null,
    codigocontable_ivaventas               varchar(30)       default ''                          not null,
    codigocontable_iceventas               varchar(30)       default ''                          not null,
    codigocontable_ventaspropina           varchar(30)       default ''                          not null,
    codigocontable_ivacompras              varchar(30)       default ''                          not null,
    codigocontable_interes                 varchar(30)       default ''                          null,
    parametros_json                        varchar(2000)     default '0'                         null,
    sri_codigo_impuestos                   varchar(6)        default ''                          not null,
    preciomayorcosto                       tinyint           default 1                           not null,
    productosconexistencia                 tinyint           default 0                           not null,
    tipocalculoutilidad                    tinyint           default 1                           not null,
    fdv_precio                             tinyint unsigned  default 6                           not null,
    fdv_precioconiva                       tinyint unsigned  default 2                           not null,
    fdv_iva                                tinyint unsigned  default 2                           not null,
    fdv_subtotales                         tinyint unsigned  default 4                           not null,
    fdv_totales                            tinyint unsigned  default 2                           not null,
    fdc_costos                             tinyint unsigned  default 6                           not null,
    fdc_subtotales                         tinyint unsigned  default 4                           not null,
    fdc_totales                            tinyint unsigned  default 2                           not null,
    fd_cantidades                          tinyint unsigned  default 1                           not null,
    de_tipoautorizacion                    tinyint unsigned  default 1                           not null,
    de_ambiente                            tinyint unsigned  default 1                           not null,
    de_intentosenvio                       tinyint unsigned  default 4                           not null,
    de_diasretrazoautorizar                tinyint unsigned  default 0                           not null,
    de_repiteintervalo                     smallint unsigned default 30                          not null,
    de_repitetipo                          tinyint unsigned  default 1                           not null,
    de_duraciontipo                        tinyint unsigned  default 8                           not null,
    de_duracionintervalo                   smallint unsigned default 30                          not null,
    de_autoriza_horaInicio                 varchar(8)        default '080000'                    not null,
    de_autorizaprogramado                  tinyint           default 0                           not null,
    de_contriespecial                      varchar(10)       default ''                          not null,
    de_caducacer                           date                                                  null,
    de_llevacontabilidad                   tinyint unsigned  default 1                           not null,
    de_sql_factura                         longtext                                              null,
    de_sql_retencion                       longtext                                              null,
    de_sql_notacredito                     longtext                                              null,
    de_sql_notadebito                      longtext                                              null,
    de_sql_guiaremision                    longtext                                              null,
    de_sql_liquidacioncompra               longtext                                              null,
    de_certificadodigital                  longblob                                              null,
    de_clavecertificado                    varchar(100)      default ''                          not null,
    de_fechacertificado                    date                                                  null,
    de_correo_predeterminado               varchar(150)      default ''                          not null,
    de_informacion                         varchar(800)      default ''                          not null,
    smtp_tipo                              tinyint unsigned  default 0                           not null,
    smtp_servidor                          varchar(75)       default ''                          not null,
    smtp_usuario                           varchar(75)       default ''                          not null,
    smtp_from                              varchar(75)       default ''                          not null,
    smtp_clave                             varchar(60)       default ''                          not null,
    smtp_puerto                            varchar(10)       default ''                          null,
    smtp_token                             varchar(1500)     default '{}'                        not null,
    mntoclienes                            tinyint unsigned  default 1                           not null,
    cont_anulaelimina                      tinyint unsigned  default 1                           not null,
    clientestarifasid                      bigint unsigned   default 1                           not null,
    costocalculoprecio                     tinyint unsigned  default 1                           not null,
    productostablasbusqueda                varchar(300)      default ''                          not null,
    productoscamposmostrar                 varchar(300)      default ''                          not null,
    productoscamposbuscar                  varchar(200)      default ''                          not null,
    productoscabecera                      varchar(200)      default ''                          not null,
    productoscamposprecios                 varchar(2000)     default ''                          not null,
    productoscabeceraprecios               varchar(200)      default ''                          not null,
    productosresolucionimagenes            tinyint unsigned  default 1                           not null,
    transferenciaingresoautomatico         tinyint           default 1                           not null,
    salidassinexistencias                  tinyint           default 1                           not null,
    busquedaconexistencias                 tinyint           default 0                           not null,
    productostipoprecio                    tinyint           default 1                           not null,
    tpvobligaapertura                      tinyint           default 1                           not null,
    tpvsumacantidad                        tinyint           default 1                           not null,
    tpvguardaclave                         tinyint           default 1                           not null,
    facsumacantidad                        tinyint           default 1                           not null,
    facguardaclave                         tinyint           default 0                           not null,
    factipodescuento                       tinyint unsigned  default 1                           not null,
    facversecuencia                        tinyint           default 0                           not null,
    facobligaapertura                      tinyint           default 0                           not null,
    productospreciobultoid                 bigint            default 1                           not null,
    productosmultiplespreciosbultos        tinyint           default 0                           not null,
    productosbusquedaavanzada              tinyint           default 0                           not null,
    cont_regitracentrocostos               tinyint           default 0                           not null,
    codigocontable_compras_ivapresuntivo   varchar(30)       default ''                          not null,
    codigocontable_compras_rentapresuntivo varchar(30)       default ''                          not null,
    codigocontable_compras_ice             varchar(30)       default ''                          not null,
    codigocontable_compras_asumerenta      varchar(30)       default ''                          not null,
    de_autoriza_facturas                   tinyint           default 1                           not null,
    de_autoriza_notascredito               tinyint           default 1                           not null,
    de_autoriza_notasdebito                tinyint           default 0                           not null,
    de_autoriza_retenciones                tinyint           default 0                           not null,
    de_autoriza_guias                      tinyint           default 0                           not null,
    de_factura_sql_editado                 tinyint           default 0                           not null,
    de_tiposql_factura                     tinyint unsigned  default 1                           not null,
    de_url_documentos                      varchar(50)       default 'https://perseo.solutions/' not null,
    tipopresentacionprecios                tinyint unsigned  default 1                           not null,
    codigocontable_cobros_anticipos        varchar(30)       default ''                          not null,
    codigocontable_pagos_anticipos         varchar(30)       default ''                          not null,
    cont_automatico_compras                tinyint unsigned  default 1                           not null,
    cont_automatico_ventas                 tinyint unsigned  default 1                           not null,
    cont_automatico_cobros                 tinyint unsigned  default 1                           not null,
    cont_automatico_pagos                  tinyint unsigned  default 1                           not null,
    cont_automatico_ingresos               tinyint unsigned  default 1                           not null,
    cont_automatico_salidas                tinyint unsigned  default 1                           not null,
    cont_automatico_caja                   tinyint unsigned  default 1                           not null,
    cont_automatico_bancos                 tinyint unsigned  default 1                           not null,
    cont_automatico_depositos              tinyint unsigned  default 1                           not null,
    codigocontable_cobros_ncinterna        varchar(30)       default ''                          not null,
    codigocontable_cobros_ndinterna        varchar(30)       default ''                          not null,
    codigocontable_pagos_ncinterna         varchar(30)       default ''                          not null,
    codigocontable_pagos_ndinterna         varchar(30)       default ''                          not null,
    codigocontable_depositos_comision      varchar(30)       default ''                          not null,
    prosumacantidad                        tinyint           default 1                           not null,
    proguardaclave                         tinyint           default 0                           not null,
    entsumacantidad                        tinyint           default 1                           not null,
    entguardaclave                         tinyint           default 0                           not null,
    comsumacantidad                        tinyint           default 0                           not null,
    codigocontable_caja_transito           varchar(30)       default ''                          not null,
    codigocontable_cobros_retencion        varchar(30)       default ''                          not null,
    codigocontable_banco_transito          varchar(30)       default ''                          not null,
    codigocontable_recepcion               varchar(30)       default ''                          not null,
    codigocontable_inventario_entregar     varchar(30)       default ''                          not null,
    preciodinamico                         tinyint           default 0                           not null,
    rutalogo                               varchar(300)      default ''                          not null,
    sri_tipos_ivas_codigo                  varchar(1)        default '2'                         not null,
    facobligacupo                          tinyint           default 0                           not null,
    tpvobligacupo                          tinyint           default 0                           not null,
    producciontipocosto                    tinyint unsigned  default 1                           not null,
    nomina_tipo_contabilidad               tinyint unsigned  default 1                           not null,
    nomina_sueldo_basico                   decimal(14, 2)    default 0.00                        not null,
    permitiranticipos                      tinyint           default 0                           not null,
    llevacontabilidad                      tinyint           default 1                           not null,
    realizaats                             tinyint           default 1                           not null,
    dinardap_codigo                        varchar(7)        default ''                          not null,
    ingresos_duplicaproductos              tinyint           default 0                           not null,
    salidas_duplicaproductos               tinyint           default 0                           not null,
    faccontrolamesas                       tinyint           default 0                           not null,
    faccontrolacocina                      tinyint           default 0                           not null,
    clientes_tipo_codigo                   tinyint unsigned  default 2                           not null,
    agentederetencion                      tinyint unsigned  default 0                           not null,
    cobros_notificacion                    tinyint           default 1                           not null,
    pagos_notificacion                     tinyint           default 0                           not null,
    factotalessindescuento                 tinyint           default 0                           not null,
    comp_precio_lotes                      tinyint           default 1                           not null,
    fac_precio_cliente                     tinyint           default 1                           not null,
    fdc_iva                                tinyint unsigned  default 4                           not null,
    usuariocreacion                        varchar(25)       default ''                          not null,
    fechacreacion                          datetime(3)                                           not null,
    usuariomodificacion                    varchar(25)       default ''                          not null,
    fechamodificacion                      datetime(3)                                           null,
    constraint dbdatos
        unique (dbdatos),
    constraint parametros_empresa_ibfk_258
        foreign key (codigocontable_clientes) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_259
        foreign key (codigocontable_proveedores) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_260
        foreign key (codigocontable_cajas) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_261
        foreign key (codigocontable_bancos) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_262
        foreign key (codigocontable_inventarioconiva) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_263
        foreign key (codigocontable_inventariosiniva) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_264
        foreign key (codigocontable_costoconiva) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_265
        foreign key (codigocontable_costosiniva) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_266
        foreign key (codigocontable_ventaconiva) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_267
        foreign key (codigocontable_ventasiniva) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_268
        foreign key (codigocontable_ivaventas) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_269
        foreign key (codigocontable_ivacompras) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_270
        foreign key (codigocontable_compras_ivapresuntivo) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_271
        foreign key (codigocontable_compras_rentapresuntivo) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_272
        foreign key (codigocontable_compras_ice) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_273
        foreign key (codigocontable_compras_asumerenta) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_274
        foreign key (codigocontable_cobros_anticipos) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_275
        foreign key (codigocontable_pagos_anticipos) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_276
        foreign key (codigocontable_cobros_ncinterna) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_277
        foreign key (codigocontable_cobros_ndinterna) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_278
        foreign key (codigocontable_cobros_retencion) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_279
        foreign key (codigocontable_pagos_ncinterna) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_280
        foreign key (codigocontable_pagos_ndinterna) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_281
        foreign key (codigocontable_caja_transito) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_282
        foreign key (codigocontable_banco_transito) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_283
        foreign key (codigocontable_depositos_comision) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_284
        foreign key (codigocontable_recepcion) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_285
        foreign key (codigocontable_iceventas) references cuentas_contables (codigocontable),
    constraint parametros_empresa_ibfk_31
        foreign key (almacenesid) references almacenes (almacenesid),
    constraint parametros_empresa_ibfk_36
        foreign key (clientesid) references clientes (clientesid)
)
    charset = utf8mb4;

create table if not exists pedidos
(
    pedidosid             bigint auto_increment
        primary key,
    emision               date                                not null,
    pedidos_codigo        varchar(10)      default ''         null,
    forma_pago_empresaid  int              default 1          not null,
    facturadoresid        int              default 1          not null,
    clientesid            bigint           default 1          not null,
    clientes_sucursalesid bigint           default 0          not null,
    almacenesid           int              default 1          not null,
    centros_costosid      int              default 0          not null,
    vendedoresid          int              default 1          not null,
    tarifasid             bigint           default 1          not null,
    concepto              varchar(150)     default ''         not null,
    origen                varchar(15)      default ''         not null,
    documentosid          bigint           default 0          not null,
    observacion           varchar(1500)    default ''         not null,
    subtotal              decimal(20, 8)   default 0.00000000 not null,
    subtotalsiniva        decimal(20, 8)   default 0.00000000 not null,
    subtotalconiva        decimal(20, 8)   default 0.00000000 not null,
    total_descuento       decimal(20, 8)   default 0.00000000 not null,
    subtotalneto          decimal(20, 8)   default 0.00000000 not null,
    total_iva             decimal(16, 4)   default 0.0000     not null,
    total                 decimal(20, 8)   default 0.00000000 not null,
    ecommerceid           int              default 0          not null,
    restaurante_mesasid   int              default 0          not null,
    estado                tinyint unsigned default 1          not null,
    uuid                  varchar(36)      default ''         not null,
    estado_sync           tinyint unsigned default 0          not null,
    fechacreacion         datetime(3)                         not null,
    usuariocreacion       varchar(25)      default ''         not null,
    fechamodificacion     datetime(3)                         null,
    usuariomodificacion   varchar(25)      default ''         not null,
    constraint pedidos_codigo
        unique (pedidos_codigo),
    constraint pedidos_ibfk_181
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint pedidos_ibfk_182
        foreign key (almacenesid) references almacenes (almacenesid),
    constraint pedidos_ibfk_184
        foreign key (facturadoresid) references facturadores (facturadoresid),
    constraint pedidos_ibfk_185
        foreign key (vendedoresid) references facturadores (facturadoresid),
    constraint pedidos_ibfk_186
        foreign key (clientesid) references clientes (clientesid)
)
    charset = utf8mb4;

create table if not exists proformas
(
    proformasid          bigint auto_increment
        primary key,
    emision              date                                               not null,
    proformas_codigo     varchar(10)                     default ''         null,
    forma_pago_empresaid int                             default 1          not null,
    facturadoresid       int                             default 1          not null,
    clientesid           bigint                          default 1          not null,
    almacenesid          int                             default 1          not null,
    centros_costosid     int                             default 0          not null,
    vendedoresid         int                             default 1          not null,
    tarifasid            bigint                          default 1          not null,
    concepto             varchar(150)                    default ''         not null,
    origen               varchar(15)                     default ''         not null,
    documentosid         bigint                          default 0          not null,
    observacion          varchar(1500)                   default ''         not null,
    subtotal             decimal(20, 8)                  default 0.00000000 not null,
    subtotalsiniva       decimal(20, 8)                  default 0.00000000 not null,
    subtotalconiva       decimal(20, 8)                  default 0.00000000 not null,
    total_descuento      decimal(20, 8)                  default 0.00000000 not null,
    subtotalneto         decimal(20, 8)                  default 0.00000000 not null,
    total_iva            decimal(16, 4)                  default 0.0000     not null,
    total                decimal(20, 8)                  default 0.00000000 not null,
    uuid                 varchar(36) collate utf8mb4_bin default ''         not null,
    estado_sync          tinyint unsigned                default 0          not null,
    fechacreacion        datetime(3)                                        not null,
    usuariocreacion      varchar(25)                     default ''         not null,
    fechamodificacion    datetime(3)                                        null,
    usuariomodificacion  varchar(25)                     default ''         not null,
    constraint proformas_codigo
        unique (proformas_codigo),
    constraint proformas_ibfk_152
        foreign key (almacenesid) references almacenes (almacenesid),
    constraint proformas_ibfk_158
        foreign key (clientesid) references clientes (clientesid),
    constraint proformas_ibfk_161
        foreign key (facturadoresid) references facturadores (facturadoresid),
    constraint proformas_ibfk_162
        foreign key (vendedoresid) references facturadores (facturadoresid),
    constraint proformas_ibfk_164
        foreign key (centros_costosid) references centros_costos (centros_costosid)
)
    charset = utf8mb4;

create table if not exists proformas_detalles
(
    proformas_detallesid bigint auto_increment
        primary key,
    proformasid          bigint         default 0          not null,
    centros_costosid     int            default 0          not null,
    productosid          bigint         default 0          not null,
    medidasid            int            default 0          not null,
    almacenesid          int            default 0          not null,
    cantidaddigitada     decimal(14, 2) default 0.00       not null,
    cantidad             decimal(20, 8) default 0.00000000 not null,
    cantidadfactor       decimal(20, 8) default 0.00000000 not null,
    precio               decimal(20, 8) default 0.00000000 not null,
    iva                  int            default 0          not null,
    precioiva            decimal(20, 8) default 0.00000000 not null,
    preciovisible        decimal(20, 8) default 0.00000000 not null,
    descuento            decimal(13, 8) default 0.00000000 not null,
    informacion          varchar(1500)  default ''         not null,
    imagen               longblob                          null,
    grupo                varchar(20)    default 'A'        not null,
    informaciondetalle   varchar(300)   default ''         not null,
    constraint proformas_detalles_ibfk_150
        foreign key (proformasid) references proformas (proformasid),
    constraint proformas_detalles_ibfk_154
        foreign key (almacenesid) references almacenes (almacenesid),
    constraint proformas_detalles_ibfk_156
        foreign key (medidasid) references medidas (medidasid),
    constraint proformas_detalles_ibfk_166
        foreign key (centros_costosid) references centros_costos (centros_costosid)
)
    charset = utf8mb4;

create table if not exists salidas
(
    salidasid               bigint auto_increment
        primary key,
    salidascodigo           varchar(10)    default ''         not null,
    movimientos_conceptosid int            default 14         not null,
    fecha                   date                              not null,
    centros_costosid        int            default 1          not null,
    movinventarios_tiposid  int            default 0          not null,
    almacenesid             int            default 0          not null,
    concepto                varchar(200)   default ''         not null,
    observacion             varchar(75)    default ''         not null,
    total                   decimal(20, 8) default 0.00000000 not null,
    asientocontable         bigint         default 0          not null,
    origen                  varchar(15)    default ''         not null,
    usuariocreacion         varchar(25)    default ''         not null,
    fechacreacion           datetime(3)                       not null,
    usuariomodificacion     varchar(25)    default ''         not null,
    fechamodificacion       datetime(3)                       null,
    constraint salidascodigo
        unique (salidascodigo),
    constraint salidas_ibfk_101
        foreign key (movinventarios_tiposid) references movinventarios_tipos (movinventarios_tiposid),
    constraint salidas_ibfk_104
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint salidas_ibfk_113
        foreign key (movimientos_conceptosid) references movimientos_conceptos (movimientos_conceptosid),
    constraint salidas_ibfk_97
        foreign key (almacenesid) references almacenes (almacenesid)
)
    charset = utf8mb4;

create table if not exists sri_documentos
(
    sri_documentoscodigo varchar(3)  default '' not null,
    descripcion          varchar(70) default '' not null,
    sustentostributarios varchar(70) default '' not null,
    constraint sri_documentoscodigo
        unique (sri_documentoscodigo)
)
    charset = utf8mb4;

create table if not exists secuencias
(
    sri_documentoscodigo     varchar(3)        default '01'  not null,
    secuenciasid             int auto_increment
        primary key,
    descripcion              varchar(50)       default ''    not null,
    estado                   tinyint           default 1     not null,
    numerodigitos            bigint unsigned   default 9     not null,
    autorizacion             varchar(10)       default ''    not null,
    establecimiento          varchar(3)        default '001' not null,
    puntoemision             varchar(3)        default '001' not null,
    numeroactual             bigint            default 1     not null,
    formasecuencia           varchar(3)        default ''    not null,
    cantidaditems            smallint unsigned default 12    not null,
    calculaiva               tinyint           default 1     not null,
    documentofiscal          tinyint           default 1     not null,
    documentoelectronico     tinyint           default 1     not null,
    tipocontribuyente        tinyint unsigned  default 1     not null,
    identificacion           varchar(20)       default ''    not null,
    razonsocial              varchar(300)      default ''    not null,
    direccionestablecimiento varchar(100)      default ''    not null,
    telefono                 varchar(15)       default ''    not null,
    placa                    varchar(8)        default ''    not null,
    logo                     longblob                        null,
    tiporegimen              tinyint unsigned  default 1     not null,
    agentederetencion        tinyint unsigned  default 0     not null,
    permite_recargo          tinyint unsigned  default 0     not null,
    transportista            tinyint           default 0     not null,
    fechacreacion            datetime(3)                     not null,
    usuariocreacion          varchar(25)       default ''    not null,
    fechamodificacion        datetime(3)                     null,
    usuariomodificacion      varchar(25)       default ''    not null,
    empresas_certificadosid  int               default 0     not null,
    constraint secuencias_ibfk_42
        foreign key (sri_documentoscodigo) references sri_documentos (sri_documentoscodigo)
)
    charset = utf8mb4;

create table if not exists facturadores_secuencias
(
    facturadores_secuenciasid bigint auto_increment
        primary key,
    secuenciasid              int     default 0 not null,
    facturadoresid            int     default 0 not null,
    principal                 tinyint default 0 not null,
    constraint facturadores_secuencias_ibfk_37
        foreign key (facturadoresid) references facturadores (facturadoresid),
    constraint facturadores_secuencias_ibfk_38
        foreign key (secuenciasid) references secuencias (secuenciasid)
)
    charset = utf8mb4;

create table if not exists facturas
(
    facturasid                     bigint auto_increment
        primary key,
    sucursalesid                   bigint           default 1          not null,
    secuenciasid                   int              default 0          not null,
    sri_documentoscodigo           varchar(3)       default '01'       not null,
    forma_pago_empresaid           int              default 0          not null,
    forma_pago_sri_codigo          varchar(2)       default '01'       not null,
    cajasid                        int              default 0          not null,
    bancosid                       int              default 0          not null,
    centros_costosid               int              default 0          not null,
    almacenesid                    int              default 0          not null,
    facturadoresid                 int              default 0          not null,
    vendedoresid                   int              default 0          not null,
    clientesid                     bigint           default 0          not null,
    clientes_sucursalesid          bigint           default 0          not null,
    clientes_contratosid           bigint           default 0          not null,
    tarifasid                      bigint           default 0          not null,
    establecimiento                varchar(3)       default ''         not null,
    puntoemision                   varchar(3)       default ''         not null,
    secuencial                     varchar(15)      default ''         not null,
    emision                        date                                not null,
    vence                          date                                null,
    relaciondocumentoid            bigint           default 0          not null,
    concepto                       varchar(150)     default ''         not null,
    subtotal                       decimal(20, 8)   default 0.00000000 not null,
    total_descuento                decimal(20, 8)   default 0.00000000 not null,
    subtotalconiva                 decimal(20, 8)   default 0.00000000 not null,
    subtotalsiniva                 decimal(20, 8)   default 0.00000000 not null,
    subtotalnoobjetoiva            decimal(20, 8)   default 0.00000000 not null,
    subtotalexentoiva              decimal(20, 8)   default 0.00000000 not null,
    subtotalneto                   decimal(20, 8)   default 0.00000000 not null,
    total_ice                      decimal(20, 8)   default 0.00000000 not null,
    total_iva                      decimal(16, 4)   default 0.0000     not null,
    propina                        decimal(14, 2)   default 0.00       not null,
    total                          decimal(20, 8)   default 0.00000000 not null,
    totalneto                      decimal(20, 8)   default 0.00000000 not null,
    totalretenidoiva               decimal(14, 2)   default 0.00       not null,
    totalretenidorenta             decimal(14, 2)   default 0.00       not null,
    puntoemisionretencion          varchar(3)       default ''         not null,
    establecimientoretencion       varchar(3)       default ''         not null,
    emisionretencion               date                                null,
    secuenciaretencion             varchar(10)      default ''         not null,
    autorizacionretencion          varchar(49)      default ''         not null,
    relacionemision                date                                null,
    relacionsecuencia              varchar(10)      default ''         not null,
    relacionestablecimiento        varchar(3)       default ''         not null,
    relacionpuentoemision          varchar(3)       default ''         not null,
    numeroautorizacion             varchar(49)      default ''         not null,
    autorizacionfecha              datetime(3)                         null,
    claveacceso                    varchar(49)      default ''         not null,
    autorizacionintentos           tinyint unsigned default 0          not null,
    de_enviado                     tinyint          default 0          not null,
    mensajeerror                   varchar(500)     default ''         not null,
    asientocontable                bigint           default 0          not null,
    asientocosto                   bigint           default 0          not null,
    saldo                          decimal(14, 2)   default 0.00       not null,
    tipoplazo                      int              default 0          not null,
    plazo                          int              default 0          not null,
    plazodias                      int              default 0          not null,
    numeropagos                    int              default 0          not null,
    interes                        decimal(14, 2)   default 0.00       not null,
    valorcuota                     decimal(14, 2)   default 0.00       null,
    totalacobrar                   decimal(14, 2)   default 0.00       not null,
    tipocredito                    tinyint unsigned default 0          not null,
    cambio                         decimal(12, 2)   default 0.00       not null,
    anulado                        tinyint          default 0          not null,
    observacion                    varchar(1500)    default ''         not null,
    archivo_xml                    longblob                            null,
    restaurante_mesasid            int              default 0          not null,
    receptor_clientesid            bigint           default 1          not null,
    receptor_clientes_sucursalesid bigint           default 0          not null,
    sucursales_destinosid          bigint           default 0          not null,
    uuid                           varchar(36)      default ''         not null,
    estado                         tinyint unsigned default 0          not null,
    estado_sync                    tinyint unsigned default 0          not null,
    impresa                        tinyint          default 0          not null,
    fechacreacion                  datetime(3)                         not null,
    fechamodificacion              datetime(3)                         null,
    usuariocreacion                varchar(25)      default ''         not null,
    usuariomodificacion            varchar(25)      default ''         not null,
    constraint establecimientopuntoemisionsecuencialsecuenciasid
        unique (establecimiento, puntoemision, secuencial, secuenciasid),
    constraint facturas_ibfk_12
        foreign key (forma_pago_sri_codigo) references forma_pago_sri (forma_pago_sri_codigo),
    constraint facturas_ibfk_14
        foreign key (clientesid) references clientes (clientesid),
    constraint facturas_ibfk_15
        foreign key (forma_pago_empresaid) references forma_pago_empresa (forma_pago_empresaid),
    constraint facturas_ibfk_16
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint facturas_ibfk_24
        foreign key (facturadoresid) references facturadores (facturadoresid),
    constraint facturas_ibfk_29
        foreign key (cajasid) references cajas (cajasid),
    constraint facturas_ibfk_307
        foreign key (vendedoresid) references facturadores (facturadoresid),
    constraint facturas_ibfk_32
        foreign key (almacenesid) references almacenes (almacenesid),
    constraint facturas_ibfk_39
        foreign key (secuenciasid) references secuencias (secuenciasid)
)
    charset = utf8mb4;

create table if not exists facturas_reembolsos
(
    facturas_reembolsosid bigint auto_increment
        primary key,
    sri_documentoscodigo  varchar(3)     default ''         not null,
    facturasid            bigint         default 0          not null,
    tipocliente           varchar(2)     default ''         not null,
    establecimiento       varchar(3)     default ''         not null,
    secuencia             varchar(9)     default ''         not null,
    emision               date                              not null,
    autorizacion          varchar(49)    default ''         not null,
    basesiniva            decimal(14, 2) default 0.00       not null,
    baseconiva            decimal(14, 2) default 0.00       not null,
    identificacion        varchar(20)    default ''         not null,
    basenograbada         decimal(14, 2) default 0.00       not null,
    baseexentaiva         decimal(14, 2) default 0.00       not null,
    puntoemision          varchar(3)     default ''         not null,
    total_iva             decimal(16, 4) default 0.0000     not null,
    subtotal              decimal(20, 8) default 0.00000000 not null,
    total_ice             decimal(14, 2) default 0.00       not null,
    sri_paispago          varchar(5)     default '593'      not null,
    sri_tipo_proveedor    varchar(2)     default '01'       not null,
    constraint facturas_reembolsos_ibfk_306
        foreign key (facturasid) references facturas (facturasid)
)
    charset = utf8mb4;

create table if not exists sri_impuestos
(
    sri_impuestosid        int auto_increment
        primary key,
    sri_codigo_impuestos   varchar(6)   default '' not null,
    descripcion            varchar(150) default '' not null,
    porcentaje             varchar(50)  default '' not null,
    codigocontable_compras varchar(50)  default '' not null,
    codigocontable_ventas  varchar(50)  default '' not null,
    tipo                   int          default 1  not null,
    bienservicio           varchar(1)   default '' not null,
    estado                 tinyint      default 1  not null,
    impuestovariable       tinyint      default 0  not null,
    fechavalidodesde       date                    null,
    fechavalidohasta       date                    null,
    usuariocreacion        varchar(25)  default '' not null,
    fechacreacion          datetime(3)             null,
    usuariomodificacion    varchar(25)  default '' not null,
    fechamodificacion      datetime(3)             null,
    constraint sri_codigo_impuestos
        unique (sri_codigo_impuestos)
)
    charset = utf8mb4;

create table if not exists facturas_retenciones
(
    facturas_retencionesid bigint auto_increment
        primary key,
    sri_codigo_impuestos   varchar(6)     default ''     not null,
    documentosid           bigint         default 0      not null,
    codigocontable         varchar(30)    default ''     not null,
    tipo                   varchar(10)    default ''     not null,
    baseimponible          decimal(12, 2) default 0.00   not null,
    porcentaje             decimal(7, 4)  default 0.0000 not null,
    valor                  decimal(12, 2) default 0.00   not null,
    clientesid             bigint         default 0      not null,
    origen                 varchar(15)    default ''     not null,
    constraint facturas_retenciones_ibfk_13
        foreign key (clientesid) references clientes (clientesid),
    constraint facturas_retenciones_ibfk_41
        foreign key (sri_codigo_impuestos) references sri_impuestos (sri_codigo_impuestos)
)
    charset = utf8mb4;

create table if not exists sri_sustentos
(
    sri_sustentoscodigo varchar(2)   default '' not null,
    descripcion         varchar(150) default '' not null,
    constraint sri_sustentoscodigo
        unique (sri_sustentoscodigo)
)
    charset = utf8mb4;

create table if not exists compras
(
    comprasid                       bigint auto_increment
        primary key,
    centros_costosid                int              default 1          not null,
    proveedoresid                   bigint           default 1          not null,
    forma_pago_empresaid            int              default 1          not null,
    forma_pago_sri_codigo           varchar(2)       default '01'       not null,
    sri_sustentoscodigo             varchar(2)       default ''         not null,
    movinventarios_tiposid          int              default 1          not null,
    almacenesid                     int              default 1          not null,
    sri_documentoscodigo            varchar(3)       default '01'       not null,
    secuencia                       varchar(10)      default ''         not null,
    establecimiento                 varchar(5)       default ''         not null,
    puntoemision                    varchar(3)       default ''         not null,
    emision                         date                                not null,
    vence                           date                                not null,
    concepto                        varchar(200)     default ''         not null,
    descuento                       decimal(7, 2)    default 0.00       not null,
    subtotal                        decimal(20, 8)   default 0.00000000 not null,
    total_descuento                 decimal(20, 8)   default 0.00000000 not null,
    subtotalneto                    decimal(20, 8)   default 0.00000000 not null,
    subtotalconiva                  decimal(20, 8)   default 0.00000000 not null,
    subtotalsiniva                  decimal(20, 8)   default 0.00000000 not null,
    subtotalexentoiva               decimal(20, 8)   default 0.00000000 not null,
    subtotalnoobjetoiva             decimal(20, 8)   default 0.00000000 not null,
    total_iva                       decimal(16, 4)   default 0.0000     not null,
    relacionado_documentosid        int              default 0          not null,
    total_ice                       decimal(20, 8)   default 0.00000000 not null,
    total_neto                      decimal(20, 8)   default 0.00000000 not null,
    total                           decimal(20, 8)   default 0.00000000 not null,
    basesinivabienes                decimal(14, 2)   default 0.00       not null,
    baseconivabines                 decimal(14, 2)   default 0.00       not null,
    basenoobjetoivabienes           decimal(14, 2)   default 0.00       not null,
    basesinivaservicios             decimal(14, 2)   default 0.00       not null,
    baseconivaservicios             decimal(14, 2)   default 0.00       not null,
    basenoobjetoivaservicios        decimal(14, 2)   default 0.00       not null,
    fechacontable                   date                                not null,
    secuenciasid_retencion          bigint           default 0          not null,
    retencionsecuencia              varchar(9)       default ''         not null,
    retencionemision                date                                null,
    retencionestablecimiento        varchar(3)       default ''         not null,
    retencionpuntoemision           varchar(3)       default ''         not null,
    retencionautorizacion           varchar(49)      default ''         not null,
    retenciontotalrenta             decimal(12, 2)   default 0.00       not null,
    retenciontotaliva               decimal(12, 2)   default 0.00       not null,
    retenciontotal                  decimal(14, 2)   default 0.00       not null,
    retencionagrupado               tinyint          default 0          not null,
    autorizacionfecha               datetime(3)                         null,
    claveacceso                     varchar(49)      default ''         not null,
    autorizacionintentos            tinyint unsigned default 0          not null,
    mensajeerror                    varchar(500)     default ''         null,
    de_enviado                      tinyint          default 0          not null,
    modificado_sri_documentoscodigo varchar(2)       default ''         not null,
    modificadoserie                 varchar(6)       default ''         null,
    modificadosecuencia             varchar(10)      default ''         not null,
    modificadoemision               date                                null,
    modificadoautorizacion          varchar(49)      default ''         not null,
    codigopais                      varchar(5)       default ''         not null,
    ats                             tinyint          default 0          not null,
    secuenciasid_liquidacion        bigint           default 0          null,
    autorizacion                    varchar(49)      default ''         not null,
    pagoresidente                   varchar(2)       default ''         not null,
    pagoregimenexterior             varchar(2)       default ''         not null,
    pagopaisregimen_general         varchar(3)       default ''         not null,
    pagopais_paraisofiscal          varchar(3)       default ''         not null,
    pagodenominacion                varchar(500)     default ''         not null,
    pagopais_pago                   varchar(3)       default ''         not null,
    pagoaplicaconvenio              varchar(2)       default ''         not null,
    pagoexteriorsujetoretencion     varchar(2)       default ''         not null,
    asientocontable                 bigint           default 0          not null,
    codigocontable_gastoimportacion varchar(30)      default ''         not null,
    total_gastoImportacion          decimal(38, 6)   default 0.000000   not null,
    ivapresuntivo                   decimal(14, 2)   default 0.00       not null,
    rentapresuntivo                 decimal(14, 2)   default 0.00       not null,
    asumirretencion                 tinyint          default 0          not null,
    archivo_xml                     longblob                            null,
    origen                          varchar(9)       default 'Compras'  not null,
    liq_claveacceso                 varchar(49)      default ''         not null,
    liq_autorizacionintentos        tinyint unsigned default 0          not null,
    liq_fechaautorizacion           datetime(3)                         null,
    liq_enviado                     tinyint          default 0          not null,
    liq_xml                         longblob                            null,
    liq_mensajeerror                varchar(500)     default ''         not null,
    fechacreacion                   datetime(3)                         not null,
    usuariocreacion                 varchar(25)      default ''         not null,
    fechamodificacion               datetime(3)                         null,
    usuariomodificacion             varchar(25)      default ''         not null,
    constraint compras_ibfk_57
        foreign key (proveedoresid) references proveedores (proveedoresid),
    constraint compras_ibfk_58
        foreign key (almacenesid) references almacenes (almacenesid),
    constraint compras_ibfk_59
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint compras_ibfk_60
        foreign key (sri_sustentoscodigo) references sri_sustentos (sri_sustentoscodigo),
    constraint compras_ibfk_61
        foreign key (sri_documentoscodigo) references sri_documentos (sri_documentoscodigo),
    constraint compras_ibfk_68
        foreign key (movinventarios_tiposid) references movinventarios_tipos (movinventarios_tiposid)
)
    charset = utf8mb4;

create table if not exists compras_gastos_importacion
(
    compras_gastos_importacionid bigint auto_increment
        primary key,
    comprasid                    bigint         default 0    not null,
    fecha                        date                        not null,
    referencia                   varchar(16)    default ''   not null,
    concepto                     varchar(150)   default ''   not null,
    importe                      decimal(14, 2) default 0.00 not null,
    constraint compras_gastos_importacion_ibfk_126
        foreign key (comprasid) references compras (comprasid)
)
    charset = utf8mb4;

create table if not exists compras_retenciones
(
    compras_retencionesid bigint auto_increment
        primary key,
    comprasid             bigint         default 0      not null,
    sri_codigo_impuestos  varchar(6)     default ''     not null,
    codigocontable        varchar(30)    default ''     not null,
    baseimponible         decimal(12, 2) default 0.00   not null,
    porcentaje            decimal(7, 4)  default 0.0000 not null,
    tipo                  varchar(5)     default ''     not null,
    valor                 decimal(12, 2) default 0.00   not null,
    fecha                 date                          not null,
    precio                decimal(6, 2)  default 0.00   not null,
    cantidad              decimal(14, 2) default 0.00   not null,
    anulado               tinyint        default 0      not null,
    constraint compras_retenciones_ibfk_56
        foreign key (comprasid) references compras (comprasid),
    constraint compras_retenciones_ibfk_62
        foreign key (sri_codigo_impuestos) references sri_impuestos (sri_codigo_impuestos)
)
    charset = utf8mb4;

create table if not exists reembolsos
(
    reembolsosid         bigint auto_increment
        primary key,
    comprasid            bigint         default 0          not null,
    sri_documentoscodigo varchar(3)     default ''         not null,
    tipoproveedor        varchar(2)     default ''         not null,
    establecimiento      varchar(3)     default ''         not null,
    secuencia            varchar(9)     default ''         null,
    emision              date                              not null,
    autorizacion         varchar(49)    default ''         null,
    basesiniva           decimal(14, 2) default 0.00       not null,
    baseconiva           decimal(14, 2) default 0.00       not null,
    identificacion       varchar(20)    default ''         not null,
    basenograbada        decimal(14, 2) default 0.00       not null,
    baseexentaiva        decimal(14, 2) default 0.00       not null,
    puntoemision         varchar(3)     default ''         not null,
    total_iva            decimal(16, 4) default 0.0000     not null,
    subtotal             decimal(20, 8) default 0.00000000 not null,
    total_ice            decimal(14, 2) default 0.00       not null,
    sri_paispago         varchar(5)     default '593'      not null,
    sri_tipo_proveedor   varchar(2)     default '01'       not null,
    constraint reembolsos_ibfk_205
        foreign key (comprasid) references compras (comprasid)
)
    charset = utf8mb4;

create table if not exists sri_tipos_ivas
(
    sri_tipos_ivas_codigo varchar(1)       default '' not null,
    porcentaje            varchar(21)      default '' not null,
    valor                 tinyint unsigned default 0  not null,
    fechavalidodesde      date                        null,
    fechavalidohasta      date                        null,
    constraint sri_tipos_ivas_codigo
        unique (sri_tipos_ivas_codigo)
)
    charset = utf8mb4;

create table if not exists productos
(
    productosid                bigint auto_increment
        primary key,
    productocodigo             varchar(25)      default '   '      not null,
    barras                     varchar(40)      default ''         not null,
    alterno1                   varchar(25)      default ''         not null,
    descripcion                varchar(150)     default ''         null,
    descripcioncorta           varchar(150)     default ''         not null,
    sri_tipos_ivas_codigo      varchar(1)       default '2'        not null,
    productos_lineasid         bigint           default 1          not null,
    productos_categoriasid     bigint           default 1          not null,
    productos_subcategoriasid  int              default 1          not null,
    productos_subgruposid      int              default 1          not null,
    estado                     tinyint          default 1          not null,
    venta                      tinyint          default 1          not null,
    existenciastotales         decimal(20, 8)   default 0.00000000 not null,
    reservado                  decimal(20, 8)   default 0.00000000 not null,
    controlnegativos           tinyint          default 1          not null,
    controlprecios             tinyint          default 1          not null,
    servicio                   tinyint          default 0          not null,
    bien                       tinyint          default 0          not null,
    series                     tinyint          default 0          not null,
    vehiculos                  tinyint          default 0          null,
    lotes                      tinyint          default 0          not null,
    cuentacontable_inventarios varchar(30)      default ''         not null,
    cuentacontable_ventas      varchar(30)      default ''         not null,
    cuentacontable_costo       varchar(30)      default ''         not null,
    sri_codigo_impuestos       varchar(6)       default '312'      not null,
    fichatecnica               varchar(1000)    default ''         null,
    costoactual                decimal(20, 8)   default 0.00000000 not null,
    costoestandar              decimal(20, 8)   default 0.00000000 not null,
    costoultimacompra          decimal(20, 8)   default 0.00000000 not null,
    fechaultimacompra          date                                null,
    observaciones              varchar(1000)    default '0'        null,
    unidadinterna              int              default 1          not null,
    unidadsuperior             int              default 0          null,
    unidadinferior             int              default 0          null,
    unidadcompra               int              default 1          not null,
    unidadventa                int              default 1          not null,
    proveedoresid_asignado     bigint           default 0          null,
    proveedoresid_ultimo       bigint           default 0          null,
    factorsuperior             decimal(16, 4)   default 0.0000     not null,
    factorinferior             decimal(16, 4)   default 0.0000     not null,
    subsidio                   decimal(20, 8)   default 0.00000000 not null,
    tonelaje                   decimal(7, 3)    default 0.000      null,
    pasajeros                  tinyint unsigned default 0          null,
    cilindraje                 decimal(7, 3)    default 0.000      null,
    marca                      varchar(25)      default ''         null,
    modelo                     varchar(25)      default ''         null,
    origen                     varchar(15)      default ''         null,
    lado                       varchar(15)      default ''         null,
    medidas                    varchar(50)      default ''         null,
    ice_codigo                 varchar(26)      default ''         not null,
    ice_porcentaje             decimal(5, 2)    default 0.00       not null,
    ice_valor                  decimal(38, 6)   default 0.000000   not null,
    peso_neto                  decimal(14, 4)   default 0.0000     not null,
    peso_bruto                 decimal(14, 4)   default 0.0000     not null,
    venta_peso                 tinyint          default 0          not null,
    materiaprima               tinyint          default 0          not null,
    compuesto                  tinyint          default 0          not null,
    ecommerceid                int              default 0          not null,
    ecommerce_estado           tinyint unsigned default 1          not null,
    parametros_json            varchar(500)     default ''         not null,
    estado_sync                tinyint unsigned default 0          not null,
    pvp                        decimal(20, 8)   default 0.00000000 not null,
    variantes                  tinyint          default 0          not null,
    fechacreacion              datetime(3)                         not null,
    usuariocreacion            varchar(25)      default ''         not null,
    fechamodificacion          datetime(3)                         null,
    usuariomodificacion        varchar(25)      default ''         not null,
    tipo_variante              tinyint unsigned default 0          not null,
    constraint productocodigo
        unique (productocodigo),
    constraint productos_ibfk_109
        foreign key (productos_subcategoriasid) references productos_subcategoria (productos_subcategoriasid),
    constraint productos_ibfk_110
        foreign key (productos_subgruposid) references productos_subgrupo (productos_subgruposid),
    constraint productos_ibfk_255
        foreign key (cuentacontable_inventarios) references cuentas_contables (codigocontable),
    constraint productos_ibfk_256
        foreign key (cuentacontable_ventas) references cuentas_contables (codigocontable),
    constraint productos_ibfk_257
        foreign key (cuentacontable_costo) references cuentas_contables (codigocontable),
    constraint productos_ibfk_44
        foreign key (productos_lineasid) references productos_lineas (productos_lineasid),
    constraint productos_ibfk_45
        foreign key (productos_categoriasid) references productos_categorias (productos_categoriasid),
    constraint productos_ibfk_46
        foreign key (sri_tipos_ivas_codigo) references sri_tipos_ivas (sri_tipos_ivas_codigo),
    constraint productos_ibfk_49
        foreign key (sri_codigo_impuestos) references sri_impuestos (sri_codigo_impuestos),
    constraint productos_ibfk_52
        foreign key (unidadinterna) references medidas (medidasid),
    constraint productos_ibfk_53
        foreign key (unidadventa) references medidas (medidasid),
    constraint productos_ibfk_54
        foreign key (unidadcompra) references medidas (medidasid)
)
    charset = utf8mb4;

create table if not exists acumulativos_detalles
(
    acumulativos_detallesid bigint auto_increment
        primary key,
    acumulativosid          bigint           default 0          not null,
    centros_costosid        int              default 0          not null,
    productosid             bigint           default 0          not null,
    medidasid               int              default 0          not null,
    almacenesid             int              default 0          not null,
    cantidaddigitada        decimal(14, 2)   default 0.00       not null,
    cantidad                decimal(20, 8)   default 0.00000000 not null,
    cantidadfactor          decimal(20, 8)   default 0.00000000 not null,
    precio                  decimal(20, 8)   default 0.00000000 not null,
    iva                     int              default 0          not null,
    precioiva               decimal(20, 8)   default 0.00000000 not null,
    preciovisible           decimal(20, 8)   default 0.00000000 not null,
    descuento               decimal(13, 8)   default 0.00000000 not null,
    cantidadentregada       decimal(18, 8)   default 0.00000000 not null,
    costo                   decimal(20, 8)   default 0.00000000 not null,
    informacion             varchar(1500)    default ''         not null,
    informaciondetalle      varchar(300)     default ''         not null,
    imagen                  longblob                            null,
    estado                  tinyint unsigned default 1          not null,
    constraint acumulativos_detalles_ibfk_286
        foreign key (acumulativosid) references acumulativos (acumulativosid),
    constraint acumulativos_detalles_ibfk_292
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint acumulativos_detalles_ibfk_293
        foreign key (almacenesid) references almacenes (almacenesid),
    constraint acumulativos_detalles_ibfk_294
        foreign key (medidasid) references medidas (medidasid),
    constraint acumulativos_detalles_ibfk_295
        foreign key (productosid) references productos (productosid)
)
    charset = utf8mb4;

create table if not exists clientes_precios
(
    clientes_preciosid bigint auto_increment
        primary key,
    productosid        bigint         default 0          not null,
    precio             decimal(20, 8) default 0.00000000 not null,
    precioiva          decimal(20, 8) default 0.00000000 not null,
    clientesid         bigint         default 0          not null,
    descuento          decimal(7, 2)  default 0.00       not null,
    constraint clientes_precios_ibfk_244
        foreign key (productosid) references productos (productosid),
    constraint clientes_precios_ibfk_245
        foreign key (clientesid) references clientes (clientesid)
)
    charset = utf8mb4;

create table if not exists compras_detalles
(
    compras_detallesid          bigint auto_increment
        primary key,
    comprasid                   bigint         default 0          not null,
    centros_costosid            int            default 0          not null,
    almacenesid                 int            default 0          not null,
    medidasid                   int            default 1          not null,
    productosid                 bigint         default 0          not null,
    movinventarios_tiposid      int            default 0          not null,
    origen                      varchar(15)    default '0'        not null,
    costo                       decimal(20, 8) default 0.00000000 not null,
    cantidad                    decimal(20, 8) default 0.00000000 not null,
    iva                         decimal(4, 2)  default 0.00       not null,
    costoneto                   decimal(20, 8) default 0.00000000 not null,
    descuento                   decimal(13, 8) default 0.00000000 not null,
    descuentovalor              decimal(20, 8) default 0.00000000 not null,
    cantidadfactor              decimal(20, 8) default 0.00000000 not null,
    cantidaddigitada            decimal(14, 2) default 0.00       not null,
    documento_origenid          bigint         default 0          not null,
    documento_detalles_origenid bigint         default 0          not null,
    ice_codigo                  varchar(26)    default ''         not null,
    ice_tarifa                  decimal(5, 2)  default 0.00       not null,
    ice_base                    decimal(20, 8) default 0.00000000 not null,
    ice_valor                   decimal(20, 8) default 0.00000000 not null,
    anulado                     tinyint        default 0          not null,
    informaciondetalle          varchar(300)   default ''         not null,
    informacion                 varchar(1500)  default ''         not null,
    constraint compras_detalles_ibfk_63
        foreign key (comprasid) references compras (comprasid),
    constraint compras_detalles_ibfk_64
        foreign key (almacenesid) references almacenes (almacenesid),
    constraint compras_detalles_ibfk_65
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint compras_detalles_ibfk_66
        foreign key (medidasid) references medidas (medidasid),
    constraint compras_detalles_ibfk_67
        foreign key (productosid) references productos (productosid),
    constraint compras_detalles_ibfk_69
        foreign key (movinventarios_tiposid) references movinventarios_tipos (movinventarios_tiposid)
)
    charset = utf8mb4;

create table if not exists compras_gastos_importacion_distribucion
(
    compras_gastos_importacion_distribucionid bigint auto_increment
        primary key,
    comprasid                                 bigint         default 0          not null,
    cantidad                                  decimal(20, 8) default 0.00000000 not null,
    fob                                       decimal(18, 6) default 0.000000   not null,
    productosid                               bigint         default 0          not null,
    total_fob                                 decimal(20, 8) default 0.00000000 not null,
    gasto_distribuido                         decimal(20, 8) default 0.00000000 not null,
    total_importacion                         decimal(20, 8) default 0.00000000 not null,
    costo_importacion                         decimal(20, 8) default 0.00000000 not null,
    constraint compras_gastos_importacion_distribucion_ibfk_127
        foreign key (comprasid) references compras (comprasid),
    constraint compras_gastos_importacion_distribucion_ibfk_128
        foreign key (productosid) references productos (productosid)
)
    charset = utf8mb4;

create table if not exists compras_ordenes_detalles
(
    compras_ordenes_detallesid bigint auto_increment
        primary key,
    compras_ordenesid          bigint         default 0          not null,
    centros_costosid           int            default 0          not null,
    almacenesid                int            default 0          not null,
    medidasid                  int            default 0          not null,
    productosid                bigint         default 0          not null,
    costo                      decimal(20, 8) default 0.00000000 not null,
    cantidad                   decimal(20, 8) default 0.00000000 not null,
    iva                        decimal(4, 2)  default 0.00       not null,
    costoneto                  decimal(20, 8) default 0.00000000 not null,
    descuento                  decimal(13, 8) default 0.00000000 not null,
    descuentovalor             decimal(20, 8) default 0.00000000 not null,
    cantidadfactor             decimal(20, 8) default 0.00000000 not null,
    cantidaddigitada           decimal(14, 2) default 0.00       not null,
    faltantes                  decimal(12, 2) default 0.00       not null,
    constraint compras_ordenes_detalles_ibfk_215
        foreign key (compras_ordenesid) references compras_ordenes (compras_ordenesid),
    constraint compras_ordenes_detalles_ibfk_217
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint compras_ordenes_detalles_ibfk_219
        foreign key (productosid) references productos (productosid),
    constraint compras_ordenes_detalles_ibfk_221
        foreign key (almacenesid) references almacenes (almacenesid),
    constraint compras_ordenes_detalles_ibfk_224
        foreign key (medidasid) references medidas (medidasid)
)
    charset = utf8mb4;

create table if not exists compras_recepciones_detalles
(
    compras_recepciones_detallesid bigint auto_increment
        primary key,
    compras_recepcionesid          bigint         default 0          not null,
    compras_ordenesid              bigint         default 0          not null,
    movinventarios_tiposid         int            default 12         not null,
    centros_costosid               int            default 0          not null,
    almacenesid                    int            default 0          not null,
    medidasid                      int            default 0          not null,
    productosid                    bigint         default 0          not null,
    cantidaddigitada               decimal(14, 2) default 0.00       not null,
    cantidadfactor                 decimal(20, 8) default 0.00000000 not null,
    cantidad                       decimal(20, 8) default 0.00000000 not null,
    costo                          decimal(20, 8) default 0.00000000 not null,
    iva                            decimal(4, 2)  default 0.00       not null,
    costoneto                      decimal(20, 8) default 0.00000000 not null,
    descuento                      decimal(13, 8) default 0.00000000 not null,
    descuentovalor                 decimal(20, 8) default 0.00000000 not null,
    compras_ordenes_detallesid     decimal(12, 2) default 0.00       not null,
    constraint compras_recepciones_detalles_ibfk_216
        foreign key (compras_recepcionesid) references compras_recepciones (compras_recepcionesid),
    constraint compras_recepciones_detalles_ibfk_218
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint compras_recepciones_detalles_ibfk_220
        foreign key (productosid) references productos (productosid),
    constraint compras_recepciones_detalles_ibfk_222
        foreign key (almacenesid) references almacenes (almacenesid),
    constraint compras_recepciones_detalles_ibfk_223
        foreign key (medidasid) references medidas (medidasid)
)
    charset = utf8mb4;

create table if not exists facturas_detalles
(
    facturas_detallesid bigint auto_increment
        primary key,
    centros_costosid    int            default 0          not null,
    facturasid          bigint         default 0          not null,
    almacenesid         int            default 0          not null,
    productosid         bigint         default 0          not null,
    medidasid           int            default 0          not null,
    cantidaddigitada    decimal(14, 2) default 0.00       not null,
    cantidadfactor      decimal(20, 8) default 0.00000000 not null,
    cantidad            decimal(20, 8) default 0.00000000 not null,
    cantidadentregada   decimal(18, 8) default 0.00000000 not null,
    peso                decimal(12, 2) default 0.00       not null,
    precio              decimal(20, 8) default 0.00000000 not null,
    preciovisible       decimal(20, 8) default 0.00000000 not null,
    precioiva           decimal(20, 8) default 0.00000000 not null,
    descuento           decimal(13, 8) default 0.00000000 not null,
    costo               decimal(20, 8) default 0.00000000 not null,
    iva                 decimal(4, 2)  default 0.00       not null,
    descuentovalor      decimal(20, 8) default 0.00000000 not null,
    servicio            tinyint        default 0          not null,
    anulado             tinyint        default 0          not null,
    entrega             tinyint        default 0          not null,
    entrega_parcial     tinyint        default 0          not null,
    compuestoid         bigint         default 0          not null,
    detalle_relacionid  bigint         default 0          not null,
    informaciondetalle  varchar(300)   default ''         not null,
    informacion         varchar(1500)  default ''         not null,
    constraint facturas_detalles_ibfk_17
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint facturas_detalles_ibfk_18
        foreign key (facturasid) references facturas (facturasid),
    constraint facturas_detalles_ibfk_33
        foreign key (almacenesid) references almacenes (almacenesid),
    constraint facturas_detalles_ibfk_43
        foreign key (productosid) references productos (productosid),
    constraint facturas_detalles_ibfk_55
        foreign key (medidasid) references medidas (medidasid)
)
    charset = utf8mb4;

create table if not exists ingresos_detalles
(
    ingresos_detallesid bigint auto_increment
        primary key,
    centros_costosid    int            default 0          not null,
    ingresosid          bigint         default 0          not null,
    almacenesid         int            default 0          not null,
    medidasid           int            default 0          not null,
    productosid         bigint         default 0          not null,
    costo               decimal(20, 8) default 0.00000000 not null,
    cantidad            decimal(20, 8) default 0.00000000 not null,
    iva                 decimal(4, 2)  default 0.00       not null,
    factor_conversion   decimal(20, 8) default 0.00000000 not null,
    constraint ingresos_detalles_ibfk_105
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint ingresos_detalles_ibfk_92
        foreign key (ingresosid) references ingresos (ingresosid),
    constraint ingresos_detalles_ibfk_93
        foreign key (productosid) references productos (productosid),
    constraint ingresos_detalles_ibfk_96
        foreign key (almacenesid) references almacenes (almacenesid),
    constraint ingresos_detalles_ibfk_99
        foreign key (medidasid) references medidas (medidasid)
)
    charset = utf8mb4;

create table if not exists movinventario_variantes
(
    movinventario_variantesid bigint auto_increment
        primary key,
    productosid               bigint         default 0          not null,
    almacenesid               int            default 0          not null,
    existencias               decimal(20, 8) default 0.00000000 not null,
    productos_variantesid     bigint         default 0          not null,
    constraint movinventario_variantes_ibfk_308
        foreign key (productosid) references productos (productosid),
    constraint movinventario_variantes_ibfk_309
        foreign key (productos_variantesid) references productos_variantes (productos_variantesid),
    constraint movinventario_variantes_ibfk_311
        foreign key (almacenesid) references almacenes (almacenesid)
)
    charset = utf8mb4;

create table if not exists movinventarios
(
    movinventariosid       bigint auto_increment
        primary key,
    centros_costosid       int            default 0          not null,
    documentosid           bigint         default 0          not null,
    productosid            bigint         default 0          not null,
    medidasid              int            default 0          not null,
    movinventarios_tiposid int            default 0          not null,
    almacenesid            int            default 0          not null,
    documento_detallesid   bigint         default 0          not null,
    cantidaddigitada       decimal(14, 2) default 0.00       not null,
    cantidadfactor         decimal(20, 8) default 0.00000000 not null,
    cantidad               decimal(20, 8) default 0.00000000 not null,
    precioiva              decimal(20, 8) default 0.00000000 not null,
    precio                 decimal(20, 8) default 0.00000000 not null,
    preciovisible          decimal(20, 8) default 0.00000000 not null,
    descuento              decimal(13, 8) default 0.00000000 not null,
    descuentovalor         decimal(20, 8) default 0.00000000 not null,
    costo                  decimal(20, 8) default 0.00000000 not null,
    iva                    int            default 0          not null,
    servicio               tinyint        default 0          not null,
    anulado                tinyint        default 0          not null,
    fechamovimiento        date                              not null,
    fechaactulizacion      date                              null,
    referencia             varchar(17)    default ''         not null,
    beneficiarioid         bigint         default 0          not null,
    constraint movinventarios_ibfk_70
        foreign key (almacenesid) references almacenes (almacenesid),
    constraint movinventarios_ibfk_71
        foreign key (productosid) references productos (productosid),
    constraint movinventarios_ibfk_72
        foreign key (medidasid) references medidas (medidasid),
    constraint movinventarios_ibfk_77
        foreign key (movinventarios_tiposid) references movinventarios_tipos (movinventarios_tiposid)
)
    charset = utf8mb4;

create table if not exists movinventarios_almacenes
(
    movinventarios_almacenesid int auto_increment
        primary key,
    almacenesid                int            default 0          not null,
    productosid                bigint         default 0          not null,
    existencias                decimal(20, 8) default 0.00000000 not null,
    reservado                  decimal(20, 8) default 0.00000000 not null,
    ubicacion                  varchar(15)    default ''         not null,
    minimo                     decimal(16, 4) default 0.0000     not null,
    maximo                     decimal(16, 4) default 0.0000     not null,
    informacion_json           varchar(100)   default ''         not null,
    constraint almacenesid_productosid
        unique (almacenesid, productosid),
    constraint movinventarios_almacenes_ibfk_73
        foreign key (productosid) references productos (productosid),
    constraint movinventarios_almacenes_ibfk_74
        foreign key (almacenesid) references almacenes (almacenesid)
)
    charset = utf8mb4;

create table if not exists movinventarios_lotes
(
    movinventarios_lotesid bigint auto_increment
        primary key,
    productosid            bigint         default 0          not null,
    almacenesid            int            default 0          not null,
    cantidad               decimal(20, 8) default 0.00000000 not null,
    lote                   varchar(20)    default ''         not null,
    fecha_caduca           date                              not null,
    fecha_elaboracion      date                              not null,
    existencias            decimal(20, 8) default 0.00000000 not null,
    constraint movinventarios_lotes_ibfk_239
        foreign key (almacenesid) references almacenes (almacenesid),
    constraint movinventarios_lotes_ibfk_240
        foreign key (productosid) references productos (productosid)
)
    charset = utf8mb4;

create table if not exists movinventarios_lotes_detalles
(
    movinventarios_lotes_detallesid bigint auto_increment
        primary key,
    movinventarios_tiposid          int            default 0          not null,
    documentosid                    bigint         default 0          not null,
    cantidad                        decimal(20, 8) default 0.00000000 not null,
    movinventarios_lotesid          bigint         default 0          not null,
    origen                          varchar(15)    default ''         not null,
    constraint movinventarios_lotes_detalles_ibfk_241
        foreign key (movinventarios_lotesid) references movinventarios_lotes (movinventarios_lotesid),
    constraint movinventarios_lotes_detalles_ibfk_242
        foreign key (movinventarios_tiposid) references movinventarios_tipos (movinventarios_tiposid)
)
    charset = utf8mb4;

create table if not exists pedidos_detalles
(
    pedidos_detallesid bigint auto_increment
        primary key,
    pedidosid          bigint           default 0          not null,
    centros_costosid   int              default 0          not null,
    productosid        bigint           default 0          not null,
    medidasid          int              default 0          not null,
    almacenesid        int              default 0          not null,
    cantidaddigitada   decimal(14, 2)   default 0.00       not null,
    cantidad           decimal(20, 8)   default 0.00000000 not null,
    cantidadfactor     decimal(20, 8)   default 0.00000000 not null,
    precio             decimal(20, 8)   default 0.00000000 not null,
    iva                int              default 0          not null,
    precioiva          decimal(20, 8)   default 0.00000000 not null,
    preciovisible      decimal(20, 8)   default 0.00000000 not null,
    descuento          decimal(13, 8)   default 0.00000000 not null,
    informacion        varchar(1500)    default ''         not null,
    imagen             longblob                            null,
    grupo              varchar(20)      default 'A'        not null,
    informaciondetalle varchar(300)     default ''         not null,
    estado             tinyint unsigned default 1          not null,
    cantidadentregada  decimal(18, 8)   default 0.00000000 not null,
    constraint pedidos_detalles_ibfk_178
        foreign key (pedidosid) references pedidos (pedidosid),
    constraint pedidos_detalles_ibfk_179
        foreign key (productosid) references productos (productosid),
    constraint pedidos_detalles_ibfk_180
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint pedidos_detalles_ibfk_183
        foreign key (almacenesid) references almacenes (almacenesid)
)
    charset = utf8mb4;

create table if not exists produccion_detalles
(
    produccion_detallesid bigint auto_increment
        primary key,
    produccionesid        bigint         default 0          not null,
    productosid           bigint         default 0          not null,
    valor_mod             decimal(18, 6) default 0.000000   not null,
    centros_costosid      int            default 0          not null,
    valor_cif             decimal(18, 6) default 0.000000   not null,
    medidasid             int            default 0          not null,
    cantidad              decimal(20, 8) default 0.00000000 not null,
    costo                 decimal(20, 8) default 0.00000000 not null,
    total                 decimal(20, 8) default 0.00000000 not null,
    constraint produccion_detalles_ibfk_135
        foreign key (productosid) references productos (productosid),
    constraint produccion_detalles_ibfk_136
        foreign key (medidasid) references medidas (medidasid),
    constraint produccion_detalles_ibfk_137
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint produccion_detalles_ibfk_138
        foreign key (produccionesid) references produccion (produccionesid)
)
    charset = utf8mb4;

create table if not exists produccion_recetas_detalles
(
    produccion_recetas_detallesid bigint auto_increment
        primary key,
    produccion_recetasid          bigint         default 0          not null,
    produccion_procesosid         bigint         default 0          not null,
    productosid                   bigint         default 0          not null,
    medidasid                     int            default 0          not null,
    cantidad                      decimal(20, 8) default 0.00000000 not null,
    constraint produccion_recetas_detalles_ibfk_129
        foreign key (produccion_recetasid) references produccion_recetas (produccion_recetasid),
    constraint produccion_recetas_detalles_ibfk_130
        foreign key (productosid) references productos (productosid),
    constraint produccion_recetas_detalles_ibfk_131
        foreign key (medidasid) references medidas (medidasid),
    constraint produccion_recetas_detalles_ibfk_132
        foreign key (produccion_procesosid) references produccion_procesos (produccion_procesosid)
)
    charset = utf8mb4;

create table if not exists produccion_requisitos
(
    produccion_requisitosid bigint auto_increment
        primary key,
    produccion_procesosid   bigint         default 0          not null,
    produccion_detallesid   bigint         default 0          not null,
    centros_costosid        int            default 0          not null,
    produccionesid          bigint         default 0          not null,
    productosid             bigint         default 0          not null,
    medidasid               int            default 0          not null,
    tipo                    varchar(1)     default ''         not null,
    cantidad                decimal(20, 8) default 0.00000000 not null,
    cantidadrequerida       decimal(38, 8) default 0.00000000 not null,
    costo                   decimal(20, 8) default 0.00000000 not null,
    constraint produccion_requisitos_ibfk_139
        foreign key (produccion_detallesid) references produccion_detalles (produccion_detallesid),
    constraint produccion_requisitos_ibfk_140
        foreign key (produccionesid) references produccion (produccionesid),
    constraint produccion_requisitos_ibfk_141
        foreign key (productosid) references productos (productosid),
    constraint produccion_requisitos_ibfk_142
        foreign key (medidasid) references medidas (medidasid),
    constraint produccion_requisitos_ibfk_143
        foreign key (produccion_procesosid) references produccion_procesos (produccion_procesosid),
    constraint produccion_requisitos_ibfk_144
        foreign key (centros_costosid) references centros_costos (centros_costosid)
)
    charset = utf8mb4;

create table if not exists produccion_requisitos_resumidos
(
    produccion_requisitos_resumidosid bigint auto_increment
        primary key,
    centros_costosid                  int            default 0          not null,
    produccionesid                    bigint         default 0          not null,
    productosid                       bigint         default 0          not null,
    cantidadrequerida                 decimal(36, 4) default 0.0000     not null,
    medidasid                         int            default 0          not null,
    Cantidad                          decimal(20, 8) default 0.00000000 not null,
    constraint produccion_requisitos_resumidos_ibfk_145
        foreign key (produccionesid) references produccion (produccionesid),
    constraint produccion_requisitos_resumidos_ibfk_146
        foreign key (productosid) references productos (productosid),
    constraint produccion_requisitos_resumidos_ibfk_147
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint produccion_requisitos_resumidos_ibfk_148
        foreign key (medidasid) references medidas (medidasid)
)
    charset = utf8mb4;

create table if not exists productos_alternos
(
    productos_alternosid bigint auto_increment
        primary key,
    codigobarras         varchar(20) default '' not null,
    descripcion          varchar(30) default '' not null,
    medidasid            int         default 1  not null,
    productosid          bigint      default 0  not null,
    constraint productos_alternos_ibfk_81
        foreign key (productosid) references productos (productosid)
)
    charset = utf8mb4;

create table if not exists productos_homologados
(
    productos_homologadosid bigint auto_increment
        primary key,
    proveedoresid           bigint       default 0  not null,
    productocodigo          varchar(25)  default '' not null,
    descripcion             varchar(100) default '' not null,
    productosid             bigint       default 0  not null,
    constraint productos_homologados_ibfk_206
        foreign key (productosid) references productos (productosid),
    constraint productos_homologados_ibfk_207
        foreign key (proveedoresid) references proveedores (proveedoresid)
)
    charset = utf8mb4;

create table if not exists productos_imagenes
(
    productos_imagenesid bigint auto_increment
        primary key,
    productosid          bigint  default 0 not null,
    medidasid            int     default 1 not null,
    principal            tinyint default 0 not null,
    imagen               longblob          null,
    ecommerce_visible    tinyint default 1 not null,
    constraint productos_imagenes_ibfk_82
        foreign key (productosid) references productos (productosid)
)
    charset = utf8mb4;

create table if not exists salidas_detalles
(
    salidasid          bigint         default 0          not null,
    salidas_detallesid bigint auto_increment
        primary key,
    centros_costosid   int            default 0          not null,
    almacenesid        int            default 0          not null,
    productosid        bigint         default 0          not null,
    medidasid          int            default 0          not null,
    cantidad           decimal(20, 8) default 0.00000000 not null,
    costo              decimal(20, 8) default 0.00000000 not null,
    iva                decimal(4, 2)  default 0.00       not null,
    constraint salidas_detalles_ibfk_100
        foreign key (medidasid) references medidas (medidasid),
    constraint salidas_detalles_ibfk_106
        foreign key (centros_costosid) references centros_costos (centros_costosid),
    constraint salidas_detalles_ibfk_91
        foreign key (salidasid) references salidas (salidasid),
    constraint salidas_detalles_ibfk_94
        foreign key (productosid) references productos (productosid),
    constraint salidas_detalles_ibfk_98
        foreign key (almacenesid) references almacenes (almacenesid)
)
    charset = utf8mb4;

create table if not exists sucursales
(
    sucursalesid          bigint auto_increment
        primary key,
    descripcion           varchar(50)      default ''   not null,
    ciudadesid            varchar(4)       default ''   not null,
    tipo_agencia          tinyint unsigned default 1    not null,
    identificacion        varchar(20)      default ''   not null,
    razonsocial           varchar(300)     default ''   not null,
    direccion             varchar(300)     default ''   not null,
    telefono1             varchar(15)      default ''   not null,
    telefono2             varchar(15)      default ''   not null,
    comision_produccion   decimal(6, 2)    default 0.00 not null,
    comision_distribucion decimal(6, 2)    default 0.00 not null,
    estado                tinyint unsigned default 1    not null,
    meta                  decimal(12, 2)   default 0.00 not null,
    fechacreacion         datetime(3)                   not null,
    usuariocreacion       varchar(25)      default ''   not null,
    fechamodificacion     datetime(3)                   null,
    usuariomodificacion   varchar(25)      default ''   not null
)
    charset = utf8mb4;

create table if not exists manifiesto
(
    manifiestosid       bigint auto_increment
        primary key,
    manifiestos_codigo  varchar(10)      default '' not null,
    transportistasid    bigint           default 0  not null,
    emision             date                        not null,
    agencia_origenid    bigint           default 0  not null,
    agencia_destinoid   bigint           default 0  not null,
    estibadoresid       bigint           default 0  not null,
    camionesid          bigint           default 0  not null,
    estado              tinyint unsigned default 0  not null,
    usuariocreacion     varchar(25)      default '' not null,
    fechacreacion       datetime(3)                 not null,
    usuariomodificacion varchar(25)      default '' not null,
    fechamodificacion   datetime(3)                 null,
    constraint manifiestos_codigo
        unique (manifiestos_codigo),
    constraint manifiesto_ibfk_253
        foreign key (agencia_origenid) references sucursales (sucursalesid),
    constraint manifiesto_ibfk_254
        foreign key (agencia_destinoid) references sucursales (sucursalesid)
)
    charset = utf8mb4;

create table if not exists manifiestos_detalles
(
    manifiestos_detallesid bigint auto_increment
        primary key,
    manifiestosid          bigint           default 0          not null,
    documentosid           bigint           default 0          not null,
    clientes_sucursalesid  bigint           default 0          not null,
    secuencia              varchar(16)      default ''         not null,
    emision                date                                not null,
    clientesid             bigint           default 0          not null,
    agencia_origenid       bigint           default 0          not null,
    agencia_destinoid      bigint           default 0          not null,
    cantidad               decimal(20, 8)   default 0.00000000 not null,
    destino                varchar(20)      default ''         not null,
    estado                 tinyint unsigned default 0          not null,
    tipo                   varchar(2)       default ''         not null,
    constraint manifiestos_detalles_ibfk_237
        foreign key (manifiestosid) references manifiesto (manifiestosid),
    constraint manifiestos_detalles_ibfk_251
        foreign key (agencia_origenid) references sucursales (sucursalesid),
    constraint manifiestos_detalles_ibfk_252
        foreign key (agencia_destinoid) references sucursales (sucursalesid)
)
    charset = utf8mb4;

create table if not exists manifiestos_seguimientos
(
    manifiestos_seguimientosid bigint auto_increment
        primary key,
    manifiestosid              bigint           default 0          not null,
    documentosid               bigint           default 0          not null,
    fecha                      datetime(3)                         not null,
    secuencia                  varchar(16)      default ''         not null,
    tipo                       varchar(2)       default ''         not null,
    agencia_origenid           bigint           default 0          null,
    agencia_destinoid          bigint           default 0          null,
    agencia_actualid           bigint           default 0          not null,
    emision                    date                                null,
    clientesid                 bigint           default 0          null,
    cantidad                   decimal(20, 8)   default 0.00000000 null,
    estado                     tinyint unsigned default 0          null,
    control                    tinyint          default 0          not null,
    clientes_sucursalesid      bigint           default 0          not null,
    constraint manifiestos_seguimientos_ibfk_248
        foreign key (agencia_origenid) references sucursales (sucursalesid),
    constraint manifiestos_seguimientos_ibfk_249
        foreign key (agencia_destinoid) references sucursales (sucursalesid),
    constraint manifiestos_seguimientos_ibfk_250
        foreign key (agencia_actualid) references sucursales (sucursalesid)
)
    charset = utf8mb4;

create table if not exists secuenciales
(
    secuencialesid int auto_increment
        primary key,
    sucursalesid   bigint           default 1  not null,
    secuencial     varchar(20)      default '' not null,
    numeroceros    tinyint unsigned default 9  not null,
    prefijo        varchar(2)       default '' not null,
    valor          bigint           default 1  not null,
    constraint secuenciales_ibfk_2
        foreign key (sucursalesid) references sucursales (sucursalesid)
)
    charset = utf8mb4;

create table if not exists talleres_ordenes
(
    talleres_ordenesid    bigint auto_increment
        primary key,
    secuencial            varchar(10)      default '' not null,
    clientes_vehiculosid  bigint           default 0  not null,
    fecha_entrada         date                        not null,
    fecha_entrega         date                        not null,
    kilometraje           decimal          default 0  not null,
    persona_entrega       varchar(30)      default '' not null,
    observaciones_cliente varchar(300)     default '' not null,
    observaciones_taller  varchar(300)     default '' not null,
    imagen_estado         longblob                    null,
    proxima_revision      date                        null,
    nivel_combustible     tinyint unsigned default 1  not null,
    origen                varchar(15)      default '' not null,
    documentosid          bigint           default 0  not null,
    estado                tinyint unsigned default 1  not null,
    fechacreacion         datetime(3)                 not null,
    usuariocreacion       varchar(25)      default '' not null,
    fechamodificacion     datetime(3)                 null,
    usuariomodificacion   varchar(25)                 null,
    constraint secuencial
        unique (secuencial)
)
    charset = utf8mb4;

create table if not exists talleres_seguimientos
(
    talleres_seguimientosid int auto_increment
        primary key,
    talleres_ordenesid      bigint       default 0  not null,
    tecnicosid              int          default 0  not null,
    fecha                   date                    not null,
    mantenimiento           varchar(300) default '' null,
    asientocontable         bigint       default 0  not null,
    usuariocreacion         varchar(25)  default '' not null,
    fechacreacion           datetime(3)             not null,
    usuariomodificacion     varchar(25)  default '' not null,
    fechamodificiacion      datetime(3)             null,
    constraint talleres_seguimientos_ibfk_225
        foreign key (talleres_ordenesid) references talleres_ordenes (talleres_ordenesid)
)
    charset = utf8mb4;

create table if not exists talleres_repuestos
(
    talleres_seguimientosid int            default 0          not null,
    talleres_repuestosid    int auto_increment
        primary key,
    talleres_ordenesid      bigint         default 0          not null,
    centros_costosid        int            default 0          not null,
    movinventarios_tiposid  int            default 0          not null,
    almacenesid             int            default 0          not null,
    clientesid              bigint         default 0          not null,
    medidasid               int            default 0          not null,
    productosid             bigint         default 0          not null,
    cantidaddigitada        decimal(14, 2) default 0.00       not null,
    cantidadfactor          decimal(20, 8) default 0.00000000 not null,
    cantidad                decimal(20, 8) default 0.00000000 not null,
    precio                  decimal(20, 8) default 0.00000000 not null,
    precioiva               decimal(20, 8) default 0.00000000 not null,
    costo                   decimal(20, 8) default 0.00000000 not null,
    facturado               tinyint        default 0          not null,
    iva                     decimal(4, 2)  default 0.00       null,
    constraint talleres_repuestos_ibfk_226
        foreign key (talleres_seguimientosid) references talleres_seguimientos (talleres_seguimientosid),
    constraint talleres_repuestos_ibfk_227
        foreign key (talleres_ordenesid) references talleres_ordenes (talleres_ordenesid)
)
    charset = utf8mb4;

create table if not exists tarifas
(
    tarifasid           bigint auto_increment
        primary key,
    descripcion         varchar(50)   default ''   not null,
    utilidad            decimal(5, 2) default 0.00 not null,
    estado              tinyint       default 1    not null,
    agregarautomatico   tinyint       default 1    not null,
    indefinida          tinyint       default 1    not null,
    fechainicio         date                       null,
    fechafin            date                       null,
    fechacreacion       datetime(3)                not null,
    usuariocreacion     varchar(25)   default ''   not null,
    fechamodificacion   datetime(3)                null,
    usuariomodificacion varchar(25)   default ''   not null
)
    charset = utf8mb4;

create table if not exists productos_tarifas
(
    productos_tarifasid bigint auto_increment
        primary key,
    productosid         bigint         default 0          not null,
    medidasid           int            default 0          not null,
    tarifasid           bigint         default 0          not null,
    descuento           decimal(7, 2)  default 0.00       not null,
    utilidad            decimal(20, 8) default 0.00000000 not null,
    margen              decimal(20, 8) default 0.00000000 not null,
    precioiva           decimal(20, 8) default 0.00000000 not null,
    pvp_neto            decimal(20, 8) default 0.00000000 not null,
    factor              decimal(18, 8) default 1.00000000 not null,
    precio              decimal(20, 8) default 0.00000000 not null,
    escala              int            default 0          not null,
    constraint productos_tarifas_ibfk_78
        foreign key (tarifasid) references tarifas (tarifasid),
    constraint productos_tarifas_ibfk_79
        foreign key (productosid) references productos (productosid),
    constraint productos_tarifas_ibfk_80
        foreign key (medidasid) references medidas (medidasid)
)
    charset = utf8mb4;

create table if not exists tarjetas
(
    tarjetasid          int auto_increment
        primary key,
    descripcion         varchar(30) default '' not null,
    fechacreacion       datetime(3)            not null,
    usuariocreacion     varchar(25) default '' not null,
    fechamodificacion   datetime(3)            null,
    usuariomodificacion varchar(25) default '' not null
)
    charset = utf8mb4;

create table if not exists tarjetas_retenciones
(
    tarjetas_retencionesid bigint auto_increment
        primary key,
    emision                date                        not null,
    establecimiento        varchar(3)     default ''   not null,
    puntoemision           varchar(3)     default ''   not null,
    secuencia              varchar(10)    default ''   not null,
    retenciontotalrenta    decimal(12, 2) default 0.00 not null,
    retenciontotaliva      decimal(12, 2) default 0.00 not null,
    asientocontable        bigint         default 0    not null
)
    charset = utf8mb4;

create table if not exists tomas_fisicas
(
    tomas_fisicasid      bigint auto_increment
        primary key,
    tomas_fisicas_codigo varchar(10) default '' not null,
    almacenesid          int         default 0  not null,
    ingresosid           bigint      default 0  null,
    salidasid            bigint      default 0  not null,
    centros_costosid     int         default 0  not null,
    conciliado           tinyint     default 0  not null,
    fechamovimiento      date                   not null,
    fechacreacion        datetime(3)            not null,
    usuariocreacion      varchar(20) default '' not null,
    fechamodificacion    datetime(3)            null,
    usuariomodificacion  varchar(20) default '' not null,
    constraint tomas_fisicas_codigo
        unique (tomas_fisicas_codigo),
    constraint tomas_fisicas_ibfk_174
        foreign key (almacenesid) references almacenes (almacenesid),
    constraint tomas_fisicas_ibfk_246
        foreign key (centros_costosid) references centros_costos (centros_costosid)
)
    charset = utf8mb4;

create table if not exists tomas_fisicas_detalles
(
    tomas_fisicas_detallesid bigint auto_increment
        primary key,
    tomas_fisicasid          bigint         default 0          not null,
    productosid              bigint         default 0          not null,
    almacenesid              int            default 0          not null,
    movinventarios_tiposid   int            default 0          not null,
    centros_costosid         int            default 0          not null,
    costo                    decimal(20, 8) default 0.00000000 not null,
    unidadcompra             int            default 0          not null,
    cantidad                 decimal(20, 8) default 0.00000000 not null,
    cantidadanterior         decimal(20, 8) default 0.00000000 not null,
    constraint tomas_fisicas_detalles_ibfk_122
        foreign key (tomas_fisicasid) references tomas_fisicas (tomas_fisicasid)
            on delete cascade,
    constraint tomas_fisicas_detalles_ibfk_175
        foreign key (almacenesid) references almacenes (almacenesid),
    constraint tomas_fisicas_detalles_ibfk_233
        foreign key (productosid) references productos (productosid),
    constraint tomas_fisicas_detalles_ibfk_247
        foreign key (centros_costosid) references centros_costos (centros_costosid)
)
    charset = utf8mb4;

create table if not exists transferencias
(
    transferenciasid     bigint auto_increment
        primary key,
    transferenciascodigo varchar(10)      default ''         not null,
    fecha                date                                not null,
    fecha_ingreso        date                                null,
    origen_almacenesid   int              default 0          not null,
    destino_almacenesid  int              default 0          not null,
    concepto             varchar(200)     default ''         not null,
    observacion          varchar(75)      default ''         not null,
    total                decimal(20, 8)   default 0.00000000 not null,
    usuariocreacion      varchar(25)      default ''         not null,
    fechacreacion        datetime(3)                         not null,
    usuariomodificacion  varchar(25)      default ''         not null,
    fechamodificacion    datetime(3)                         null,
    aprobado             tinyint          default 0          null,
    estado               tinyint unsigned default 0          not null,
    constraint transferenciascodigo
        unique (transferenciascodigo),
    constraint transferencias_ibfk_114
        foreign key (origen_almacenesid) references almacenes (almacenesid),
    constraint transferencias_ibfk_115
        foreign key (destino_almacenesid) references almacenes (almacenesid)
)
    charset = utf8mb4;

create table if not exists transferencias_detalles
(
    transferenciasid          bigint         default 0          not null,
    transferencias_detallesid bigint auto_increment
        primary key,
    productosid               bigint         default 0          not null,
    medidasid                 int            default 0          not null,
    cantidad                  decimal(20, 8) default 0.00000000 not null,
    costo                     decimal(20, 8) default 0.00000000 not null,
    iva                       decimal(4, 2)  default 0.00       not null,
    constraint transferencias_detalles_ibfk_111
        foreign key (transferenciasid) references transferencias (transferenciasid),
    constraint transferencias_detalles_ibfk_112
        foreign key (productosid) references productos (productosid),
    constraint transferencias_detalles_ibfk_116
        foreign key (medidasid) references medidas (medidasid)
)
    charset = utf8mb4;

create table if not exists transportistas
(
    clientesid          bigint         default 0    not null,
    transportistasid    bigint auto_increment
        primary key,
    tipotransportista   int unsigned   default 0    not null,
    tipoidentificacion  varchar(1)     default 'C'  not null,
    nombres             varchar(100)   default ''   null,
    direccion           varchar(100)   default ''   null,
    email               varchar(50)    default ''   null,
    vehiculo            varchar(30)    default ''   null,
    telefono            varchar(10)    default ''   null,
    celular             varchar(10)    default ''   null,
    identificacion      varchar(20)    default ''   null,
    placa               varchar(8)     default ''   null,
    peso                decimal(12, 2) default 0.00 null,
    observacion         varchar(75)    default ''   null,
    estado              tinyint        default 0    null,
    llevacontabilidad   tinyint        default 0    not null,
    fechacreacion       datetime(3)                 not null,
    usuariocreacion     varchar(25)    default ''   not null,
    fechamodificacion   datetime(3)                 null,
    usuariomodificacion varchar(25)    default ''   not null
)
    charset = utf8mb4;

create table if not exists guias_remision
(
    guias_remisionid     bigint auto_increment
        primary key,
    secuenciasid         int              default 0  not null,
    transportistasid     bigint           default 0  null,
    establecimiento      varchar(3)       default '' not null,
    puntoemision         varchar(3)       default '' not null,
    secuencial           varchar(15)      default '' not null,
    direccionpartida     varchar(150)     default '' not null,
    placa                varchar(8)       default '' not null,
    direccionllegada     varchar(150)     default '' not null,
    fechahorasalida      datetime(3)                 not null,
    fechahorallegada     datetime(3)                 not null,
    autorizacion         varchar(49)      default '' null,
    claveacceso          varchar(49)      default '' null,
    enviado              tinyint          default 0  not null,
    mensajeerror         varchar(500)     default '' null,
    aduanero             varchar(20)      default '' null,
    ruta                 varchar(150)     default '' not null,
    infadicional1        varchar(300)     default '' not null,
    infadicional2        varchar(300)     default '' not null,
    email                varchar(150)     default '' not null,
    autorizacionfecha    datetime(3)                 null,
    autorizacionintentos tinyint unsigned default 0  not null,
    archivo_xml          longblob                    null,
    fechacreacion        datetime(3)                 not null,
    usuariocreacion      varchar(25)      default '' not null,
    fechamodificacion    datetime(3)                 null,
    usuariomodificacion  varchar(25)      default '' not null,
    constraint secuenciasidestablecimientopuntoemisionsecuencial
        unique (secuenciasid, establecimiento, puntoemision, secuencial),
    constraint guias_remision_ibfk_234
        foreign key (transportistasid) references transportistas (transportistasid)
)
    charset = utf8mb4;

create table if not exists guias_remision_detalles
(
    guias_remision_detallesid bigint auto_increment
        primary key,
    guias_remisionid          bigint         default 0          not null,
    cantidad                  decimal(20, 8) default 0.00000000 not null,
    productosid               bigint         default 0          not null,
    constraint guias_remision_detalles_ibfk_232
        foreign key (guias_remisionid) references guias_remision (guias_remisionid)
)
    charset = utf8mb4;

create table if not exists guias_remision_documentos
(
    guia_remision_documentosid bigint auto_increment
        primary key,
    guias_remisionid           bigint       default 0  not null,
    documentosid               bigint       default 0  not null,
    nombres                    varchar(100) default '' not null,
    direccion                  varchar(150) default '' not null,
    motivo                     varchar(20)  default '' not null,
    establecimiento            varchar(3)   default '' not null,
    puntoemision               varchar(3)   default '' not null,
    numeroautorizacion         varchar(49)  default '' not null,
    fechaemision               date                    not null,
    identificacion             varchar(20)  default '' not null,
    tipodocumento              varchar(2)   default '' not null,
    origen                     varchar(20)  default '' null,
    secuencial                 varchar(15)  default '' not null,
    constraint guias_remision_documentos_ibfk_231
        foreign key (guias_remisionid) references guias_remision (guias_remisionid)
)
    charset = utf8mb4;

create table if not exists usuarios_almacenes
(
    usuarios_almacenesid bigint auto_increment
        primary key,
    sis_usuariosid       int     default 0 not null,
    principal            tinyint default 0 not null,
    almacenesid          int     default 0 not null
)
    charset = utf8mb4;

create table if not exists usuarios_cajas
(
    usuarios_cajasid int auto_increment
        primary key,
    principal        tinyint default 0 not null,
    sis_usuariosid   int     default 0 not null,
    cajasid          int     default 0 not null
)
    charset = utf8mb4;

create table if not exists usuarios_centros_costos
(
    usuarios_centros_costosid int auto_increment
        primary key,
    principal                 tinyint default 0 not null,
    sis_usuariosid            int     default 0 not null,
    centro_costosid           int     default 0 not null
)
    charset = utf8mb4;

create table if not exists usuarios_formapago
(
    usuarios_forma_pagoid bigint auto_increment
        primary key,
    sis_usuariosid        int     default 0 not null,
    principal             tinyint default 0 not null,
    forma_pago_empresaid  int     default 0 not null
)
    charset = utf8mb4;

create table if not exists usuarios_movinventarios_tipos
(
    usuarios_movinventarios_tipoid bigint auto_increment
        primary key,
    principal                      tinyint default 0 not null,
    sis_usuariosid                 int     default 0 not null,
    movinventarios_tiposid         int     default 0 not null
)
    charset = utf8mb4;

create table if not exists usuarios_sucursales
(
    usuarios_sucursalesid bigint auto_increment
        primary key,
    sucursalesid          bigint default 0 not null,
    sis_usuariosid        int    default 0 not null
)
    charset = utf8mb4;

create view consulta_rangos as
select `p_crm2`.`cuentasporcobrar`.`secuencial`                    AS `secuencial`,
       (case
            when ((`p_crm2`.`cuentasporcobrar`.`vence` < (20240102 + interval -(90) day)) and
                  ((`p_crm2`.`cuentasporcobrar`.`tipo` = 'FC') or (`p_crm2`.`cuentasporcobrar`.`tipo` = 'ND')))
                then sum(`p_crm2`.`cuentasporcobrar`.`importe`)
            else 0 end)                                            AS `Rango5`,
       (case
            when ((`p_crm2`.`cuentasporcobrar`.`vence` between (20240102 + interval -(90) day) and (20240102 + interval -(61) day)) and
                  20240102 and
                  ((`p_crm2`.`cuentasporcobrar`.`tipo` = 'FC') or (`p_crm2`.`cuentasporcobrar`.`tipo` = 'ND')))
                then sum(`p_crm2`.`cuentasporcobrar`.`importe`)
            else 0 end)                                            AS `Rango4`,
       (case
            when ((`p_crm2`.`cuentasporcobrar`.`vence` between (20240102 + interval -(60) day) and (20240102 + interval -(31) day)) and
                  20240102 and
                  ((`p_crm2`.`cuentasporcobrar`.`tipo` = 'FC') or (`p_crm2`.`cuentasporcobrar`.`tipo` = 'ND')))
                then sum(`p_crm2`.`cuentasporcobrar`.`importe`)
            else 0 end)                                            AS `Rango3`,
       (case
            when ((`p_crm2`.`cuentasporcobrar`.`vence` between (20240102 + interval -(30) day) and (20240102 + interval -(1) day)) and
                  20240102 and
                  ((`p_crm2`.`cuentasporcobrar`.`tipo` = 'FC') or (`p_crm2`.`cuentasporcobrar`.`tipo` = 'ND')))
                then sum(`p_crm2`.`cuentasporcobrar`.`importe`)
            else 0 end)                                            AS `Rango2`,
       (case
            when ((`p_crm2`.`cuentasporcobrar`.`vence` between 20240102 and (20240102 + interval 30 day)) and
                  ((`p_crm2`.`cuentasporcobrar`.`tipo` = 'FC') or (`p_crm2`.`cuentasporcobrar`.`tipo` = 'ND')))
                then sum(`p_crm2`.`cuentasporcobrar`.`importe`)
            else 0 end)                                            AS `Rango6`,
       (case
            when ((`p_crm2`.`cuentasporcobrar`.`vence` between (20240102 + interval 31 day) and (20240102 + interval 60 day)) and
                  ((`p_crm2`.`cuentasporcobrar`.`tipo` = 'FC') or (`p_crm2`.`cuentasporcobrar`.`tipo` = 'ND')))
                then sum(`p_crm2`.`cuentasporcobrar`.`importe`)
            else 0 end)                                            AS `Rango7`,
       (case
            when ((`p_crm2`.`cuentasporcobrar`.`vence` between (20240102 + interval 61 day) and (20240102 + interval 90 day)) and
                  ((`p_crm2`.`cuentasporcobrar`.`tipo` = 'FC') or (`p_crm2`.`cuentasporcobrar`.`tipo` = 'ND')))
                then sum(`p_crm2`.`cuentasporcobrar`.`importe`)
            else 0 end)                                            AS `Rango8`,
       (case
            when ((`p_crm2`.`cuentasporcobrar`.`vence` > (20240102 + interval 90 day)) and
                  ((`p_crm2`.`cuentasporcobrar`.`tipo` = 'FC') or (`p_crm2`.`cuentasporcobrar`.`tipo` = 'ND')))
                then sum(`p_crm2`.`cuentasporcobrar`.`importe`)
            else 0 end)                                            AS `Rango9`,
       sum(`p_crm2`.`cuentasporcobrar`.`importe`)                  AS `SaldoTotal`,
       (select sum(`cxc`.`importe`) AS `SaldoTotal`
        from `p_crm2`.`cuentasporcobrar` `cxc`
        where ((`p_crm2`.`clientes`.`clientesid` = `cxc`.`clientesid`) and
               (`cxc`.`vence` >= (20240102 + interval 1 day))))    AS `PorVencer`,
       (select sum(`cxc1`.`importe`) AS `SaldoTotal1`
        from `p_crm2`.`cuentasporcobrar` `cxc1`
        where ((`p_crm2`.`clientes`.`clientesid` = `cxc1`.`clientesid`) and
               (`cxc1`.`vence` < (20240102 + interval -(1) day)))) AS `VENCIDO`
from (`p_crm2`.`cuentasporcobrar` join `p_crm2`.`clientes`
      on ((`p_crm2`.`clientes`.`clientesid` = `p_crm2`.`cuentasporcobrar`.`clientesid`)))
where (`p_crm2`.`clientes`.`clientesid` = 9)
group by concat(`p_crm2`.`cuentasporcobrar`.`documentosid`, `p_crm2`.`cuentasporcobrar`.`secuencial`)
having (`SaldoTotal` > 0);

create view prov as
select `p_crm2`.`compras`.`proveedoresid`                                              AS `proveedoresid`,
       `p_crm2`.`compras`.`sri_documentoscodigo`                                       AS `sri_documentoscodigo`,
       `p_crm2`.`compras`.`secuencia`                                                  AS `secuencia`,
       concat(`p_crm2`.`compras`.`establecimiento`, `p_crm2`.`compras`.`puntoemision`) AS `modificadoserie`,
       `p_crm2`.`compras`.`comprasid`                                                  AS `comprasid`
from `p_crm2`.`compras`
where (`p_crm2`.`compras`.`sri_documentoscodigo` in ('01', '41', '370', '371'));

create procedure Consulta_Top_Clientes(IN dFechaDesde date, IN dFechaHasta date, IN sAlmacen int)
    sql security invoker
-- missing source code
;

create procedure Consulta_Top_Productos(IN dFechaDesde date, IN dFechaHasta date, IN sAlmacen int)
    sql security invoker
-- missing source code
;

create procedure Consulta_Ventas_Almacenes(IN dFechaDesde date, IN dFechaHasta date, IN sAlmacen int)
    sql security invoker
-- missing source code
;

create procedure Consulta_Ventas_Anios(IN dAnio int, IN sAlmacen int)
    sql security invoker
-- missing source code
;

create procedure Consulta_Ventas_Facturador(IN dFechaDesde date, IN dFechaHasta date, IN sAlmacen int)
    sql security invoker
-- missing source code
;

create procedure Consulta_Ventas_Hora(IN dFechaDesde date, IN dFechaHasta date, IN nAlmacenid bigint)
    sql security invoker
-- missing source code
;

create procedure Consulta_Ventas_Totales(IN dFechaDesde date, IN dFechaHasta date, IN sAlmacen int)
    sql security invoker
-- missing source code
;

create procedure Consulta_Ventas_Vendedor(IN dFechaDesde date, IN dFechaHasta date, IN sAlmacen int)
    sql security invoker
-- missing source code
;

create procedure SP_Actualiza_Secuencias_Internas(IN sTabla varchar(255))
    sql security invoker modifies sql data
-- missing source code
;

create procedure SP_Clientes_Consulta_Saldo(IN nClientesid bigint)
-- missing source code
;

create procedure SP_Comparativo(IN sCaso varchar(25), IN sCuentaContable varchar(25), IN dFechaDesde date,
                                IN dFechaHasta date)
    sql security invoker
-- missing source code
;

create procedure SP_Consulta_Secuencias_Internas(IN sTabla varchar(255), OUT sSecuencia varchar(10))
    deterministic sql security invoker reads sql data
-- missing source code
;

create procedure SP_Contabiliza_Activos_Fijos_Agrupado(IN dFechaDesde date, IN dFechaHasta date, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Activos_Fijos_Individual(IN nDocumentoid bigint, IN dFecha date, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Anular_Asiento(IN nDocumentoid bigint, IN sOrigen varchar(255))
    sql security invoker
-- missing source code
;

create procedure SP_Contabiliza_Banco_Agrupado(IN dFechaDesde date, IN dFechaHasta date, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Banco_Individual(IN nDocumentoid bigint, IN sUsuario varchar(25),
                                                 IN ssorigen varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Caja_Agrupado(IN dFechaDesde date, IN dFechaHasta date, IN sUsuario varchar(25))
    sql security invoker modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Caja_Individual(IN nDocumentoid bigint, IN sUsuario varchar(25),
                                                IN ssorigen varchar(25))
    sql security invoker modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Cobro_Agrupado(IN dFechaDesde date, IN dFechaHasta date, IN sCCAnticipo varchar(255),
                                               IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Cobro_Individual(IN nDocumentoid bigint, IN sCCAnticipo varchar(255),
                                                 IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Compra_Recepcion_Agrupado(IN dFechaDesde date, IN dFechaHasta date,
                                                          IN sCCRecepcion varchar(255), IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Compra_Recepcion_Individual(IN nDocumentoid bigint, IN sCCRecepcion varchar(255),
                                                            IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Compras_Agrupado(IN dFechaDesde date, IN dFechaHasta date,
                                                 IN sCCIvaCompras varchar(255), IN sCCIceCompras varchar(255),
                                                 IN sCCIvaPresuntivo varchar(255), IN sCCRentaPresuntivo varchar(255),
                                                 IN sCCAsumeRenta varchar(255), IN sCCRecepcion varchar(255),
                                                 IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Compras_Individual(IN nDocumentoid bigint, IN sCCIvaCompras varchar(255),
                                                   IN sCCIceCompras varchar(255), IN sCCIvaPresuntivo varchar(255),
                                                   IN sCCRentaPresuntivo varchar(255), IN sCCAsumeRenta varchar(255),
                                                   IN sCCRecepcion varchar(255), IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Costo_Venta_Agrupado(IN dFechaDesde date, IN dFechaHasta date, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Costo_Venta_Individual(IN nDocumentoid bigint, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Cruce_CliProv_Agrupado(IN sCodigoContableNC varchar(255), IN dFechaDesde date,
                                                       IN dFechaHasta date, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Cruce_CliProv_Individual(IN sCombinacion varchar(255), IN sTipo varchar(255),
                                                         IN sCcNCInterna varchar(255), IN sUsuario varchar(25),
                                                         IN sOrigen varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Cruce_CxC_Agrupado(IN sCodigoContableAnticipo varchar(255),
                                                   IN sCodigoContableNC varchar(255), IN dFechaDesde date,
                                                   IN dFechaHasta date, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Cruce_CxC_Individual(IN sCombinacion varchar(255), IN sTipo varchar(255),
                                                     IN sCcNCInterna varchar(255), IN sCcAnticipo varchar(255),
                                                     IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Cruce_CxP_Agrupado(IN sCodigoContableAnticipo varchar(255),
                                                   IN sCodigoContableNC varchar(255), IN dFechaDesde date,
                                                   IN dFechaHasta date, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Cruce_CxP_Individual(IN sCombinacion varchar(255), IN sTipo varchar(255),
                                                     IN sCcNCInterna varchar(255), IN sCcAnticipo varchar(255),
                                                     IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Deposito_Agrupado(IN dFechaDesde date, IN dFechaHasta date, IN sUsuario varchar(25))
    sql security invoker modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Deposito_Individual(IN nDocumentoid bigint, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Deposito_Retenciones_Agrupado(IN dFechaDesde date, IN dFechaHasta date,
                                                              IN sUsuario varchar(25), IN sCuentaContable varchar(255))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Deposito_Retenciones_Individual(IN nDocumentoid bigint, IN sCuentaContable varchar(255),
                                                                IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Eliminar_Asiento(IN nDocumentoid bigint, IN sOrigen varchar(255))
    sql security invoker
-- missing source code
;

create procedure SP_Contabiliza_Entregas_Agrupado(IN dFechaDesde date, IN dFechaHasta date, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Entregas_Individual(IN nDocumentoid bigint, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Facturacion_Agrupado(IN dFechaDesde date, IN dFechaHasta date,
                                                     IN sCCIvaVentas varchar(255), IN sCCIceVentas varchar(255),
                                                     IN ccPropinaVentas varchar(255), IN ccAnticipoVentas varchar(255),
                                                     IN ccInteresesDiferidos varchar(255), IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Facturacion_Individual(IN nDocumentoid bigint, IN CCIvaVentas varchar(255),
                                                       IN ccIceVentas varchar(255), IN ccPropinaVentas varchar(255),
                                                       IN ccAnticipoVentas varchar(255),
                                                       IN ccInteresesDiferidos varchar(255), IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Garantia_Individual(IN nDocumentoid bigint, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Garantias_Agrupado(IN dFechaDesde date, IN dFechaHasta date, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Ingreso_Agrupado(IN dFechaDesde date, IN dFechaHasta date, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Ingreso_Individual(IN nDocumentoid bigint, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Libro_Diario_Crear(IN PaJson json, IN dFecha date, IN sUsuario varchar(255))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Libro_Diario_Editar(IN nDocumentoid bigint, IN PaJson json, IN dFecha date,
                                                    IN sUsuario varchar(255))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Limpiar_Asiento()
    sql security invoker modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_NC_Individual(IN nDocumentoid bigint, IN sUsuario varchar(25), IN ssorigen varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Nomina_Banco_Agrupado(IN dFechaDesde date, IN dFechaHasta date, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Nomina_Banco_Individual(IN nDocumentoid bigint, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Nomina_Caja_Agrupado(IN dFechaDesde date, IN dFechaHasta date, IN sUsuario varchar(25))
    sql security invoker modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Nomina_Caja_Individual(IN nDocumentoid bigint, IN sUsuario varchar(25))
    sql security invoker modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Pago_Agrupado(IN dFechaDesde date, IN dFechaHasta date, IN sCCAnticipo varchar(255),
                                              IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Pago_Individual(IN nDocumentoid bigint, IN sCCAnticipo varchar(255),
                                                IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Retencion_Atrasada_Agrupado(IN dFechaDesde date, IN dFechaHasta date, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Retencion_Atrasada_Individual(IN nDocumentoid bigint, IN sUsuario varchar(25), IN ntipo bigint)
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Retenciones_Ajuste_Agrupado(IN dFechaDesde date, IN dFechaHasta date,
                                                            IN CcCobroRetencion varchar(255),
                                                            IN CcCajaTransito varchar(255), IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Retenciones_Ajuste_Caja_Agrupado(IN dFechaDesde date, IN dFechaHasta date,
                                                                 IN CcCajaTransito varchar(255),
                                                                 IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Retenciones_Ajuste_Caja_Individual(IN nDocumentoid bigint,
                                                                   IN CcCajaTransito varchar(255),
                                                                   IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Retenciones_Ajuste_Individual(IN nDocumentoid bigint, IN CcCobroRetencion varchar(255),
                                                              IN CcCajaTransito varchar(255), IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Salida_Agrupado(IN dFechaDesde date, IN dFechaHasta date, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Salida_Individual(IN nDocumentoid bigint, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Talleres_Agrupado(IN dFechaDesde date, IN dFechaHasta date, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Talleres_Individual(IN nDocumentoid bigint, IN sUsuario varchar(25))
    modifies sql data
-- missing source code
;

create procedure SP_Contabiliza_Verificar_Asiento(IN nDocumentoid bigint, OUT verificado tinyint(1))
    sql security invoker
-- missing source code
;

create procedure SP_Listado_Clientes()
    sql security invoker
-- missing source code
;

create procedure SP_Productos_Actualizar_Costos(IN nProductoid bigint, IN sDecimales bigint)
    sql security invoker modifies sql data
-- missing source code
;

create procedure SP_Productos_Actualizar_Costos_Totales_Detalles()
    sql security invoker modifies sql data
-- missing source code
;

create procedure SP_Productos_Actualizar_Costos_UltimaCompra()
-- missing source code
;

create procedure SP_Productos_Actualizar_Existencias()
    sql security invoker modifies sql data
-- missing source code
;

create procedure SP_almacenes_ABC(IN pAccion varchar(1), IN pRegistrosJson json)
-- missing source code
;

create procedure SP_almacenes_ConsultarID(IN p_almacenesid int)
-- missing source code
;

create procedure SP_bancos_ABC(IN pAccion varchar(1), IN pRegistrosJson json)
-- missing source code
;

create procedure SP_bancos_ConsultarID(IN p_bancosid int)
-- missing source code
;

create procedure SP_cajas_ABC(IN pAccion varchar(1), IN pRegistrosJson json)
-- missing source code
;

create procedure SP_cajas_ConsultarID(IN p_cajasid int)
-- missing source code
;

create procedure SP_centros_costos_ABC(IN pAccion varchar(1), IN pRegistrosJson json)
-- missing source code
;

create procedure SP_centros_costos_ConsultarID(IN p_centros_costosid int)
-- missing source code
;

create procedure SP_clientes_bancos_ABC(IN pAccion varchar(1), IN pRegistrosJson json)
-- missing source code
;

create procedure SP_clientes_bancos_ConsultarID(IN p_clientes_bancosid int)
-- missing source code
;

create procedure SP_clientes_grupos_ABC(IN pAccion varchar(1), IN pRegistrosJson json)
-- missing source code
;

create procedure SP_clientes_grupos_ConsultarID(IN p_clientes_gruposid int)
-- missing source code
;

create procedure SP_clientes_sucursales_ABC(IN pAccion varchar(1), IN pRegistrosJson json)
-- missing source code
;

create procedure SP_clientes_sucursales_ConsultarID(IN p_clientes_sucursalesid int)
-- missing source code
;

create procedure SP_clientes_zonas_ABC(IN pAccion varchar(1), IN pRegistrosJson json)
-- missing source code
;

create procedure SP_clientes_zonas_ConsultarID(IN p_clientes_zonasid int)
-- missing source code
;

create procedure SP_cuentas_contables_ABC(IN pAccion varchar(1), IN pRegistrosJson json)
-- missing source code
;

create procedure SP_cuentas_contables_ConsultarID(IN p_cuentas_contablesid int)
-- missing source code
;

create procedure SP_medidas_ABC(IN pAccion varchar(1), IN pRegistrosJson json)
-- missing source code
;

create procedure SP_medidas_ConsultarID(IN p_medidasid int)
-- missing source code
;

create procedure SP_movimientos_conceptos_ABC(IN pAccion varchar(1), IN pRegistrosJson json)
-- missing source code
;

create procedure SP_movimientos_conceptos_ConsultarID(IN p_movimientos_conceptosid int)
-- missing source code
;

create procedure SP_productos_categorias_ABC(IN pAccion varchar(1), IN pRegistrosJson json)
-- missing source code
;

create procedure SP_productos_categorias_ConsultarID(IN p_productos_categoriasid int)
-- missing source code
;

create procedure SP_productos_lineas_ABC(IN pAccion varchar(1), IN pRegistrosJson json)
-- missing source code
;

create procedure SP_productos_lineas_ConsultarID(IN p_productos_lineasid int)
-- missing source code
;

create procedure SP_productos_subcategoria_ABC(IN pAccion varchar(1), IN pRegistrosJson json)
-- missing source code
;

create procedure SP_productos_subcategoria_ConsultarID(IN p_productos_subcategoriasid int)
-- missing source code
;

create procedure SP_productos_subgrupo_ABC(IN pAccion varchar(1), IN pRegistrosJson json)
-- missing source code
;

create procedure SP_productos_subgrupo_ConsultarID(IN p_productos_subgruposid int)
-- missing source code
;

create procedure SP_restaurante_mesas_ABC(IN pAccion varchar(1), IN pRegistrosJson json)
-- missing source code
;

create procedure SP_restaurante_mesas_ConsultarID(IN p_restaurante_mesasid int)
-- missing source code
;

create procedure SP_restaurante_pisos_ABC(IN pAccion varchar(1), IN pRegistrosJson json)
-- missing source code
;

create procedure SP_restaurante_pisos_ConsultarID(IN p_restaurante_pisosid int)
-- missing source code
;

create procedure SP_rutas_ABC(IN pAccion varchar(1), IN pRegistrosJson json)
-- missing source code
;

create procedure SP_rutas_ConsultarID(IN p_rutasid int)
-- missing source code
;

create procedure SP_secuencias_ABC(IN pAccion varchar(1), IN pRegistrosJson json)
-- missing source code
;

create procedure SP_secuencias_ConsultarID(IN p_secuenciasid int)
-- missing source code
;

create procedure SP_tarjetas_ABC(IN pAccion varchar(1), IN pRegistrosJson json)
-- missing source code
;

create procedure SP_tarjetas_ConsultarID(IN p_tarjetasid int)
-- missing source code
;

create procedure SP_transportistas_ABC(IN pAccion varchar(1), IN pRegistrosJson json)
-- missing source code
;

create procedure SP_transportistas_ConsultarID(IN p_transportistasid int)
-- missing source code
;

create event if not exists EV_Actualizar_Existencias on schedule
    every '1' DAY
        starts '2023-12-28 12:00:00'
    on completion preserve
    enable
    do
    CALL SP_Productos_Actualizar_Existencias();


