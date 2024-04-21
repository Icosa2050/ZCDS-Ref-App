@EndUserText.label: 'Sales Order Created Derived Event'
@AccessControl.authorizationCheck: #NOT_ALLOWED
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
serviceQuality: #B,
sizeCategory: #L,
dataClass:#TRANSACTIONAL
}
define view entity ZD_SalesOrderCreatedDerived
  as select from ZR_SalesOrderTP
{
  key SalesOrder,
      SoldToParty
}
