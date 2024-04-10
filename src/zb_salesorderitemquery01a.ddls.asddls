@EndUserText.label: 'Query 01A für Kundenauftragspositionen'
@AccessControl.authorizationCheck: #NOT_ALLOWED
transient view entity ZB_SalesOrderItemQuery01A
  provider contract analytical_query
  as projection on ZB_SALESORDERITEMCUBE01
{
  Material,
  SoldToParty,
  SoldToCountry,
  OrderQuantity,
  OrderQuantityUnit,
  NetAmount,
  TransactionCurrency
}
