@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product for Access Control'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_ProductForAccessControl
  as select from zt000_dummy
{
  key 'P1' as Product,
      'A1' as AuthorizationGroup
}
union select distinct from zt000_dummy
{
  key 'P2' as Product,
      'A2' as AuthorizationGroup
}
