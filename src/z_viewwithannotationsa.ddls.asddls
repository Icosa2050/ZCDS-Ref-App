@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Annotations'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewWithAnnotationsA
  as select from zsalesorderitem
{
  key salesorder          as Salesorder,
  key salesorderitem      as Salesorderitem,
      product             as Product,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      orderquantity       as Orderquantity,
      orderquantityunit   as Orderquantityunit,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      netamount           as Netamount,
      transactioncurrency as Transactioncurrency,
      //not available ABAP Cloud at 03/19/2024
      //@Semantics.systemDate.createdAt: true
      @Semantics.businessDate.at: true
      creationdate        as Creationdate,
      createdbyuser       as Createdbyuser,
      @Semantics.systemDateTime.createdAt: true
      creationdatetime    as Creationdatetime,
      @Semantics.user.lastChangedBy: true
      lastchangedbyuser   as Lastchangedbyuser,
      @Semantics.systemDateTime.lastChangedAt: true
      lastchangedatetime  as Lastchangedatetime
}
