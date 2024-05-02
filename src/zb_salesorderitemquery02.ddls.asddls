@EndUserText.label: 'Query 02 für Kundenauftragspositionen'
@AccessControl.authorizationCheck: #NOT_ALLOWED
@Analytics.query: true
define view entity ZB_SALESORDERITEMQUERY02
  as select from ZB_SALESORDERITEMCUBE01
{
  key SalesOrder,
  key SalesOrderItem,

      @AnalyticsDetails.query.axis: #ROWS
      @AnalyticsDetails.query.totals: #SHOW
      @AnalyticsDetails.query.display: #KEY_TEXT
      Material,
      @AnalyticsDetails.query.axis: #COLUMNS
      //_SalesOrganization.Description as SalesOrganizationName,
      @AnalyticsDetails.query.totals: #SHOW
      SoldToParty,
      @AnalyticsDetails.query.sortDirection: #ASC
      _SoldToParty.CustomerName,
      //  _SoldToParty.CityName,
      @EndUserText.label: 'Land des Auftraggebers'
      SoldToCountry,
      @AnalyticsDetails.query.hidden: true
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      OrderQuantity,
      OrderQuantityUnit,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Nettobetrag'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      NetAmount,
      TransactionCurrency
}
