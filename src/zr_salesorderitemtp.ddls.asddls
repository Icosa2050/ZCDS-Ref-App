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
  as select from ZR_SalesOrderItem_IC as ZR_SalesOrderItem
  association        to parent ZR_SalesOrderTP      as _SalesOrder            on  $projection.SalesOrder = _SalesOrder.SalesOrder
  composition [0..*] of ZR_SalesOrderScheduleLineTP as _ScheduleLine
  association [0..*] to ZR_SalesOrderScheduleLineTP as _RequestedScheduleLine on  $projection.SalesOrder     = _RequestedScheduleLine.SalesOrder
                                                                              and $projection.SalesOrderItem = _RequestedScheduleLine.SalesOrderItem
                                                                              and 'R'                        = _RequestedScheduleLine.SalesOrderScheduleLineType
  association [0..*] to ZR_SalesOrderScheduleLineTP as _ConfirmedScheduleLine on  $projection.SalesOrder     = _ConfirmedScheduleLine.SalesOrder
                                                                              and $projection.SalesOrderItem = _ConfirmedScheduleLine.SalesOrderItem
                                                                              and 'C'                        = _ConfirmedScheduleLine.SalesOrderScheduleLineType
  association [0..1] to ZI_Product                  as _Product               on  $projection.Product = _Product.Product
  association [1..1]    to ZI_USER                      as _CreatedByUser         on  $projection.CreatedByUser = _CreatedByUser.Userid
  association [1..1]    to ZI_USER                      as _LastChangedByUser     on  $projection.LastChangedByUser = _LastChangedByUser.Userid
{
      @ObjectModel.foreignKey.association: '_SalesOrder'
  key ZR_SalesOrderItem.SalesOrder,
  key ZR_SalesOrderItem.SalesOrderItem,
      ZR_SalesOrderItem.Product,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      ZR_SalesOrderItem.OrderQuantity,
      ZR_SalesOrderItem.OrderQuantityUnit,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZR_SalesOrderItem.NetAmount,
      ZR_SalesOrderItem.TransactionCurrency,
      @Semantics.user.createdBy: true
      ZR_SalesOrderItem.CreatedByUser,
      @Semantics.systemDateTime.createdAt: true
      ZR_SalesOrderItem.CreationDateTime,
      @Semantics.user.lastChangedBy: true
      ZR_SalesOrderItem.LastChangedByUser,
      @Semantics.systemDateTime.lastChangedAt: true
      ZR_SalesOrderItem.LastChangeDateTime,
      _SalesOrder,
      _ScheduleLine,
      _Product,
      _RequestedScheduleLine,
      _ConfirmedScheduleLine,
      _CreatedByUser,
      _LastChangedByUser
}
/*
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
      ZR_SalesorderItem.LastChangeDateTime as LastChangeDateTime,
      ZR_SalesorderItem.CreatedByUser as CreatedByUser,
      ZR_SalesorderItem.LastChangedByUser  as LastChangedByUser,
      ZR_SalesorderItem.CreationDateTime  as CreationDateTime,
      _Product,
      _SalesOrder,
      _ScheduleLine,
      _RequestedScheduleLine,
      _ConfirmedScheduleLine
}
*/
