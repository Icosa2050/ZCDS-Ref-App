@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_SALESORDERITEMTP_2
  as select from ZI_SalesOrderItem
  association to parent ZR_SalesOrderTP_2           as _SalesOrder
    on $projection.SalesOrder = _SalesOrder.SalesOrder
  composition of many ZR_SalesOrderScheduleLineTP_2 as _ScheduleLine

{
  key SalesOrder,
  key SalesOrderItem,
      Product,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      OrderQuantity,
      OrderQuantityUnit,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      NetAmount,
      TransactionCurrency,
      CreationDate,
      /* Associations */
      _Product,
      _SalesOrder,
      _ScheduleLine
}
