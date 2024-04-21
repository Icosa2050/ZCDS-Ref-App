@EndUserText.label: 'Sales Order Created'
define abstract entity ZD_SalesOrderCreated
{
  @Event.raisedAt.dateTime: true
  EventRaisedDateTime  : abp_lastchange_tstmpl;
  SalesOrderType       : zauart;
  SalesOrganization    : zvkorg;
  DistributionChannel  : zvtweg;
  OrganizationDivision : zspart;
}


