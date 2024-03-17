@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with optional Parameters'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewWithOptionalParameters
  with parameters
    @Environment.systemField: #SYSTEM_DATE
    P_KeyDate : abap.dats
  as select distinct from Z_ViewWithParametersDataSource
{
  key KeyField,
  key Language,
  key ValidityEndDate,
      ValidityStartDate
}
where
      ValidityEndDate   >= $parameters.P_KeyDate
  and ValidityStartDate <= $parameters.P_KeyDate
