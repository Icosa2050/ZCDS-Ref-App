@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with semantic inconsistency'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ]  } */
define view entity Z_ViewWithAnnotationsG
  as select from Z_ViewWithAnnotationsA
{
  key Orderquantity     as Quantity,
      Orderquantityunit as QuantityUnit
}
