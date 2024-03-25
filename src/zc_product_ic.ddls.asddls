@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_PRODUCT_IC'
@ObjectModel.semanticKey: [ 'Product' ]
define root view entity ZC_PRODUCT_IC
  provider contract transactional_query
  as projection on ZR_PRODUCT_IC
{
  key Product,
      ProductType,
      AuthorizationGroup,
      Price,
      Currency,
      CreationDateTime,
      LocalLastChangedAt,
      LocalLastChangedBy
}
