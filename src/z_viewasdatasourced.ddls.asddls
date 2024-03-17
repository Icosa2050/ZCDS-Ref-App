@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View D'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_VIEWAsDataSourceD as select distinct from zt000_dummy
{
    
    
    key cast( 'A' as abap.char(1) ) as FieldD1,
      cast( 'D' as abap.char(1) ) as FieldD2
    
}

union select distinct from zt000_dummy
{
  key cast( 'C' as abap.char(1) ) as FieldD1,
      cast( 'E' as abap.char(1) ) as FieldD2
} 
