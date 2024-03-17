@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Path Expressions'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewWithPathExpressions as select from ZI_SalesOrderScheduleLine
{
    key SalesOrder,
    key SalesOrderItem,
    key SalesOrderScheduleLine,
    _SalesOrderItem,
    _SalesOrderItem.Product as SalesOrderItemProduct,
    _SalesOrderItem._Product,
    _SalesOrderItem._Product.Product,
    _SalesOrderItem._Product._Text
}
