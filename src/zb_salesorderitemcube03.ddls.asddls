@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cube 03'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZB_SALESORDERITEMCUBE03
  as select from ZI_SalesOrderItem
{
      @ObjectModel.foreignKey.association: '_SalesOrder'
  key SalesOrder,
      _SalesOrder,
  key SalesOrderItem,
      CreationDate,
      @ObjectModel.foreignKey.association: '_SalesOrganization'
      _SalesOrder.SalesOrganization,
      _SalesOrder._SalesOrganization,
      @ObjectModel.foreignKey.association: '_SoldToParty'
      _SalesOrder.SoldToParty,
      _SalesOrder._SoldToParty,
      _SalesOrder._SoldToParty.Country as SoldToCountry,
      @ObjectModel.foreignKey.association: '_Product'
      Product,
      _Product,
      @Aggregation.default: #SUM  @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      OrderQuantity,
      OrderQuantityUnit,
      @Aggregation.default: #SUM  @Semantics.amount.currencyCode: 'TransactionCurrency'
      NetAmount,
      TransactionCurrency
}
