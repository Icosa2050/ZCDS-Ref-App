@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Analytischer Cube 06 Auftragspositionen'
@Metadata.ignorePropagatedAnnotations: true
@Analytics.dataCategory: #CUBE
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define transient view entity ZB_SALESORDERITEMCUBE06
  provider contract analytical_query
  as projection on ZB_SALESORDERITEMCUBE01
{
  SalesOrder,
  _SalesOrder,
  SalesOrderItem,
  CreationDate,
  _SalesOrder.SalesOrganization,
  _SalesOrder._SalesOrganization,
  _SalesOrder.SoldToParty,
  _SalesOrder._SoldToParty,
  _SalesOrder._SoldToParty.Country as SoldToCountry,
  @Aggregation.default: #SUM
  @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
  OrderQuantity,
  OrderQuantityUnit,
  @Aggregation.default: #SUM
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  NetAmount,
  TransactionCurrency,
  @Aggregation.default: #MAX
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  _SalesOrder.TotalNetAmount
}
