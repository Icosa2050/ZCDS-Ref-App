@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_PRODUCT_IC000'
@ObjectModel.semanticKey: [ 'Product' ]
define root view entity ZC_PRODUCT_IC000
  provider contract transactional_query
  as projection on ZR_PRODUCT_IC000
{
  key Product,
  ProductType,
  AuthorizationGroup,
  Price,
  Currency,
  CreationDateTime,
  LocalLastChangedAt
  
}
