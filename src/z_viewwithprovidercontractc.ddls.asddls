@ObjectModel.modelingPattern: #TRANSACTIONAL_QUERY
@EndUserText.label: 'root view transactional query'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity Z_ViewWithProviderContractC
  provider contract transactional_query
  as projection on Z_ViewWithProviderContractB
{
  key KeyField
}
