@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Source for intersect'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_UnionViewAsDataSourceA as select from zt000_dummy
{
  key 'A' as Field1
}
union all select distinct from zt000_dummy
{
 key 'B' as Field1
 
}
