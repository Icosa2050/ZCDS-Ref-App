@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with outer joins'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewWithLeftOuterJoins
  as select from            Z_VIEWAsDataSourceD
    left outer one to many join Z_ViewAsDataSourceE
      on Z_VIEWAsDataSourceD.FieldD2 = Z_ViewAsDataSourceE.FieldE1
{
  key Z_VIEWAsDataSourceD.FieldD1,
  key Z_VIEWAsDataSourceD.FieldD2,
  key Z_ViewAsDataSourceE.FieldE2
} 
