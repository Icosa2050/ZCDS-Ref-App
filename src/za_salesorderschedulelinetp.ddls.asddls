@EndUserText.label: 'Sales Order Schedule Line'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@OData.entityType.name: 'SalesOrderScheduleLine_Type'
define view entity ZA_SalesOrderScheduleLineTP
  as projection on ZR_SalesOrderScheduleLineTP
{
  key SalesOrder,
  key SalesOrderItem,
  key SalesOrderScheduleLine,
      DeliveryDate,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      OrderQuantity,
      OrderQuantityUnit,
      CreatedByUser,
      CreationDateTime,
      LastChangedByUser,
      LastChangeDateTime,
      _SalesOrder     : redirected to ZA_SalesOrderTP,
      _SalesOrderItem : redirected to parent ZA_SalesOrderItemTP
}
