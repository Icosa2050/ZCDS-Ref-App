@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with renaming fields'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_SalesOrderWithRenamedFields
  as select from ZI_SalesOrder
{
  key SalesOrder           as RenamedSalesOrder,
      SalesOrderType       as RenamedSalesOrderType,
      ZI_SalesOrder._Item  as Item,
      SalesOrganization    as Organization,
      SoldToParty          as SoldToParty,
      DistributionChannel  as DistributionChannel,
      OrganizationDivision as OrganizationDivision,
      SalesOrganization    as SalesOrganization,
      /* Associations */
      _Item,
      _SoldToParty
}
