@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED ZPRODUCT_IC'
define root view entity ZR_PRODUCT_IC
  as select from zproduct_ic
{
  key product as Product,
  product_type as ProductType,
  authorization_group as AuthorizationGroup,
  @Semantics.amount.currencyCode: 'Currency'
  price as Price,
  currency as Currency,
  creation_date_time as CreationDateTime,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
  
}
