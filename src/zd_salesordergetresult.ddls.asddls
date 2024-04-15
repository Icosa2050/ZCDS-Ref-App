@EndUserText.label: 'Sales Order Get Function Result'
define root abstract entity ZD_SalesOrderGetResult
{
  SalesOrder           : zvbeln;
  SalesOrderType       : zauart;
  SoldToParty          : zkunag;
  SalesOrganization    : zvkorg;
  DistributionChannel  : zvtweg;
  OrganizationDivision : zspart;
  DeliveryStatus       : zlfstk;
  _Items               : composition [0..*] of ZD_SalesOrderGetItemResult;
}
