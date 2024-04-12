@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Order Schedule Line'
define view entity ZR_SalesOrderScheduleLineTP
  as select from ZR_SalesOrderScheduleLine
  association [1..1] to ZR_SalesOrderTP            as _SalesOrder
    on $projection.SalesOrder = _SalesOrder.SalesOrder
  association        to parent ZR_SalesOrderItemTP as _SalesOrderItem
    on  $projection.SalesOrder     = _SalesOrderItem.SalesOrder
    and $projection.SalesOrderItem = _SalesOrderItem.SalesOrderItem
  association [1]    to ZI_USER                    as _CreatedByUser
    on $projection.CreatedByUser = _CreatedByUser.Userid
  association [1]    to ZI_USER                    as _LastChangedByUser
    on $projection.LastChangedByUser = _LastChangedByUser.Userid
{
  key ZR_SalesOrderScheduleLine.SalesOrder,
  key ZR_SalesOrderScheduleLine.SalesOrderItem,
  key ZR_SalesOrderScheduleLine.SalesOrderScheduleLine,
      ZR_SalesOrderScheduleLine.DeliveryDate,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      ZR_SalesOrderScheduleLine.OrderQuantity,
      ZR_SalesOrderScheduleLine.OrderQuantityUnit,
      ZR_SalesOrderScheduleLine.SalesOrderScheduleLineType,
      @Semantics.user.createdBy: true
      ZR_SalesOrderScheduleLine.CreatedByUser,
      @Semantics.systemDateTime.createdAt: true
      ZR_SalesOrderScheduleLine.CreationDateTime,
      @Semantics.user.lastChangedBy: true
      ZR_SalesOrderScheduleLine.LastChangedByUser,
      @Semantics.systemDateTime.lastChangedAt: true
      ZR_SalesOrderScheduleLine.LastChangeDateTime,
      _SalesOrder,
      _SalesOrderItem,
      _CreatedByUser,
      _LastChangedByUser
}
