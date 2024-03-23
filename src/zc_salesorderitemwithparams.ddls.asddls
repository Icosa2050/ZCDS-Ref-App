@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Parameters'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_SalesOrderItemWithParams
  with parameters
    P_PARAMETER2A : abap.char(1),
    P_PARAMETER2B : abap.char(1)

  as select from ZI_SalesOrder
  association [0..1] to ZC_SalesOrderWithParameters as _SalesOrder
    on $projection.SalesOrder = _SalesOrder.SalesOrder
{
  key SalesOrder,
      SalesOrderType,
      /* Associations */
      _SalesOrder
}
