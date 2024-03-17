@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union with Duplicates'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_UnionViewWihDuplicates as select from Z_ViewAsDataSourceA
{
    key FieldA1
}
union all select  from Z_ViewAsDataSourceA

{
    key FieldA1
}
