@ObjectModel.modelingPattern: #TRANSACTIONAL_INTERFACE
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'root view transactional'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity Z_ViewWithProviderContractB provider contract transactional_interface
as projection on  Z_ViewWithProviderContractA
{
    key KeyField
}
