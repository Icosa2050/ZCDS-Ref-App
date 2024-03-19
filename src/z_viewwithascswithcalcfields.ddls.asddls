@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'view with calulated fields'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewWithAscsWithCalcFields
  as select from ZI_SalesOrderItem
  association [0..1] to ZI_Product as _Product
    on ZI_SalesOrderItem.Product = _Product.Product
  association [0..1] to ZI_Product as _ProductWithAlias
    on $projection.ProductWithAlias = _ProductWithAlias.Product
  association [0..1] to ZI_Product as _ProductWithCast
    on $projection.ProductWithCast = _ProductWithCast.Product
  association [0..1] to ZI_Product as _ProductWithCastPreservingType
    on $projection.ProductWithCastPreservingType = _ProductWithCastPreservingType.Product
{
  key SalesOrder,
  key SalesOrderItem,
      Product,
      _Product,
      _Product.ProductType,
      Product                                    as ProductWithAlias,
      _ProductWithAlias,
      _ProductWithAlias.ProductType              as ProductTypeWithAlias,
      cast (Product as matnr)                    as ProductWithCast,
      _ProductWithCast,
      cast (Product as matnr preserving type)    as ProductWithCastPreservingType,
      _ProductWithCastPreservingType,
      _ProductWithCastPreservingType.ProductType as ProdTypeWithCastPreservingType
}
