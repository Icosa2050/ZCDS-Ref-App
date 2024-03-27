@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View for own aspects to separate users'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewAsDAtaSourceForDclAspect
  as select from zt000_dummy
{
  key dummyfield,
  key cast ( abap.char'USER_A' as abap.char(12) ) as UserId,
      abap.char'TAF'                              as SAlesOrderType
}
union select from zt000_dummy
{
  key dummyfield,
  key cast ( abap.char'USER_B' as abap.char(12) ) as UserId,
      abap.char'OAF'                              as SAlesOrderType
}
