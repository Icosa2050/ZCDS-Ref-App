@EndUserText.label: 'Sales Order Get Item Function Result'
define abstract entity ZD_SalesOrderGetItemResult
{
  SalesOrderItem      : zposnr_ic;
  Product             : matnr;
  @Semantics.quantity.unitOfMeasure : 'OrderQuantityUnit'
  OrderQuantity       : zkwmeng;
  OrderQuantityUnit   : zvrkme;
  @Semantics.amount.currencyCode : 'TransactionCurrency'
  NetAmount           : znetwr_ap;
  TransactionCurrency : zwaerk;
  _DummyAssociation   : association to parent ZD_SalesOrderGetResult;
  _ScheduleLines      : composition [0..*] of ZD_SalesOrderGetScheduleLineR;
}
