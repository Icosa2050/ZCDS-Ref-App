@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View without Associations'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_UnionViewWithoutAssociations as select from Z_ViewAsDataSourceA
{
      @EndUserText.label: 'Label of UnionField1'
  key FieldA1 as UnionField1,
  key FieldA2 as UnionField2,
  key FieldA3 as UnionField3
}
union select from Z_ViewAsDataSourceB
{
  key FieldB1 as UnionField1,
  key FieldB2 as UnionField2,
  key ''      as UnionField3
} 
