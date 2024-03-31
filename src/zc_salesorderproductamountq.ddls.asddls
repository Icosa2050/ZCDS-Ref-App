@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'derived view with projection'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define transient view entity ZC_SalesOrderProductAmountQ
  provider contract analytical_query
  with parameters
    @Consumption.defaultValue: 'EUR'
    P_DisplayCurrency : waers
  as projection on ZI_SalesOrderItemCube(P_DisplayCurrency : $parameters.P_DisplayCurrency )
{
  SalesOrder,
  Product,
  SalesOrderType,
  ProductType,
  @Semantics.amount.currencyCode: 'DisplayCurrency'
  NetAmount,
  TransactionCurrency,
  DisplayCurrency
}
