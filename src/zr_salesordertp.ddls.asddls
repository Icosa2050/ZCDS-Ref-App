@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order'
define root view entity ZR_SalesOrderTP
  as select from ZI_SalesOrder
  composition [0..*] of ZR_SalesOrderItemTP as _Item
  association [0..1] to ZI_Customer         as _SoldToParty
    on $projection.SoldToParty = _SoldToParty.Customer
  association [1]    to ZI_USER                as _CreatedByUser
    on $projection.CreatedByUser = _CreatedByUser.Userid
  association [1]    to ZI_USER                as _LastChangedByUser
    on $projection.LastChangedByUser = _LastChangedByUser.Userid
{
  key ZI_SalesOrder.SalesOrder,
      ZI_SalesOrder.SalesOrderType,
      ZI_SalesOrder.SalesOrganization,
      ZI_SalesOrder.SoldToParty,
      ZI_SalesOrder.DistributionChannel,
      ZI_SalesOrder.OrganizationDivision,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZI_SalesOrder.NetAmount,
      ZI_SalesOrder.TransactionCurrency,
      ZI_SalesOrder.DeliveryStatus,
      //@Semantics.booleanIndicator: true
      ZI_SalesOrder.DeletionIndicator,
      @Semantics.user.createdBy: true
      ZI_SalesOrder.CreatedByUser,
      @Semantics.systemDateTime.createdAt: true
      ZI_SalesOrder.CreationDateTime,
      @Semantics.user.lastChangedBy: true
      ZI_SalesOrder.LastChangedByUser,
      @Semantics.systemDateTime.lastChangedAt: true
      ZI_SalesOrder.LastChangeDateTime,
      _Item,
      _SoldToParty,
      _CreatedByUser,
      _LastChangedByUser
}
