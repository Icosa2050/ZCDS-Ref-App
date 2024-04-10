@AbapCatalog.sqlViewName: 'ZB_SOIC07'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Query 07 for SalesOrderItems'
define view ZB_SalesOrderItemQuery07
  as select from ZB_SalesOrderItemCube04
{
  @AnalyticsDetails.query.totals: #SHOW
  @AnalyticsDetails.query.display: #KEY_TEXT
  Product,
  _SalesOrganization._Text.SalesOrgName as SalesOrganization,
  @AnalyticsDetails.query.totals: #SHOW
  @AnalyticsDetails.query.axis: #ROWS
  SoldToParty,
  @AnalyticsDetails.query.sortDirection: #ASC
  _SoldToParty.CustomerName,
  OrderQuantity,
  OrderQuantityUnit,
  NetAmount,
  TransactionCurrency,
  @EndUserText.label: 'Verschiedene Materialien'  @AnalyticsDetails: {
  exceptionAggregationSteps: [{
  exceptionAggregationBehavior: #COUNT,
  exceptionAggregationElements: [ 'Material' ]
  }]
  }
  0                                     as DifferentMaterials
}
