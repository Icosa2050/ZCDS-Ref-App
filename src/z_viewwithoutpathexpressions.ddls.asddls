@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View without Path Expressions'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewWithOutPathExpressions as select from ZI_SalesOrderScheduleLine as SL
left outer many to one join ZI_SalesOrderItem as Item
on Item.SalesOrder = SL.SalesOrder
and Item.SalesOrderItem = SL.SalesOrderItem 
left outer many to one join ZI_Product as PROD
on PROD.Product = Item.Product
{
    key SL.SalesOrder,
    key SL.SalesOrderItem,
    key SL.SalesOrderScheduleLine,
    SL._SalesOrderItem,
    Item.Product as SalesOrderItemProduct,
    Item._Product,
    PROD.Product,
    PROD._Text
}
