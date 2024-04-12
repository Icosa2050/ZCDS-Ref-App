@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Schedule Line'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_SalesOrderScheduleLine
  as select from ZI_SalesOrderScheduleLine
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
      SalesOrderScheduleLineType,
      /* Associations */
      _SalesOrder,
      _SalesOrderItem
}
