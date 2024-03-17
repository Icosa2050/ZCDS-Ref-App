@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Order Item with Product'
@Metadata.ignorePropagatedAnnotations: true 
define view entity ZC_SalesOrderItemWithProduct 
  as select from ZI_SalesOrderItem as ITEM
  left outer to one join ZI_Product as PROD
    on PROD.Product = ITEM.Product
{
    key ITEM.SalesOrder,
    key ITEM.SalesOrderItem,
        ITEM.Product,
        @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
        ITEM.OrderQuantity,
        ITEM.OrderQuantityUnit,
        PROD.ProductType,
        PROD.CreationDateTime
} 
