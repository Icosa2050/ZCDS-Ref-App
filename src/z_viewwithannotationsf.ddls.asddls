@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with renamed field for consistency'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ]  } */
define view entity Z_VIEWWITHANNOTATIONSF
  as select from Z_ViewWithAnnotationsA
{
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
  key Orderquantity,
      Orderquantityunit,
      cast( 'PC' as abap.unit(3) ) as PieceUnit

}
