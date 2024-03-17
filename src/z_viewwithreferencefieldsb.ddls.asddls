@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with reference Fields B'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewWithReferenceFieldsB
  as select from Z_ViewWithReferenceFieldsA
{
  @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
  key Quantity,
  QuantityUnit,
  @Semantics.amount.currencyCode: 'Currency'
  Amount,
  Currency,
  get_numeric_value( Amount )                        as AmountWithoutReference,
  get_numeric_value( Quantity )                      as QuantityWithoutReference,
  @Semantics.amount.currencyCode: 'Currency'
  curr_to_decfloat_amount( Amount )                  as DecfloatAmount,
  @Semantics.quantity.unitOfMeasure: 'CalculatedUnit'
  get_numeric_value( Amount ) / $projection.quantity as AmountPerQuantity,
  cast( concat( Currency,
                concat( '/', QuantityUnit)
    ) as abap.char(50) )                             as CalculatedUnit
}
