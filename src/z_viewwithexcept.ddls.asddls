@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Except'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
//View but remove specific selection
define view entity Z_ViewWithExcept as select from Z_UnionViewAsDataSourceA
{
    key Field1
}
except select from Z_UnionViewAsDataSourceB

{
    key Field1
}
