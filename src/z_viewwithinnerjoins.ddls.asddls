@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with inner joins'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
//inner join based on one field
define view entity Z_VIEWWITHINNERJOINS as select from Z_VIEWAsDataSourceD
inner join   Z_ViewAsDataSourceE
      on Z_VIEWAsDataSourceD.FieldD2 = Z_ViewAsDataSourceE.FieldE1
{
  key Z_VIEWAsDataSourceD.FieldD1,
  key Z_VIEWAsDataSourceD.FieldD2,
  key Z_ViewAsDataSourceE.FieldE2
} 
