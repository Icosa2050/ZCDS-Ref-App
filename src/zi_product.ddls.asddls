@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product (CDS-View)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: {
serviceQuality:#X,
sizeCategory: #S,
dataClass:#MIXED

}
define root view entity ZI_Product
  as select from zproduct_ic
  association [0..*] to ZI_ProductText as _Text on $projection.Product = _Text.Product
  composition [0..*] of ZI_ProductText as _ProductText
{
  key product             as Product,
      product_type        as ProductType,
      authorization_group as AuthorizationGroup,
      creation_date_time  as CreationDateTime,
      _ProductText,
      _Text
}
