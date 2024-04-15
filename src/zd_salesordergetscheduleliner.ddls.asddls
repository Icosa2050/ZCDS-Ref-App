@EndUserText.label: 'Sales Order Get SLine Function Result'
define abstract entity ZD_SalesOrderGetScheduleLineR
{
  SalesOrderScheduleLine : zetenr;
  @Semantics.quantity.unitOfMeasure : 'OrderQuantityunit'
  OrderQuantity          : zkwmeng;
  OrderQuantityUnit      : zvrkme;
  DeliveryDate           : zedatu;
  _DummyAssociation      : association to parent ZD_SalesOrderGetItemResult;
}
