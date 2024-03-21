@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View for AccessControl on SalesOrderItem'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_SlsOrdItemForAccessControl
  as select from zt000_dummy
  association [0..1] to ZC_ProductForAccessControl as _Product
    on $projection.Product = _Product.Product
{
  key 'S1' as SalesOrder,
  key 'I1' as SalesOrderItem,
      'P1' as Product,
      _Product
}
union select distinct from zt000_dummy
association [0..1] to ZC_ProductForAccessControl as _Product
  on $projection.Product = _Product.Product
{
  key 'S1' as SalesOrder,
  key 'I2' as SalesOrderItem,
      'P1' as Product,
      _Product
}
union select distinct from zt000_dummy
association [0..1] to ZC_ProductForAccessControl as _Product
  on $projection.Product = _Product.Product
{
  key 'S2' as SalesOrder,
  key 'I1' as SalesOrderItem,
      'P1' as Product,
      _Product
}
union select distinct from zt000_dummy
association [0..1] to ZC_ProductForAccessControl as _Product
  on $projection.Product = _Product.Product
{
  key 'S2' as SalesOrder,
  key 'I2' as SalesOrderItem,
      'P2' as Product,
      _Product
}
union select distinct from zt000_dummy
association [0..1] to ZC_ProductForAccessControl as _Product
  on $projection.Product = _Product.Product
{
  key 'S3' as SalesOrder,
  key 'I1' as SalesOrderItem,
      ''   as Product,
      _Product
}
