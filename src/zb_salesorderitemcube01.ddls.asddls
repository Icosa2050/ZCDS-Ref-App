@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Analytischer Cube 01 Auftragspositionen'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZB_SALESORDERITEMCUBE01
  as select from ZI_SalesOrderItem
{
  key SalesOrder,
      _SalesOrder,
  key SalesOrderItem,
      CreationDate,
      _SalesOrder.SalesOrganization,
      _SalesOrder._SalesOrganization,
      _SalesOrder.SoldToParty,
      _SalesOrder._SoldToParty,
      _SalesOrder._SoldToParty.Country as SoldToCountry,
      Product,
      _Product,
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      OrderQuantity,
      OrderQuantityUnit,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      NetAmount,
      TransactionCurrency
}
