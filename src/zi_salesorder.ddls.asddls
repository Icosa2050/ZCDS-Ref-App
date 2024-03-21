@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Order (CDS)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_SalesOrder

  as select from zsalesorder

  association [0..1] to ZI_SalesOrganization as _SalesOrganization
    on $projection.SalesOrganization = _SalesOrganization.Salesorganization

  composition [0..*] of ZI_SalesOrderItem    as _Item

  association [0..1] to ZI_Customer          as _SoldToParty
    on $projection.SoldToParty = _SoldToParty.Customer

{

  key salesorder           as SalesOrder,

      salesordertype       as SalesOrderType,

      @ObjectModel.foreignKey.association: '_SalesOrganization'

      salesorganization    as SalesOrganization,

      @ObjectModel.foreignKey.association: '_SoldToParty'

      soldtoparty          as SoldToParty,

      distributionchannel  as DistributionChannel,

      organizationdivision as OrganizationDivision,

      @Semantics.amount.currencyCode: 'TransactionCurrency'

      netamount            as NetAmount,

      transactioncurrency  as TransactionCurrency,

      deliverystatus       as DeliveryStatus,

      deletionindicator    as DeletionIndicator,

      createdbyuser        as CreatedByUser,

      creationdatetime     as CreationDateTime,

      lastchangedbyuser    as LastChangedByUser,

      lastchangedatetime   as LastChangeDateTime,

      _Item,

      _SalesOrganization,

      _SoldToParty

}
