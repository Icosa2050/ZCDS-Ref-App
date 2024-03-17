@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View A (Union Example)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewAsDataSourceA
  as select distinct from zt000_dummy
  association [0..1] to Z_ViewAsDataSourceC as _ViewC on $projection.FieldA3 = _ViewC.FieldC1
{
  key cast( 'A' as abap.char(1) ) as FieldA1,
      cast( 'B' as abap.char(1) ) as FieldA2,
      cast( 'C' as abap.char(2) ) as FieldA3,
      _ViewC
}
