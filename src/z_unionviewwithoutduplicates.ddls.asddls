@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union without Duplicates'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_UnionViewWithoutDuplicates as select from Z_ViewAsDataSourceA
{
    key FieldA1
}

union select from Z_ViewAsDataSourceA
{
key FieldA1
}
