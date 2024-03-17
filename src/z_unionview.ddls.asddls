@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union View Example'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_UnionView as select from Z_ViewAsDataSourceA
association [0..1] to Z_ViewAsDataSourceC as _ViewC
on $projection.UnionField1  = _ViewC.FieldC1
{
    @EndUserText.label: 'Label of UnionField1'
    key FieldA1 as UnionField1,
    key FieldA2 as UnionField2,
    key FieldA3 as UnionField3,
    /* Associations */
    _ViewC
}
union select from Z_ViewAsDataSourceB
  association [0..1] to Z_ViewAsDataSourceC as _ViewC 
    on $projection.UnionField1 = _ViewC.FieldC1
{
  key FieldB2  as UnionField1,
  key FieldB1  as UnionField2,
  key ''       as UnionField3,
      _ViewC
} 
