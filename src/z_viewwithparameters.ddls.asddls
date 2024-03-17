@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Parameters'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewWithParameters with parameters 
P_KeyDate:abap.dats,
P_language:sylangu

as select from Z_ViewWithParametersDataSource
association [0..*] to Z_ViewWithParametersAscTarget as _Target
on $projection.KeyField = _Target.KeyField
association [0..1]  to Z_ViewWithParametersAscTarget as _FilteredTarget
on $projection.KeyField = _FilteredTarget.KeyField
and $projection.Language = _FilteredTarget.Language

{
    key KeyField,
    key $parameters.P_language as Language,
    key ValidityEndDate,
    ValidityStartDate,
    _Target(P_ValidityDate:$parameters.P_KeyDate)
    [1:Language=$parameters.P_language].KeyField as TargetKeyField,
    _FilteredTarget
}
where ValidityEndDate >= $parameters.P_KeyDate
and ValidityStartDate <= $parameters.P_KeyDate
and Language = $parameters.P_language
