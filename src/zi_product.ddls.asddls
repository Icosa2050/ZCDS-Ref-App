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
  composition [0..*] of ZI_ProductText as _Text
{
  key product            as Product,
      product_type       as ProductType,
      creation_date_time as CreationDateTime,
      _Text
}
