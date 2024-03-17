@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with reference Fields'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
//COMMENT information
define view entity Z_ViewWithReferenceFieldsA as select distinct from zt000_dummy
{
   @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
  key abap.quan'1234.56'                            as Quantity,
  abap.unit'PC'                                 as QuantityUnit,
  @Semantics.amount.currencyCode: 'Currency'
  abap.curr'1234.56'                            as Amount,
  abap.cuky'USD'                                as Currency
}
