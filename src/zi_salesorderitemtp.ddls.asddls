@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Item'
define view entity ZI_SalesOrderItemTP as projection  on ZR_SalesOrderItemTP
{
    key SalesOrder,
    key SalesOrderItem,
    Product,
    OrderQuantity,
    OrderQuantityUnit,
    NetAmount,
    TransactionCurrency,
    @Consumption.hidden: true
    LastChangeDateTime,
    _SalesOrder : redirected to parent ZI_SalesOrderTP,
    _Product
}
