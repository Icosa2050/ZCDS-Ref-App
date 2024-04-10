@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Query 01 für SalesOrderItems'
@Metadata.ignorePropagatedAnnotations: true
define transient view entity ZB_SalesOrderItemQuery01
  provider contract analytical_query
  as projection on ZB_SALESORDERITEMCUBE01
{

  SalesOrder,
  SalesOrderItem,
  CreationDate,
  SalesOrganization,
  SoldToParty,
  SoldToCountry,
  Material,
  @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
  OrderQuantity,
  OrderQuantityUnit,
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  NetAmount,
  TransactionCurrency,
  /* Associations */
  _Material,
  _SalesOrder,
  _SalesOrganization,
  _SoldToParty
}
