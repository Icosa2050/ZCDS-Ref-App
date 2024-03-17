@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View C (Union Example)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewAsDataSourceC as select from zt000_dummy
{

  key cast( 'C' as abap.char(2) )  as FieldC1,
      cast( 'C2' as abap.char(2) ) as FieldC2
    
}
