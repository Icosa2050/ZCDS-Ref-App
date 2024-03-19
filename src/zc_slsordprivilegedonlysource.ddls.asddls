@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'tet'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zc_slsordprivilegedonlysource as select distinct from ZC_SalesOrder
{
    key SalesOrder,
    /* Associations */
    _SalesOrderItem
}
