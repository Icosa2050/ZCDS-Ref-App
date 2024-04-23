@EndUserText.label: 'Sales Order'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@OData.entityType.name: 'SalesOrder_Type'
define root view entity ZA_SalesOrderTP
  provider contract transactional_query
  as projection on ZR_SalesOrderTP
{
  key SalesOrder,
      SalesOrderType,
      SalesOrganization,
      SoldToParty,
      DistributionChannel,
      OrganizationDivision,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      NetAmount,
      TransactionCurrency,
      DeliveryStatus,
      DeliveryIsCompleted,
      DeletionIndicator,
      CreatedByUser,
      CreationDateTime,
      LastChangedByUser,
      LastChangeDateTime,
   _Item : redirected to composition child ZA_SalesOrderItemTP
}
