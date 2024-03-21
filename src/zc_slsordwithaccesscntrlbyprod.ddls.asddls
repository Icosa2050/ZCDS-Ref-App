@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View Access from Product to Order'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_SlsOrdWithAccessCntrlByProd
  as select distinct from zt000_dummy
  association [0..*] to ZC_SlsOrdItemForAccessControl as _Item
    on $projection.SalesOrder = _Item.SalesOrder
{
  key 'S1' as SalesOrder,
      _Item
}
union all select distinct from zt000_dummy
association [0..*] to ZC_SlsOrdItemForAccessControl as _Item
  on $projection.SalesOrder = _Item.SalesOrder
{
  key 'S2' as SalesOrder,
      _Item
}
union all select distinct from zt000_dummy
association [0..*] to ZC_SlsOrdItemForAccessControl as _Item
  on $projection.SalesOrder = _Item.SalesOrder
{
  key 'S3' as SalesOrder,
      _Item
}
