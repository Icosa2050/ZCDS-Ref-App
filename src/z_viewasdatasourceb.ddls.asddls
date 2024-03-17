@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View B (Union Example)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewAsDataSourceB as select from zt000_dummy
{

    key cast( 'B_X' as abap.char(3) ) as FieldB1,
      cast( 'A' as abap.char(1) )   as FieldB2
    
}
