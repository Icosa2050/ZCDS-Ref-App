@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with OData Exposure'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #B, //transactional
    sizeCategory: #XL, // extra large (less than 100 million records )
    dataClass: #TRANSACTIONAL //volatile data
}
define view entity Z_ViewWithODataExposure
  //depending on the runtime framework of OData, the following annotations may be executed
  with parameters
    @Consumption.hidden: true
    @Environment.systemField: #SYSTEM_DATE
    p_CreationDate : abap.dats
  as select from ZI_SalesOrderItem
{
  key SalesOrder,
  key SalesOrderItem,
      Product,
      CreationDate,
      $parameters.p_CreationDate as ParameterCreationDate,
      /* Associations */
      _Product,
      _ScheduleLine

}
where
  CreationDate = $parameters.p_CreationDate;
