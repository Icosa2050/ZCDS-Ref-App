@AbapCatalog.sqlViewName: 'ZB_SOIC05C'
@EndUserText.label: 'Cube 05 für Kundenauftragspositionen'
@AccessControl.authorizationCheck: #NOT_ALLOWED
@Analytics.dataCategory: #CUBE

define view ZB_SalesOrderItemCube05
  as select from ZI_SalesOrderItem
  association [0..1] to I_CalendarDate as _CreationDate
    on $projection.CreationDate = _CreationDate.CalendarDate
{
  SalesOrder,
  SalesOrderItem,
  _SalesOrder,
  CreationDate,
  _CreationDate.CalendarYear                                                 as CreationYear,
  _CreationDate._CalendarYear                                                as _CalendarYear,
  _CreationDate.WeekDay                                                      as CreationWeekDay,
  _CreationDate._WeekDay                                                     as _WeekDay,
  _SalesOrder.SalesOrganization,
  _SalesOrder._SalesOrganization,
  _SalesOrder.SoldToParty,
  _SalesOrder._SoldToParty,
  _SalesOrder._SoldToParty.Country                                           as SoldToCountry,
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
  @Aggregation.default: #MIN  @Semantics.amount.currencyCode: 'TransactionCurrency'
  cast( division( NetAmount, OrderQuantity, 2 )         as abap.curr(15,2) ) as AmountPerUnitMin,
  @Aggregation.default: #MAX  @Semantics.amount.currencyCode: 'TransactionCurrency'
  cast( division( NetAmount, OrderQuantity, 2 )         as abap.curr(15,2) ) as AmountPerUnitMax
}
where
  OrderQuantity > 0
