@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Unit Conversion'
define view entity Z_ViewWithUnitConversions

  with parameters
    P_DisplayUnit : msehi

  as select from ZI_SalesOrderItem
{
  key SalesOrder,
  key SalesOrderItem,

      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      OrderQuantity,
      OrderQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityDisplayUnit'
      unit_conversion( quantity       => OrderQuantity,
                             source_unit    => OrderQuantityUnit,
                             target_unit    => $parameters.P_DisplayUnit,
                             error_handling => 'FAIL_ON_ERROR' ) as OrderQuantityInDisplayUnit,
      $parameters.P_DisplayUnit                                  as OrderQuantityDisplayUnit

}
