@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Cube of views'
@Metadata.ignorePropagatedAnnotations: true
@Analytics.dataCategory: #CUBE
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_SalesOrderItemCube
  with parameters
    @Consumption.defaultValue: 'EUR'
    P_DisplayCurrency : waers
  as select from           ZI_SalesOrderItem as ITEM
    left outer to one join ZI_SalesOrder     as SO   on SO.SalesOrder = ITEM.SalesOrder
    left outer to one join ZI_Product        as PROD on PROD.Product = ITEM.Product
{
  key ITEM.SalesOrder,
  key ITEM.SalesOrderItem,
      ITEM.Product,
      SO.SalesOrderType,
      PROD.ProductType,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ITEM.NetAmount,
      ITEM.TransactionCurrency,
      $parameters.P_DisplayCurrency as DisplayCurrency,
      @DefaultAggregation: #SUM
      @Semantics.amount.currencyCode: 'DisplayCurrency'
      currency_conversion(        amount             => ITEM.NetAmount,
      source_currency    => ITEM.TransactionCurrency,
      target_currency    => $parameters.P_DisplayCurrency,
      exchange_rate_date => '17980101',
      //exchange_rate_type => 'M',
      error_handling     =>   'SET_TO_NULL',
      round              => 'X',
      decimal_shift      => 'X',
      decimal_shift_back => 'X'
      )                             as NetAmountInDisplayCurrency
}
