@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_SalesOrderItemTP
  as select from ZR_SalesOrderItem_IC as ZR_SalesorderItem
  association        to parent ZR_SalesOrderTP      as _SalesOrder
    on $projection.SalesOrder = _SalesOrder.SalesOrder
  composition of many ZR_SalesOrderScheduleLineTP   as _ScheduleLine
  association [0..*] to ZR_SalesOrderScheduleLineTP as _RequestedScheduleLine
    on  $projection.SalesOrder     = _RequestedScheduleLine.SalesOrder
    and $projection.SalesOrderItem = _RequestedScheduleLine.SalesOrderItem
    and 'R'                        = _RequestedScheduleLine.SalesOrderScheduleLineType
  association [0..*] to ZR_SalesOrderScheduleLineTP as _ConfirmedScheduleLine
    on  $projection.SalesOrder     = _ConfirmedScheduleLine.SalesOrder
    and $projection.SalesOrderItem = _ConfirmedScheduleLine.SalesOrderItem
    and 'C'                        = _ConfirmedScheduleLine.SalesOrderScheduleLineType

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
      _ScheduleLine,
      _RequestedScheduleLine,
      _ConfirmedScheduleLine
}
