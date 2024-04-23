@EndUserText.label: 'Sales Order Item'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@OData.entityType.name: 'SalesOrderItem_Type'
define view entity ZA_SalesOrderItemTP
  as projection on ZR_SalesOrderItemTP
{
  key     SalesOrder,
  key     SalesOrderItem,
          Product,
          @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
          OrderQuantity,
          OrderQuantityUnit,
          @Semantics.amount.currencyCode: 'TransactionCurrency'
          NetAmount,
          TransactionCurrency,
          CreatedByUser,
          CreationDateTime,
          LastChangedByUser,
          LastChangeDateTime,
          _SalesOrder   : redirected to parent ZA_SalesOrderTP,
          _ScheduleLine : redirected to composition child ZA_SalesOrderScheduleLineTP
          
}
