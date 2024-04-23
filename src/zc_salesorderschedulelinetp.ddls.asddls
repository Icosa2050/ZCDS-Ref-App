@EndUserText.label: 'Sales Order Schedule Line'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@OData.entityType.name: 'SalesOrderScheduleLine_Type'
define view entity ZC_SalesOrderScheduleLineTP
  as projection on ZR_SalesOrderScheduleLineTP
{
  key SalesOrder,
  key SalesOrderItem,
  key SalesOrderScheduleLine,
      DeliveryDate,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      OrderQuantity,
      @Consumption.valueHelpDefinition: [{entity.name: 'I_UnitOfMeasureStdVH', entity.element: 'UnitOfMeasure'}]
      OrderQuantityUnit,
      @ObjectModel.text.element: ['CreatedByUserDescription']
      CreatedByUser,
      _CreatedByUser.UserDescription     as CreatedByUserDescription,
      CreationDateTime,
      @ObjectModel.text.element: ['LastChangedByUserDescription']
      LastChangedByUser,
      _LastChangedByUser.UserDescription as LastChangedByUserDescription,
      LastChangeDateTime,
      _SalesOrder     : redirected to ZC_SalesOrderTP
      ,
      _SalesOrderItem : redirected to parent ZC_SalesOrderItemTP
}


