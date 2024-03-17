@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Parameters AscTarget'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewWithParametersAscTarget
  with parameters
    P_ValidityDate : abap.dats
  as select from Z_ViewWithParametersDataSource
{
  key KeyField,
  key Language,
  key ValidityEndDate,
      ValidityStartDate
}
where
      ValidityEndDate   >= $parameters.P_ValidityDate
  and ValidityStartDate <= $parameters.P_ValidityDate
