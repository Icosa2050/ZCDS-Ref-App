@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Annotations based on ViewA'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewWithAnnotationsB
  as select from Z_ViewWithAnnotationsA
{
  key Salesorder,
  key Salesorderitem,
      Product,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      cast( Orderquantity as zmeng15 preserving type ) as OrderQuantity,
      @EndUserText.label: 'Unit'
      Orderquantityunit,
      Creationdate
}
