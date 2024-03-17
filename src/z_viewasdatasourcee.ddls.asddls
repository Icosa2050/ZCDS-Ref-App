@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View E'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewAsDataSourceE
  as select distinct from zt000_dummy
{
  key cast( 'D' as abap.char(1) ) as FieldE1,
  key cast( 'H' as abap.char(1) ) as FieldE2
}
union select distinct from zt000_dummy
{
  key cast( 'D' as abap.char(1) ) as FieldE1,
  key cast( 'I' as abap.char(1) ) as FieldE2
}
union select distinct from  zt000_dummy 
{
  key cast( 'F' as abap.char(1) ) as FieldE1,
  key cast( 'I' as abap.char(1) ) as FieldE2
} 
