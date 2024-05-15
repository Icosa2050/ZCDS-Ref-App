@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'View with Search Support'

@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true

define view entity Z_ViewWithSearchSupport

  as select from ZI_SalesOrderItem

{

         @Search.defaultSearchElement: true

         @Search.fuzzinessThreshold: 0.4

         @Search.ranking: #HIGH

  key    SalesOrder,

         @Search.defaultSearchElement: true

         @Search.fuzzinessThreshold: 0.7

         @Search.ranking: #HIGH

         @Consumption.hidden:true

  key    SalesOrderItem                       as SalesOrderItemForSearch,


         //    @Search.defaultSearchElement: true

         //    @Search.fuzzinessThreshold: 0.7

         //    @Search.ranking: #HIGH

  key    concat( SalesOrder, SalesOrderItem ) as SalesOrderItem,

         @Search.defaultSearchElement: true

         @Search.fuzzinessThreshold: 1.0

         @Search.ranking: #MEDIUM

         Product,

         _Product.ProductType,

         @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'

         OrderQuantity,

         OrderQuantityUnit

}
