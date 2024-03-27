@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View with projected association'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_SalesOrder
  as select from ZI_SalesOrder
  association [1..1] to ZI_SalesOrder as _SalesOrder
    on $projection.SalesOrder = _SalesOrder.SalesOrder
{
  key ZI_SalesOrder.SalesOrder,
      ZI_SalesOrder.SalesOrderType,
      ZI_SalesOrder._Item as _SalesOrderItem,
      CreatedByUser,
      _SalesOrder
}
