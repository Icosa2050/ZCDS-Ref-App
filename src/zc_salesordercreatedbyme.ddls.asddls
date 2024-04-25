@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View to Orders created by User'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_SalesOrderCreatedByMe
  as select from ZC_SalesOrder
{
  key SalesOrder,
      SalesOrderType,
      CreatedByUser,
      /* Associations */
      _SalesOrder,
      _SalesOrderItem
}
//cloud
where
  CreatedByUser = $session.user;
