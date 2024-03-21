@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View to be extented with annotations'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true

@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_SalesOrderItem_IC
  as select from ZI_SalesOrderItem
{
  key SalesOrder,
  key SalesOrderItem,
      Product
}
