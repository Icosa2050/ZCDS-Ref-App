@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Currency Conversion'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewWithCurrencyConversions

  with parameters
    P_DisplayCurrency  : waers_curc,
    P_ExchangeRateDate : abap.dats
  as select from ZI_SalesOrderItem
{
  key SalesOrder,
  key SalesOrderItem,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      NetAmount,
      TransactionCurrency,
      @Semantics.amount.currencyCode: 'DisplayCurrency'
      currency_conversion( amount => NetAmount,
      source_currency    => TransactionCurrency,
      target_currency    => $parameters.P_DisplayCurrency,
      exchange_rate_date => $parameters.P_ExchangeRateDate,
      exchange_rate_type => 'M',
      round              => 'X',
      decimal_shift      => 'X',                
      decimal_shift_back => 'X',                
      error_handling     => 'FAIL_ON_ERROR' ) 
      as NetAmountInDisplayCurrency,
      $parameters.P_DisplayCurrency                                                                                               as DisplayCurrency
}
