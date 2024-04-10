@AbapCatalog.sqlViewName: 'ZB_SOIC06'
@EndUserText.label: 'Query 02 für Kundenauftragspositionen'
@AccessControl.authorizationCheck: #NOT_ALLOWED
@Analytics.dataCategory: #CUBE

define view ZB_SALESORDERITEMQUERY06
  as select from ZB_SalesOrderItemCube04
{
  SalesOrder,
  SalesOrderItem,
  _SalesOrder,
  CreationDate,
  _SalesOrder.SalesOrganization,
  _SalesOrder.SoldToParty,
  _SalesOrder._SoldToParty.Country                                as SoldToCountry,
  Product,
  _Product,
  @Aggregation.default: #SUM
  @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
  OrderQuantity,
  OrderQuantityUnit,
  @Aggregation.default: #SUM
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  NetAmount,
  TransactionCurrency,
  @Aggregation.default: #MIN
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  cast (division(NetAmount, OrderQuantity,2 ) as abap.curr(15,2)) as AmountPerUnitMin,
  @Aggregation.default: #MAX
  @Semantics.amount.currencyCode: 'TransactionCurrency'
  cast (division(NetAmount, OrderQuantity,2 ) as abap.curr(15,2)) as AmountPerUnitMax,
  @EndUserText.label: 'MO-MI Menge'
  case when CreationWeekDay <= '3'
  then OrderQuantity
  else 0
  end                                                             as MondayToWednesdayQuantity,
  @EndUserText.label: 'DO-SO Menge'
  case when CreationWeekDay >= '4'
  then OrderQuantity
  else 0
  end                                                             as ThursdayToSundayQuantity,
  @EndUserText.label: 'MO-MI Wert'
  case when CreationWeekDay <= '3' then NetAmount
  else 0
  end                                                             as MondayToWednesdayAmount,
  @EndUserText.label: 'DO-SO Wert'
  case when CreationWeekDay >= '4' then NetAmount
  else 0
  end                                                             as ThursdayToSundayAmount


}
where
  OrderQuantity > 0
