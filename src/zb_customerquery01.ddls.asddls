@AbapCatalog.sqlViewName: 'ZB_CUSTQ01'
@EndUserText.label: 'Query 01 für Kundendaten'
@AccessControl.authorizationCheck: #NOT_REQUIRED
//@Analytics.query:true
define view ZB_CustomerQuery01
  as select from ZI_Customer
{
  key Customer,
      Country,
      @AnalyticsDetails.query.axis: #ROWS
      //CityName,
      @Aggregation.default: #SUM
      1 as NumberOfCustomers
}
