@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Parameters'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_SalesOrderWithParameters
  with parameters
    P_PARAMETER1A : abap.char(1),
    P_PARAMETER1B : abap.char(1),
    P_PARAMETER1C : abap.char(1)

  as select from ZI_SalesOrder
{
  key SalesOrder,
      SalesOrderType,
      /* Associations */
      _Item
}
