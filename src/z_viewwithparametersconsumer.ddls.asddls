@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View  Consumer with Parameters'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewWithParametersConsumer as select from Z_ViewWithParameters(
P_KeyDate: $session.system_date,
P_language: 'E')
{
    key KeyField,
    key Language,
    key ValidityEndDate
    /* ,
    key Language,
    key ValidityEndDate,
    ValidityStartDate,
    TargetKeyField,
    */
    /* Associations */
    /*
    
    _FilteredTarget
    */
}
