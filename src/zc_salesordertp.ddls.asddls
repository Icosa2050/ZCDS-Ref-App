@EndUserText.label: 'Sales Order'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@OData.entityType.name: 'SalesOrder_Type'
@ObjectModel.semanticKey: ['SalesOrder']
define root view entity ZC_SalesOrderTP
  provider contract transactional_query
  as projection on ZR_SalesOrderTP
{
  key SalesOrder,
      SalesOrderType,
      @Consumption.valueHelpDefinition: [{entity:{name:'ZI_SalesOrganization',element:'SalesOrganization'},useForValidation: true}]
      SalesOrganization,
      @ObjectModel.text.element: ['CustomerName']
      @Consumption.valueHelpDefinition: [{entity:{name:'ZI_Customer',element: 'Customer'}}]
      SoldToParty,
      _SoldToParty.CustomerName,
      DistributionChannel,
      OrganizationDivision,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      NetAmount,
      @Consumption.valueHelpDefinition: [{entity:{name:'I_CurrencyStdVH',element:'Currency'}}]
      TransactionCurrency,
      DeliveryStatus,
      DeliveryIsCompleted,
      DeletionIndicator,
      @ObjectModel.text.element: ['CreatedByUserDescription']
      CreatedByUser,
      _CreatedByUser.UserDescription     as CreatedByUserDescription,
      CreationDateTime,
      @ObjectModel.text.element: ['LastChangedByUserDescription']
      LastChangedByUser,
      _LastChangedByUser.UserDescription as LastChangedByUserDescription,
      LastChangeDateTime
      ,
      _Item : redirected to composition child ZC_SalesOrderItemTP
}


