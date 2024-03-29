@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'aggregate amount of ZI_SalesOrderView'
define view entity ZI_SalesOrderItem_Agg
  as select from ZI_SalesOrderItem as SalesOrderItem
{
  key SalesOrderItem.SalesOrder,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      sum(SalesOrderItem.NetAmount) as TotalNetAmount,
      SalesOrderItem.TransactionCurrency
}
group by
  SalesOrderItem.SalesOrder,
  SalesOrderItem.TransactionCurrency;
