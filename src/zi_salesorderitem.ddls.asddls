@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}



define view entity ZI_SalesOrderItem
  as select from zsalesorderitem

  association [0..1] to ZI_Product                as _Product    on $projection.Product = _Product.Product

  composition [0..*] of ZI_SalesOrderScheduleLine as _ScheduleLine

  association        to parent ZI_SalesOrder      as _SalesOrder on $projection.SalesOrder = _SalesOrder.SalesOrder


{
  key salesorder          as SalesOrder,
  key salesorderitem      as SalesOrderItem,
      product             as Product,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      orderquantity       as OrderQuantity,
      orderquantityunit   as OrderQuantityUnit,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      netamount           as NetAmount,
      transactioncurrency as TransactionCurrency,
      creationdate        as CreationDate,
      _SalesOrder,
      _Product,
      _ScheduleLine
}
