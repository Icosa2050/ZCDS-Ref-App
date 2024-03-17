@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union with Associations'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_UnionViewAssociations as select from Z_UnionViewWithoutAssociations
association [0..1] to Z_ViewAsDataSourceC as _ViewC
on $projection.UnionField1 = _ViewC.FieldC1
{
    key UnionField1,
    key UnionField2,
    key UnionField3,
    _ViewC
}
