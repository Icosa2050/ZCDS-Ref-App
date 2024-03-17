@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Session Variables'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewWithSessionVariables as select from ZI_SalesOrder
{
    $session.client          as ClientField,
  $session.system_date     as SystemDateField,
  $session.system_language as SystemLanguageField,
  $session.user            as UserField,
  $session.user_date       as UserDateField,
  $session.user_timezone   as UserTimezoneField
}
 
