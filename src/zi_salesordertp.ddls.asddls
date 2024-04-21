@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order'
define root view entity ZI_SalesOrderTP 
provider contract transactional_interface
as projection on ZR_SalesOrderTP
{
    key SalesOrder,
    SalesOrderType,
    SalesOrganization,
    SoldToParty as Customer,
    DistributionChannel,
    OrganizationDivision,
    NetAmount,
    TransactionCurrency,
    DeliveryStatus,
    @Consumption.hidden: true
    LastChangeDateTime,
    /* Associations */
    _Item : redirected to composition child ZI_SalesOrderItemTP,
    _SoldToParty
}
where DeletionIndicator = ' '
