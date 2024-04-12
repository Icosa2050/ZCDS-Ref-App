@AbapCatalog.sqlViewName: 'ZB_SOIC04'
@EndUserText.label: 'Cube 04 für Kundenauftragspositionen'
@AccessControl.authorizationCheck: #NOT_ALLOWED
@Analytics.dataCategory: #CUBE

define view ZB_SalesOrderItemCube04
  as select from ZI_SalesOrderItem
  association [0..1] to I_CalendarDate as _CreationDate
    on $projection.CreationDate = _CreationDate.CalendarDate
{
  key SalesOrder,
  key SalesOrderItem,
      _SalesOrder,
      CreationDate,
      _CreationDate.CalendarYear       as CreationYear,
      _CreationDate._CalendarYear      as _CalendarYear,
      _CreationDate.WeekDay            as CreationWeekDay,
      _CreationDate._WeekDay           as _WeekDay,
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
