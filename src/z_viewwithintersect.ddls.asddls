@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Intersect'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewWithIntersect as select from Z_UnionViewAsDataSourceA
{
  key Field1
}
intersect select from Z_UnionViewAsDataSourceB
{
  key Field1
} 
